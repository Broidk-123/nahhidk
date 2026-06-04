local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Liquid Hub | MM2", -- window title
    Icon = "door-open", -- lucide icon or "rbxassetid://" or URL. optional
    Author = "by Takgoo", -- window subtitle. optional
    Folder = "Liquid", -- folder to save keys and images
    
    Size = UDim2.fromOffset(580, 460), -- window size
    MinSize = Vector2.new(560, 350), -- minimal window size
    MaxSize = Vector2.new(850, 560), -- maximum window size
    Transparent = true, -- window transparency
    Theme = "Sky", -- library theme
    Resizable = true, -- the ability to rezize window
    SideBarWidth = 200, -- sidebar (tabs) width
    HideSearchBar = false,
    ScrollBarEnabled = true, -- scrollbars that are located to the right of the scroll frame
 
    --[[BackgroundImageTransparency = 0.42, -- background image transparency
    Background = "rbxassetid://1234", -- rbxassetid]]
    
    User = { -- user information located at the bottom left
        Enabled = true, -- can be toggled with Window.User:Enable() or Window.User:Disable()
        Anonymous = true, -- can be toggled with Window.User:SetAnonymous(true) --(true or false)
        Callback = function() -- callback on click. optional. it can be removed
            print("clicked to the 'user icon'")
        end,
    },
    
})

local MM2TAB = {
  
  local Info = Window:Tab({
    Title = "Info",
    Icon = "info", -- optional
    ShowTabTitle = true,
    Border = true,
})
  Window:Divider()
  local Main = Window:Tab({
      Title = "Main",
      Icon = "house",
      ShowTabTitle = true,
      Border = true,
    })
    local TP = Window:Tab({
            Title = "Teleport",
            Icon = "locate",
            ShowTabTitle = true,
            Border = true,
        })
  local Settings = Window:Tab({
      Title = "Settings",
      Icon = "settings",
      ShowTabTitle = true,
      Border = true,
    })

}

local Mrd = MM2TAB.Main:Section({
        Title = "Murderer",
        Desc = "Murderer actions, this if you're a murderer",
        Icon = "sword",
        Box = true,
        BoxBorder = true,
    })

Mrd:Button({
        Title = "Kill All",
        Desc = "HOLD KNIFE",
        Callback = function()
            local Players = game:GetService("Players")

    local LocalPlayer = Players.LocalPlayer

    local function findMurderer()

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer and player.Backpack:FindFirstChild("Knife") or (player.Character and player.Character:FindFirstChild("Knife")) then

                return player

            end

        end

        return nil

    end

    local function killAll()

        if findMurderer() ~= LocalPlayer then 

            return 

        end

        local character = LocalPlayer.Character

        if not character or not character:FindFirstChild("HumanoidRootPart") then return end

        local knife = character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")

        if not knife then

            return

        end

        --  If a knife is in the bag, it will automatically be put on.
        if knife.Parent == LocalPlayer.Backpack then

            local humanoid = character:FindFirstChild("Humanoid")

            if humanoid then

                humanoid:EquipTool(knife)

            end

        end

        -- Kill all the players

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

                local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")

                enemyRoot.Anchored = true

                enemyRoot.CFrame = character:FindFirstChild("HumanoidRootPart").CFrame + character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1

            end

        end

        local args = { [1] = "Slash" }

        knife.Stab:FireServer(unpack(args))

    end

    killAll()
        })

Mrd:Button({
            Title = "Kill Sheriff",
            Desc = "HOLD KNIFE",
            Callback = function()
                local Players = game:GetService("Players")

    local LocalPlayer = Players.LocalPlayer

    local function findMurderer()

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer and player.Backpack:FindFirstChild("Knife") or (player.Character and player.Character:FindFirstChild("Knife")) then

                return player

            end

        end

        return nil

    end

    local function hasGun(player)

        return player.Backpack:FindFirstChild("Gun") or (player.Character and player.Character:FindFirstChild("Gun"))

    end

    local function killAll()

        if findMurderer() ~= LocalPlayer then 

            return 

        end

        local character = LocalPlayer.Character

        if not character or not character:FindFirstChild("HumanoidRootPart") then return end

        local knife = character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")

        if not knife then

            return

        end

        -- If a knife is in the bag, it will automatically be put on.

        if knife.Parent == LocalPlayer.Backpack then

            local humanoid = character:FindFirstChild("Humanoid")

            if humanoid then

                humanoid:EquipTool(knife)

            end

        end

        -- Only kill players who have "Gun" in their inventory.

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer and hasGun(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

                local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")

                enemyRoot.Anchored = true

                enemyRoot.CFrame = character:FindFirstChild("HumanoidRootPart").CFrame + character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1

            end

        end

        local args = { [1] = "Slash" }

        knife.Stab:FireServer(unpack(args))

    end

    killAll()
            })

Mrd:Button({
            Title = "Kill Innocents",
            Desc = "HOLD KNIFE",
            Callback = function()
                    local Players = game:GetService("Players")

    local LocalPlayer = Players.LocalPlayer

    local anchoredPlayers = {}

    local function findMurderer()

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer and player.Backpack:FindFirstChild("Knife") or (player.Character and player.Character:FindFirstChild("Knife")) then

                return player

            end

        end

        return nil

    end

    local function hasGun(player)

        return player.Backpack:FindFirstChild("Gun") or (player.Character and player.Character:FindFirstChild("Gun"))

    end

    local function killAll()

        if findMurderer() ~= LocalPlayer then 

            return 

        end

        local character = LocalPlayer.Character

        if not character or not character:FindFirstChild("HumanoidRootPart") then return end

        local knife = character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")

        if not knife then

            return

        end

        -- EÃ„Å¸er bÃ„Â±ÃƒÂ§ak ÃƒÂ§antadaysa, otomatik olarak kuÃ…Å¸an

        if knife.Parent == LocalPlayer.Backpack then

            local humanoid = character:FindFirstChild("Humanoid")

            if humanoid then

                humanoid:EquipTool(knife)

            end

        end

        -- Sadece envanterinde "Gun" OLMAYAN oyuncularÃ„Â± ÃƒÂ¶ldÃƒÂ¼r ve geÃƒÂ§ici olarak dondur

        for _, player in ipairs(Players:GetPlayers()) do

            if player ~= LocalPlayer and not hasGun(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

                local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")

                anchoredPlayers[player] = enemyRoot -- Sonradan serbest bÃ„Â±rakmak iÃƒÂ§in kaydet

                enemyRoot.Anchored = true

                enemyRoot.CFrame = character:FindFirstChild("HumanoidRootPart").CFrame + character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1

            end

        end

        local args = { [1] = "Slash" }

        knife.Stab:FireServer(unpack(args))

        -- 2 saniye sonra herkesi serbest bÃ„Â±rak

        task.delay(2, function()

            for player, rootPart in pairs(anchoredPlayers) do

                if rootPart then

                    rootPart.Anchored = false

                end

            end

            anchoredPlayers = {} -- Listeyi temizle

        end)

    end

    killAll()
  })
