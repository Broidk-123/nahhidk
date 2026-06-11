-- Supermarket Simulator Hub

local _version = "1.6.64-fix"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))()

repeat task.wait() until game:IsLoaded()

-- ─────────────────────────────────────────
-- SERVICES
-- ─────────────────────────────────────────

local Players       = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")

local LocalPlayer   = Players.LocalPlayer
local Events        = ReplicatedStorage:WaitForChild("Events")

-- ─────────────────────────────────────────
-- WINDOW
-- ─────────────────────────────────────────

local Window = WindUI:CreateWindow({
    Title   = "Liquid Hub | Supermarket Simulator",
    Icon    = "rbxassetid://109069296276521",
    Author  = "by Liquid Devs",
    Acrylic = true,
    Theme   = "Dark",
    ToggleKey = Enum.KeyCode.RightAlt,
})

-- ─────────────────────────────────────────
-- TABS
-- ─────────────────────────────────────────

local Tabs = {}

Tabs.Main     = Window:Tab({ Title = "Main",     Icon = "command" })
Tabs.Products = Window:Tab({ Title = "Products", Icon = "shopping-cart" })
Tabs.Cashier  = Window:Tab({ Title = "Cashier",  Icon = "user" })
Tabs.Misc     = Window:Tab({ Title = "Misc",     Icon = "apple" })
Tabs.Credits  = Window:Tab({ Title = "Credits",  Icon = "contact" })

-- ─────────────────────────────────────────
-- HELPER FUNCTIONS
-- ─────────────────────────────────────────

-- Gets the player's UserId as a string (used as key in workspace.Resources)
local function getPlayerIdStr()
    return tostring(LocalPlayer.UserId)
end

-- Extracts a number from a string like "$12.50"
local function parseNumberFromText(text)
    local num = text:match("([%d%.]+)")
    return num and tonumber(num) or 0
end

-- Returns a list of product names from the shop GUI's item scroll frame
local function getShopProductList()
    local scrollFrame = LocalPlayer.PlayerGui.ShopGUI.BackGround.MenuBg.ShopMenu
        .ShopItemFrame.ItemFrame.ItemScrollingBar
    local productNames = {}
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            table.insert(productNames, child.Name)
        end
    end
    return productNames
end

-- Finds a product model inside workspace.Resources[playerId].Product by name
local function findProductInResources(playerId, productName)
    local resourceFolder = workspace.Resources[playerId]
    if resourceFolder and resourceFolder.Product then
        for _, item in ipairs(resourceFolder.Product:GetChildren()) do
            if item:IsA("Model") and item.Name:find(productName) then
                return item
            end
        end
    end
    return nil
end

-- Checks whether the player is currently carrying something
local function isPlayerCarrying(playerId)
    return workspace.Resources[playerId].Carried:FindFirstChildOfClass("Model") ~= nil
end

-- Finds an empty shelf slot in the player's building
local function findEmptyShelfSlot(playerId)
    local building = workspace.Resources[playerId].Building
    for _, shelf in ipairs(building:GetChildren()) do
        if shelf:FindFirstChild("DetectorFolder") then
            for _, detector in ipairs(shelf.DetectorFolder:GetChildren()) do
                if detector:FindFirstChild("Attachment_1")
                    and detector.Attachment_1:FindFirstChild("ProductValue")
                    and detector.Attachment_1.ProductValue.Value == nil then
                    return detector, shelf
                end
            end
        end
    end
    return nil, nil
end

-- Finds the player's cashier place in workspace.Places
local function findPlayerCashierPlace()
    local playerName = LocalPlayer.Name
    for _, place in pairs(workspace.Places:GetChildren()) do
        if place:FindFirstChild("PlayerInfo")
            and place.PlayerInfo:FindFirstChild("SurfaceGui")
            and place.PlayerInfo.SurfaceGui.PlayerName.Text == playerName then
            return place
        end
    end
    return nil
end

-- Sets the visibility/transparency of all parts in a product model
local function setModelVisibility(model, visible)
    if not model:IsA("Model") then return end

    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.LocalTransparencyModifier = visible and 0 or 1
        elseif part:IsA("BillboardGui") or part:IsA("SurfaceGui") then
            part.Enabled = visible
        elseif part:IsA("ImageLabel") or part:IsA("Frame") then
            part.Visible = visible
        end

        if part.Name == "CollidePart" or part.Name == "TranPart" or part.Name == "StorageFolder" then
            for _, subPart in ipairs(part:GetDescendants()) do
                if subPart:IsA("BasePart") or subPart:IsA("Decal") then
                    subPart.LocalTransparencyModifier = visible and 0 or 1
                end
            end
        end
    end

    local detectorFolder = model:FindFirstChild("DetectorFolder")
    if detectorFolder then
        for _, part in ipairs(detectorFolder:GetDescendants()) do
            if part:IsA("BasePart") then
                part.LocalTransparencyModifier = visible and 0 or 1
            end
        end
    end
end

-- ─────────────────────────────────────────
-- MAIN TAB — MONEY
-- ─────────────────────────────────────────

local MoneySection = Tabs.Main:Section({ Title = "Infinite Money" })

MoneySection:Input({
    Title       = "Set Money Amount",
    Desc        = "Enter a custom amount to set your gold to",
    Placeholder = "Enter amount here...",
    Callback    = function(inputValue)
        local amount = tonumber(inputValue)
        if amount then
            Events.Gold.ChangeGoldRF:InvokeServer("ChangeGold", amount, false)
        end
    end,
})

MoneySection:Button({
    Title    = "Get Max Money",
    Desc     = "Sets money to maximum value",
    Icon     = "coins",
    Callback = function()
        Events.Gold.ChangeGoldRF:InvokeServer("ChangeGold", 9000000000, false)
    end,
})

-- ─────────────────────────────────────────
-- PRODUCTS TAB — PRODUCT MANAGER
-- ─────────────────────────────────────────

local ProductManagerSection = Tabs.Products:Section({ Title = "Product Manager" })

ProductManagerSection:Paragraph({
    Title = "Product Information",
    Desc  = "Make sure you are on the correct shop page (e.g. Christmas, Shelf, etc) before refreshing the product list. Products shown are based on your current shop page. This also applies to the Auto Stock Shelves toggle.",
})

local selectedProduct  = nil
local purchaseAmount   = 1
local purchaseCooldown = 2

local productDropdown = ProductManagerSection:Dropdown({
    Title   = "Select Product",
    Desc    = "If you don't see the product, refresh the list or open the shop first",
    Values  = getShopProductList(),
    Default = "",
    Multi   = false,
    Callback = function(value)
        selectedProduct = value
    end,
})

ProductManagerSection:Button({
    Title    = "Refresh Product List",
    Desc     = "Update the product list from the current shop page",
    Icon     = "refresh-cw",
    Callback = function()
        productDropdown:SetValues(getShopProductList())
        WindUI:Notify({
            Title    = "Product List",
            Content  = "Product list has been refreshed!",
            Duration = 2,
        })
    end,
})

ProductManagerSection:Slider({
    Title    = "Purchase Amount",
    Desc     = "How many of each product to purchase",
    Value    = { Min = 1, Max = 100, Default = 1 },
    Callback = function(value)
        purchaseAmount = value
    end,
})

ProductManagerSection:Slider({
    Title    = "Purchase Cooldown (seconds)",
    Desc     = "Delay between auto purchases. Don't set too low or it may cause lag",
    Value    = { Min = 1, Max = 5, Default = 2 },
    Callback = function(value)
        purchaseCooldown = value
    end,
})

-- Builds the purchase table for a single purchase fire
local function buildPurchaseTable()
    local purchaseData = {}
    if selectedProduct then
        purchaseData[selectedProduct] = purchaseAmount
    else
        for _, productName in ipairs(getShopProductList()) do
            purchaseData[productName] = purchaseAmount
        end
    end
    return purchaseData
end

ProductManagerSection:Toggle({
    Title    = "Auto Purchase",
    Desc     = "Continuously purchase products. Buys all if no product is selected",
    Icon     = "repeat",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoPurchase = isEnabled
        while _G.AutoPurchase and task.wait(purchaseCooldown) do
            Events.Data.BuyShopGoodsRE:FireServer(buildPurchaseTable())
        end
    end,
})

ProductManagerSection:Button({
    Title    = "Purchase Once",
    Desc     = "Make a single purchase of the selected product",
    Icon     = "shopping-bag",
    Callback = function()
        Events.Data.BuyShopGoodsRE:FireServer(buildPurchaseTable())
    end,
})

-- ─────────────────────────────────────────
-- PRODUCTS TAB — STORE MANAGEMENT
-- ─────────────────────────────────────────

local StoreSection = Tabs.Products:Section({ Title = "Store Management" })

local profitMargin = 2

StoreSection:Input({
    Title       = "Profit Margin ($)",
    Desc        = "Additional profit to add above cost price when auto-pricing",
    Placeholder = "Enter profit margin...",
    Default     = "2",
    Callback    = function(inputValue)
        local value = tonumber(inputValue)
        if value then
            profitMargin = value
            WindUI:Notify({
                Title    = "Profit Margin",
                Content  = "Set to $" .. value,
                Duration = 2,
            })
        end
    end,
})

-- Reads the current price GUI and sets the price automatically
local function autoSetCurrentPrice()
    local priceGui = LocalPlayer.PlayerGui.PriceSetGui.Main
    if priceGui.Visible then
        local productName = priceGui.Information.ProductInfo.ProductName.Text
        local costPrice   = parseNumberFromText(priceGui.Information.PriceInfo.AvgCost.CostPriceTL.Text)
        if costPrice > 0 then
            local finalPrice = costPrice + profitMargin
            local playerId   = getPlayerIdStr()
            workspace.Resources[playerId].PriceRE:FireServer("SetPrice", productName, finalPrice)
            workspace.Resources[playerId].PriceBE:Fire("ShowPriceGui", productName, false)
            Events.Screen.ScreenCtrlBE:Fire("ChangeCenterPointVisible", true)
        end
    end
end

StoreSection:Toggle({
    Title    = "Auto Set Prices",
    Desc     = "Automatically sets price when the pricing GUI appears",
    Icon     = "tag",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoPrice = isEnabled
        while _G.AutoPrice and task.wait(0.1) do
            autoSetCurrentPrice()
        end
    end,
})

StoreSection:Toggle({
    Title    = "Auto Stock Shelves",
    Desc     = "Automatically picks up boxes and stocks shelves",
    Icon     = "package",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoStock = isEnabled
        while _G.AutoStock and task.wait(0.5) do
            local playerId       = getPlayerIdStr()
            local resourceFolder = workspace.Resources[playerId]
            local productList    = getShopProductList()

            -- If not carrying anything, try to pick up a box
            if not isPlayerCarrying(playerId) then
                for _, productName in ipairs(productList) do
                    local productModel = findProductInResources(playerId, productName)
                    if productModel then
                        resourceFolder.ScreenRE:FireServer("TakeBox", productModel)
                        task.wait(0.5)
                        break
                    end
                end
            end

            -- If carrying something, stock the nearest empty shelf
            local carriedItem = isPlayerCarrying(playerId)
                and resourceFolder.Carried:FindFirstChildOfClass("Model")
            if carriedItem then
                local emptySlot, shelfModel = findEmptyShelfSlot(playerId)
                if emptySlot and shelfModel then
                    resourceFolder.ScreenRE:FireServer("PutProduct", carriedItem, emptySlot, shelfModel)
                    task.wait(0.5)
                end
            end
        end
    end,
})

-- ─────────────────────────────────────────
-- CASHIER TAB
-- ─────────────────────────────────────────

local CashierSection = Tabs.Cashier:Section({ Title = "Cashier" })

local lastProcessedCustomer = nil

-- Core function: handles one cashier transaction cycle
local function processCashierTransaction()
    local cashierPlace = findPlayerCashierPlace()
    if not cashierPlace then return end

    local cashierDesk   = cashierPlace.Machine.CashierDesk
    if not cashierDesk then return end

    local actionCustomer = cashierDesk:FindFirstChild("ActionCustomer")
    if not actionCustomer then return end

    -- Find the current customer ObjectValue
    local currentCustomerValue = nil
    for _, child in pairs(actionCustomer:GetChildren()) do
        if child:IsA("ObjectValue") then
            currentCustomerValue = child
            break
        end
    end

    if currentCustomerValue and currentCustomerValue.Value then
        if currentCustomerValue.Value ~= lastProcessedCustomer then
            local playerId      = getPlayerIdStr()
            local productFolder = cashierDesk.ProductFolder

            -- Click all goods detectors (scan items)
            if productFolder then
                for _, item in ipairs(productFolder:GetChildren()) do
                    if item:FindFirstChild("PP") and item.PP:FindFirstChild("GoodsClickDetector") then
                        fireclickdetector(item.PP.GoodsClickDetector)
                        task.wait(0.1)
                    end
                end
            end

            -- Find the customer model and handle payment
            local customerFolder = workspace.Resources[playerId].Customer
            for _, customer in pairs(customerFolder:GetChildren()) do
                if customer == currentCustomerValue.Value then
                    local computerScreen = cashierDesk.Computer.ComputerScreen
                        .ComputerSurfaceGui.ComputerFrame

                    if customer:FindFirstChild("CashModel") then
                        local cashModel = customer.CashModel
                        if cashModel:FindFirstChild("PP") and cashModel.PP:FindFirstChild("CashClickDetector") then
                            fireclickdetector(cashModel.PP.CashClickDetector)
                            task.wait(0.1)
                            local change = parseNumberFromText(
                                computerScreen.PaymentCashFrame.ChangeFrame.ChangeTotal.Text)
                            if change > 0 then
                                Events.Payment.PaymentFinishRE:FireServer("PaidFinish", change)
                                lastProcessedCustomer = currentCustomerValue.Value
                            end
                        end

                    elseif customer:FindFirstChild("CardModel") then
                        local cardModel = customer.CardModel
                        if cardModel:FindFirstChild("PP") and cardModel.PP:FindFirstChild("CardClickDetector") then
                            fireclickdetector(cardModel.PP.CardClickDetector)
                            task.wait(0.1)
                            local total = parseNumberFromText(
                                computerScreen.PaymentCardFrame.TotalFrame.CardTotal.Text)
                            if total > 0 then
                                Events.Payment.PaymentFinishRE:FireServer("PaidFinish", total)
                                lastProcessedCustomer = currentCustomerValue.Value
                            end
                        end

                    else
                        local change = parseNumberFromText(
                            computerScreen.PaymentCashFrame.ChangeFrame.ChangeTotal.Text)
                        if change == 0 then
                            Events.Payment.PaymentFinishRE:FireServer("PaidFinish", change)
                            lastProcessedCustomer = currentCustomerValue.Value
                        end
                    end

                    return
                end
            end
        end
    end
end

CashierSection:Toggle({
    Title    = "Auto Cashier",
    Desc     = "Automatically handles customer transactions. Make sure you are at the cashier position first",
    Icon     = "zap",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoCashier = isEnabled
        while _G.AutoCashier and task.wait(0.1) do
            processCashierTransaction()
        end
    end,
})

CashierSection:Button({
    Title    = "Exit Cashier",
    Desc     = "Exits from the cashier position",
    Icon     = "log-out",
    Callback = function()
        Events.Payment.ChangeCashierStatusRE:FireServer("ChangeCashierStatus", false)
        Events.Screen.ScreenCtrlBE:Fire("ChangeCenterPointVisible", true)
    end,
})

CashierSection:Toggle({
    Title    = "Payment UI Visible",
    Desc     = "Toggle the payment method UI on/off",
    Icon     = "eye",
    Default  = true,
    Callback = function(isEnabled)
        local paymentGui = LocalPlayer.PlayerGui:FindFirstChild("PaymentGui")
        if paymentGui then
            paymentGui.PaymentMethod.Visible = isEnabled
        end
    end,
})

CashierSection:Toggle({
    Title    = "Auto Enter Cashier",
    Desc     = "Automatically enters the cashier position when the day changes",
    Icon     = "log-in",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoEnterCashier = isEnabled
        while _G.AutoEnterCashier and task.wait(0.1) do
            Events.Payment.ChangeCashierStatusRE:FireServer("ChangeCashierStatus", true)
            Events.Payment.EnterCashierDeskBE:Fire(LocalPlayer, "EnterCashierDesk")
            Events.Functions.Place.PlaceRF:InvokeServer("GetPlaceModel")
            Events.Screen.ScreenCtrlBE:Fire("ChangeCenterPointVisible", false)
        end
    end,
})

-- ─────────────────────────────────────────
-- MISC TAB
-- ─────────────────────────────────────────

local MiscSection = Tabs.Misc:Section({ Title = "Visuals" })

-- Iterates through all shelves in Building and toggles product visibility
local function toggleShelfProductVisibility(visible)
    local playerId = getPlayerIdStr()
    local building = workspace.Resources[playerId].Building

    for _, shelf in ipairs(building:GetChildren()) do
        if shelf:FindFirstChild("DetectorFolder") then
            for _, detector in ipairs(shelf.DetectorFolder:GetChildren()) do
                for _, attachment in ipairs(detector:GetChildren()) do
                    if attachment:IsA("Attachment") then
                        local productValue = attachment:FindFirstChild("ProductValue")
                        if productValue and productValue.Value then
                            setModelVisibility(productValue.Value, visible)
                        end
                    end
                end
            end
        end
    end
end

-- Iterates through all shelves AND resource products and toggles visibility
local function toggleAllProductVisibility(visible)
    local playerId = getPlayerIdStr()
    local building = workspace.Resources[playerId].Building
    local product  = workspace.Resources[playerId].Product

    -- Shelf products
    for _, shelf in ipairs(building:GetChildren()) do
        if shelf:FindFirstChild("DetectorFolder") then
            for _, detector in ipairs(shelf.DetectorFolder:GetChildren()) do
                for _, attachment in ipairs(detector:GetChildren()) do
                    if attachment:IsA("Attachment") then
                        local productValue = attachment:FindFirstChild("ProductValue")
                        if productValue and productValue.Value then
                            setModelVisibility(productValue.Value, visible)
                        end
                    end
                end
            end
        end
    end

    -- Resource folder products
    for _, item in ipairs(product:GetChildren()) do
        if item:IsA("Model") then
            setModelVisibility(item, visible)
        end
    end
end

MiscSection:Toggle({
    Title    = "Hide Shelf Products",
    Desc     = "Hides products on shelves (only visible to you, others still see them)",
    Icon     = "eye-off",
    Default  = false,
    Callback = function(isEnabled)
        if isEnabled then
            if not _G.ShelfVisibilityLoop then
                _G.ShelfVisibilityLoop = task.spawn(function()
                    while task.wait(0.1) and _G.ShelfVisibilityLoop do
                        toggleShelfProductVisibility(false)
                    end
                end)
            end
        else
            if _G.ShelfVisibilityLoop then
                task.cancel(_G.ShelfVisibilityLoop)
                _G.ShelfVisibilityLoop = nil
            end
            toggleShelfProductVisibility(true)

            if _G.ShelfProductConnection then
                _G.ShelfProductConnection:Disconnect()
                _G.ShelfProductConnection = nil
            end
        end
    end,
})

MiscSection:Toggle({
    Title    = "Hide All Products",
    Desc     = "Hides products on shelves AND in resources (only visible to you)",
    Icon     = "eye-off",
    Default  = false,
    Callback = function(isEnabled)
        if isEnabled then
            if not _G.ProductVisibilityLoop then
                _G.ProductVisibilityLoop = task.spawn(function()
                    while task.wait(0.1) and _G.ProductVisibilityLoop do
                        toggleAllProductVisibility(false)
                    end
                end)
            end
        else
            if _G.ProductVisibilityLoop then
                task.cancel(_G.ProductVisibilityLoop)
                _G.ProductVisibilityLoop = nil
            end
            toggleAllProductVisibility(true)

            if _G.ShelfProductConnection then
                _G.ShelfProductConnection:Disconnect()
                _G.ShelfProductConnection = nil
            end
            if _G.ResourceProductConnection then
                _G.ResourceProductConnection:Disconnect()
                _G.ResourceProductConnection = nil
            end
        end
    end,
})

-- ─────────────────────────────────────────
-- CREDITS TAB
-- ─────────────────────────────────────────

Tabs.Credits:Paragraph({
    Title = "Script by Lomu",
    Desc  = "Credits to the original author of the script.",
})

Tabs.Credits:Paragraph({
    Title = "Migrated by Claude AI",
    Desc  = "UI migrated from Fluent to WindUI with clean variable names.",
})
