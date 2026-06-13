local CustomOpenButtonGui

local function createCustomOpenButton()
	if CustomOpenButtonGui then return end
	CustomOpenButtonGui = Instance.new("ScreenGui")
	CustomOpenButtonGui.Name = "LiquidHub_CustomOpenButton"
	CustomOpenButtonGui.Parent = getGuiParent()
	CustomOpenButtonGui.ResetOnSpawn = false
	CustomOpenButtonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local button = Instance.new("ImageButton")
	button.Name = "CustomOpenBtn"
	button.Size = UDim2.new(0, 50, 0, 50)
	button.Position = UDim2.new(0.1, 0, 0.05, 0)
	button.BackgroundColor3 = Color3.fromRGB(20, 30, 45)
	button.Image = "rbxassetid://109069296276521"
	button.ImageColor3 = Color3.fromRGB(255, 255, 255)
	button.ScaleType = Enum.ScaleType.Fit
	button.Parent = CustomOpenButtonGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = button

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(14, 165, 233)
	stroke.Thickness = 2
	stroke.Parent = button

	local dragging, dragStart, startPos = false, nil, nil
	button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = button.Position
		end
	end)
	button.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
	button.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	button.MouseButton1Click:Connect(function()
		if Window then Window:Toggle() end
	end)
end

local _version = "1.6.64-fix"
local WindUI   = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"
))()

repeat task.wait() until game:IsLoaded()

-- ─────────────────────────────────────────────────
-- SERVICES
-- ─────────────────────────────────────────────────

local Players          = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TeleportService  = game:GetService("TeleportService")
local RunService       = game:GetService("RunService")
local VirtualUser      = game:GetService("VirtualUser")

local LocalPlayer      = Players.LocalPlayer
local Events           = ReplicatedStorage.rEvents

-- ─────────────────────────────────────────────────
-- PLACE IDs
-- ─────────────────────────────────────────────────

local PLACE = {
    City   = 3101667897,
    Space  = 3232996272,
    Desert = 3276265788,
}

-- ─────────────────────────────────────────────────
-- WINDOW
-- ─────────────────────────────────────────────────

local Window = WindUI:CreateWindow({
    Title     = "Liquid Hub | Legend of Speed",
    Icon      = "rbxassetid://109069296276521",
    Author    = "by Liquid Devs",
    Acrylic   = true,
    Theme     = "Sky",
    ToggleKey = Enum.KeyCode.RightAlt,
    NewElements = true,
    Resizable = true,
    HideSearchBar = false,
    ScrollBarEnabled = true,

        Topbar = {
            ButtonsType = "Mac",
            Height = 45,
        },

        OpenButton = {
            Enabled = false,
            }
})


-- ─────────────────────────────────────────────────
-- TABS
-- ─────────────────────────────────────────────────

local Tabs = {
    Main      = Window:Tab({ Title = "Main",       Icon = "home"         }),
    AutoFarm  = Window:Tab({ Title = "Auto Farm",  Icon = "repeat"       }),
    Teleport  = Window:Tab({ Title = "Teleport",   Icon = "map-pin"      }),
    Race      = Window:Tab({ Title = "Race",       Icon = "flag"         }),
    Crystal   = Window:Tab({ Title = "Crystal",   Icon = "gem"          }),
    Misc      = Window:Tab({ Title = "Misc",       Icon = "settings"     }),
    Credits   = Window:Tab({ Title = "Credits",    Icon = "heart"        }),
    Help      = Window:Tab({ Title = "Glitch Help",Icon = "help-circle"  }),
}

-- ─────────────────────────────────────────────────
-- ANTI AFK
-- ─────────────────────────────────────────────────

LocalPlayer.Idled:Connect(function()
    while task.wait(5) do
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
end)

-- ─────────────────────────────────────────────────
-- NO CLIP LOOP (runs always, toggled via _G)
-- ─────────────────────────────────────────────────

RunService.Stepped:Connect(function()
    if not _G.NoClip then return end
    local character = LocalPlayer.Character
    if not character then return end
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end)

-- ─────────────────────────────────────────────────
-- HELPER: Open a crystal by name
-- ─────────────────────────────────────────────────

local function openCrystal(crystalName)
    Events.openCrystalRemote:InvokeServer("openCrystal", crystalName)
end

-- ─────────────────────────────────────────────────
-- HELPER: Sell all pets except one protected name
-- ─────────────────────────────────────────────────

local function sellAllPetsExcept(protectedName)
    for _, rankFolder in pairs(LocalPlayer.petsFolder:GetChildren()) do
        for _, pet in pairs(rankFolder:GetChildren()) do
            if pet.Name ~= protectedName then
                Events.sellPetEvent:FireServer(
                    "sellPet",
                    LocalPlayer.petsFolder[rankFolder.Name]:FindFirstChild(pet.Name)
                )
            end
        end
    end
end

-- ─────────────────────────────────────────────────
-- HELPER: Sell all trails
-- ─────────────────────────────────────────────────

local function sellAllTrails()
    for _, rankFolder in pairs(LocalPlayer.trailsFolder:GetChildren()) do
        for _, trail in pairs(rankFolder:GetChildren()) do
            Events.sellTrailEvent:FireServer(
                "sellTrail",
                LocalPlayer.trailsFolder[rankFolder.Name]:FindFirstChild(trail.Name)
            )
        end
    end
end

-- ─────────────────────────────────────────────────
-- AUTO SELL / OPEN LOOPS (always running, flag-gated)
-- ─────────────────────────────────────────────────

task.spawn(function()
    while task.wait() do
        if _G.AutoSellAllTrails then sellAllTrails() end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoSellAllPets    then sellAllPetsExcept("Ultra Birdie")             end
        if _G.BunnyFarm          then sellAllPetsExcept("Ultimate Overdrive Bunny") end
        if _G.AutoUnique         then
            for _, rankFolder in pairs(LocalPlayer.petsFolder:GetChildren()) do
                if rankFolder.Name ~= "Unique" then
                    for _, pet in pairs(rankFolder:GetChildren()) do
                        Events.sellPetEvent:FireServer(
                            "sellPet",
                            LocalPlayer.petsFolder[rankFolder.Name]:FindFirstChild(pet.Name)
                        )
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.OpenBirdieEgg   then openCrystal("Electro Crystal")         end
        if _G.OpenVoidEgg     then openCrystal("Desert Crystal")          end
        if _G.OpenLegendsEgg  then openCrystal("Electro Legends Crystal") end
    end
end)

-- ─────────────────────────────────────────────────
-- RACE EVENTS (always listening, flag-gated)
-- ─────────────────────────────────────────────────

ReplicatedStorage.raceInProgress.Changed:Connect(function(state)
    if not getgenv().AutoRace or not state then return end
    Events.raceEvent:FireServer("joinRace")
    task.wait()
    LocalPlayer.PlayerGui.gameGui.raceJoinLabel.Visible = false
end)

ReplicatedStorage.raceStarted.Changed:Connect(function(state)
    if not getgenv().AutoRace or not state then return end
    for _, raceMap in pairs(workspace.raceMaps:GetChildren()) do
        local oldFinishCFrame = raceMap.finishPart.CFrame
        raceMap.finishPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait()
        raceMap.finishPart.CFrame = oldFinishCFrame
    end
end)

-- ═════════════════════════════════════════════════
-- MAIN TAB
-- ═════════════════════════════════════════════════

local MainSection    = Tabs.Main:Section({ Title = "Info", Icon = "info", Box = true, BoxBorder = true })
local PlayerSection  = Tabs.Main:Section({ Title = "Player", Icon = "user", Box = true, BoxBorder = true })
local TradingSection = Tabs.Main:Section({ Title = "Trading", Icon = "repeat", Box = true, BoxBorder = true })
local ChestSection   = Tabs.Main:Section({ Title = "Chests", Icon = "box", Box = true, BoxBorder = true })

-- Game time label
--[[local GameTimeLabel = MainSection:Paragraph({ Title = "Game Time", Desc = "Loading..." })
task.spawn(function()
    while task.wait(1) do
        local gameTime = math.floor(workspace.DistributedGameTime + 0.5)
        local hours    = math.floor(gameTime / 3600) % 24
        local minutes  = math.floor(gameTime / 60)   % 60
        local seconds  = gameTime % 60
        GameTimeLabel:Update({
            Title = "Game Time",
            Desc  = string.format("Hours: %d  |  Minutes: %02d  |  Seconds: %02d", hours, minutes, seconds),
        })
    end
end)

-- FPS label
local FpsLabel = MainSection:Paragraph({ Title = "FPS", Desc = "Loading..." })
task.spawn(function()
    while task.wait(0.1) do
        FpsLabel:Update({
            Title = "FPS",
            Desc  = string.format("%.1f fps", workspace:GetRealPhysicsFPS()),
        })
    end
end)

-- Ping label
local PingLabel = MainSection:Paragraph({ Title = "Ping", Desc = "Loading..." })
task.spawn(function()
    while task.wait(0.1) do
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        PingLabel:Update({
            Title = "Ping",
            Desc  = ping .. " ms",
        })
    end
end)
]]


-- Player section
local playerList   = {}
local targetPlayer = nil

for _, player in pairs(Players:GetPlayers()) do
    table.insert(playerList, player.Name)
end

local PlayerDropdown = PlayerSection:Dropdown({
    Title    = "Select Player",
    Desc     = "Choose a player to teleport to",
    Values   = playerList,
    Default  = "",
    Multi    = false,
    Callback = function(value)
        targetPlayer = value
    end,
})

PlayerSection:Button({
    Title    = "Teleport To Player",
    Desc     = "Teleports you to the selected player",
    Icon     = "user",
    Callback = function()
        if not targetPlayer then
            WindUI:Notify({ Title = "Error", Content = "No player selected!", Duration = 2 })
            return
        end
        local targetChar = Players[targetPlayer].Character
        if targetChar then
            LocalPlayer.Character.HumanoidRootPart.CFrame =
                targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 2, 1)
        end
    end,
})

PlayerSection:Slider({
    Title    = "Walk Speed",
    Desc     = "Set your character's walk speed",
    Value    = { Min = 0, Max = 5000, Default = 300 },
    Callback = function(value)
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})

PlayerSection:Slider({
    Title    = "Jump Power",
    Desc     = "Set your character's jump power",
    Value    = { Min = 0, Max = 1000, Default = 50 },
    Callback = function(value)
        LocalPlayer.Character.Humanoid.JumpPower = value
    end,
})

PlayerSection:Toggle({
    Title    = "No Clip",
    Desc     = "Walk through walls and objects",
    Icon     = "layers",
    Default  = false,
    Callback = function(isEnabled)
        _G.NoClip = isEnabled
    end,
})

-- Trading section
TradingSection:Button({
    Title    = "Disable Trading",
    Desc     = "Prevents other players from trading with you",
    Icon     = "x-circle",
    Callback = function()
        Events.tradingEvent:FireServer("disableTrading")
    end,
})

TradingSection:Button({
    Title    = "Enable Trading",
    Desc     = "Allows other players to trade with you",
    Icon     = "check-circle",
    Callback = function()
        Events.tradingEvent:FireServer("enableTrading")
    end,
})

-- Chest section
ChestSection:Button({
    Title    = "Claim All Chests",
    Desc     = "Teleports all chests to you to collect them",
    Icon     = "gift",
    Callback = function()
        local rootPart = LocalPlayer.Character.HumanoidRootPart

        local oldGoldenCFrame       = workspace.goldenChest.circleInner.CFrame
        local oldEnchantedCFrame    = workspace.enchantedChest.circleInner.CFrame
        local oldMagmaCFrame        = workspace.magmaChest.circleInner.CFrame
        local oldGroupRewardsCFrame = workspace.groupRewardsCircle.circleInner.CFrame

        workspace.goldenChest.circleInner.CFrame       = rootPart.CFrame
        workspace.enchantedChest.circleInner.CFrame    = rootPart.CFrame
        workspace.magmaChest.circleInner.CFrame        = rootPart.CFrame
        workspace.groupRewardsCircle.circleInner.CFrame = rootPart.CFrame

        task.wait()

        workspace.goldenChest.circleInner.CFrame       = oldGoldenCFrame
        workspace.enchantedChest.circleInner.CFrame    = oldEnchantedCFrame
        workspace.magmaChest.circleInner.CFrame        = oldMagmaCFrame
        workspace.groupRewardsCircle.circleInner.CFrame = oldGroupRewardsCFrame
    end,
})

ChestSection:Toggle({
    Title    = "Auto Rebirth",
    Desc     = "Automatically rebirths when you reach max level",
    Icon     = "refresh-cw",
    Default  = false,
    Callback = function(isEnabled)
        _G.Rebirth = isEnabled
        while _G.Rebirth and task.wait() do
            Events.rebirthEvent:FireServer("rebirthRequest")
        end
    end,
})

-- ═════════════════════════════════════════════════
-- AUTO FARM TAB
-- ═════════════════════════════════════════════════

local FarmSettingsSection = Tabs.AutoFarm:Section({ Title = "Farm Settings" })
local FarmInfoSection     = Tabs.AutoFarm:Section({ Title = "Speed Info" })

local farmLocation = nil
local farmOrbType  = nil
local farmSpeed    = 20 -- default: Medium

FarmSettingsSection:Dropdown({
    Title    = "Select Location",
    Desc     = "Choose where to farm orbs",
    Values   = { "City", "Snow City", "Magma City", "Legends Highway", "Space", "Desert" },
    Default  = "",
    Multi    = false,
    Callback = function(value)
        farmLocation = value
    end,
})

FarmSettingsSection:Dropdown({
    Title    = "Select Orb Type",
    Desc     = "Choose which orb type to collect",
    Values   = { "Red Orb", "Yellow Orb", "Gem" },
    Default  = "",
    Multi    = false,
    Callback = function(value)
        farmOrbType = value
    end,
})

FarmSettingsSection:Dropdown({
    Title    = "Farm Speed",
    Desc     = "Higher = more orbs per cycle, may cause lag",
    Values   = { "Very Fast", "Fast", "Medium", "Slow" },
    Default  = "Medium",
    Multi    = false,
    Callback = function(value)
        if     value == "Very Fast" then farmSpeed = 40
        elseif value == "Fast"       then farmSpeed = 30
        elseif value == "Medium"     then farmSpeed = 20
        elseif value == "Slow"       then farmSpeed = 10
        end
    end,
})

FarmSettingsSection:Toggle({
    Title    = "Start Orb Farm",
    Desc     = "Automatically collects orbs at the selected location",
    Icon     = "play",
    Default  = false,
    Callback = function(isEnabled)
        _G.Farm = isEnabled
        while _G.Farm and task.wait() do
            for _ = 1, farmSpeed do
                Events.orbEvent:FireServer("collectOrb", farmOrbType, farmLocation)
            end
        end
    end,
})

FarmSettingsSection:Toggle({
    Title    = "Hoops Farm",
    Desc     = "Moves hoops to your position automatically",
    Icon     = "circle",
    Default  = false,
    Callback = function(isEnabled)
        _G.Hoops = isEnabled
        while _G.Hoops and task.wait() do
            for _, hoop in ipairs(workspace.Hoops:GetChildren()) do
                if hoop.Name == "Hoop" then
                    hoop.Transparency = 1
                    hoop.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end,
})

FarmInfoSection:Paragraph({
        Title = "Speed Info Status",
        Desc = "Very Fast | May cause serious lag\nFast | Balanced\nMedium | Recommended\nSlow | No Lag",
    })
-- ═════════════════════════════════════════════════
-- TELEPORT TAB
-- ═════════════════════════════════════════════════

local TeleportSection = Tabs.Teleport:Section({ Title = "Teleports", Icon = "locate", Box = true, BoxBorder = true })

local currentPlaceId = game.PlaceId

if currentPlaceId == PLACE.City then

    TeleportSection:Button({
        Title    = "City",
        Desc     = "Teleport to City",
        Icon     = "map-pin",
        Callback = function()
            LocalPlayer.Character:MoveTo(Vector3.new(-9687.19, 59.07, 3096.59))
        end,
    })

    TeleportSection:Button({
        Title    = "Snow City",
        Desc     = "Teleport to Snow City",
        Icon     = "map-pin",
        Callback = function()
            LocalPlayer.Character:MoveTo(Vector3.new(-9677.66, 59.07, 3783.74))
        end,
    })

    TeleportSection:Button({
        Title    = "Magma City",
        Desc     = "Teleport to Magma City",
        Icon     = "map-pin",
        Callback = function()
            LocalPlayer.Character:MoveTo(Vector3.new(-11053.38, 217.03, 4896.11))
        end,
    })

    TeleportSection:Button({
        Title    = "Legends Highway",
        Desc     = "Teleport to Legends Highway",
        Icon     = "map-pin",
        Callback = function()
            LocalPlayer.Character:MoveTo(Vector3.new(-13097.86, 217.03, 5904.85))
        end,
    })

    TeleportSection:Button({
        Title    = "Space",
        Desc     = "Server-travel to Space",
        Icon     = "navigation",
        Callback = function()
            TeleportService:Teleport(PLACE.Space, LocalPlayer)
        end,
    })

    TeleportSection:Button({
        Title    = "Desert",
        Desc     = "Server-travel to Desert",
        Icon     = "navigation",
        Callback = function()
            TeleportService:Teleport(PLACE.Desert, LocalPlayer)
        end,
    })

elseif currentPlaceId == PLACE.Space then

    TeleportSection:Button({
        Title    = "City",
        Desc     = "Server-travel to City",
        Icon     = "navigation",
        Callback = function()
            TeleportService:Teleport(PLACE.City, LocalPlayer)
        end,
    })

    TeleportSection:Button({
        Title    = "Desert",
        Desc     = "Server-travel to Desert",
        Icon     = "navigation",
        Callback = function()
            TeleportService:Teleport(PLACE.Desert, LocalPlayer)
        end,
    })

elseif currentPlaceId == PLACE.Desert then

    TeleportSection:Button({
        Title    = "City",
        Desc     = "Server-travel to City",
        Icon     = "navigation",
        Callback = function()
            TeleportService:Teleport(PLACE.City, LocalPlayer)
        end,
    })

    TeleportSection:Button({
        Title    = "Space",
        Desc     = "Server-travel to Space",
        Icon     = "navigation",
        Callback = function()
            TeleportService:Teleport(PLACE.Space, LocalPlayer)
        end,
    })

end

-- ═════════════════════════════════════════════════
-- RACE TAB
-- ═════════════════════════════════════════════════

local RaceSection = Tabs.Race:Section({ Title = "Race" })

RaceSection:Toggle({
    Title    = "Auto Finish Race",
    Desc     = "Automatically joins and wins the race",
    Icon     = "flag",
    Default  = false,
    Callback = function(isEnabled)
        getgenv().AutoRace = isEnabled
    end,
})

-- ═════════════════════════════════════════════════
-- CRYSTAL TAB
-- ═════════════════════════════════════════════════

local CrystalSection   = Tabs.Crystal:Section({ Title = "Crystal Opener" })
local PetFarmSection   = Tabs.Crystal:Section({ Title = "Pet Farming" })

-- Build crystal list from workspace
local crystalList  = {}
for _, crystal in pairs(workspace.mapCrystalsFolder:GetChildren()) do
    table.insert(crystalList, crystal.Name)
end

local selectedCrystal = nil

CrystalSection:Dropdown({
    Title    = "Select Crystal",
    Desc     = "Choose a crystal to open",
    Values   = crystalList,
    Default  = "",
    Multi    = false,
    Callback = function(value)
        selectedCrystal = value
    end,
})

CrystalSection:Toggle({
    Title    = "Auto Open Crystal",
    Desc     = "Continuously opens the selected crystal",
    Icon     = "gem",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoCrystal = isEnabled
        while _G.AutoCrystal and task.wait() do
            openCrystal(selectedCrystal)
        end
    end,
})

CrystalSection:Toggle({
    Title    = "Auto Evolve All Pets",
    Desc     = "Continuously evolves every pet in your folder",
    Icon     = "trending-up",
    Default  = false,
    Callback = function(isEnabled)
        _G.AutoEvolve = isEnabled
        while _G.AutoEvolve and task.wait() do
            for _, rankFolder in pairs(LocalPlayer.petsFolder:GetChildren()) do
                for _, pet in pairs(rankFolder:GetChildren()) do
                    Events.petEvolveEvent:FireServer("evolvePet", pet.Name)
                end
            end
        end
    end,
})

PetFarmSection:Toggle({
    Title    = "Auto Void Dragon (Desert Crystal)",
    Desc     = "Opens Desert Crystal and sells all pets except Void Dragon",
    Icon     = "repeat",
    Default  = false,
    Locked = true,
    Callback = function(isEnabled)
        _G.OpenVoidEgg      = isEnabled
        _G.AutoUnique       = isEnabled
        _G.AutoSellAllTrails = isEnabled
    end,
})

PetFarmSection:Toggle({
    Title    = "Auto Ultra Birdie (Electro Crystal)",
    Desc     = "Opens Electro Crystal and sells all pets except Ultra Birdie",
    Icon     = "repeat",
    Default  = false,
    Locked = true,
    Callback = function(isEnabled)
        _G.OpenBirdieEgg     = isEnabled
        _G.AutoSellAllPets   = isEnabled
        _G.AutoSellAllTrails = isEnabled
    end,
})

PetFarmSection:Toggle({
    Title    = "Auto Overdrive Bunny (Legends Crystal)",
    Desc     = "Opens Electro Legends Crystal and sells all non-Bunny pets",
    Icon     = "repeat",
    Default  = false,
    Callback = function(isEnabled)
        _G.BunnyFarm     = isEnabled
        _G.OpenLegendsEgg = isEnabled
    end,
})

-- ═════════════════════════════════════════════════
-- MISC TAB
-- ═════════════════════════════════════════════════

local MiscSection = Tabs.Misc:Section({ Title = "Misc" })

MiscSection:Toggle({
    Title    = "Hide Popups",
    Desc     = "Removes orb and trail popup notifications",
    Icon     = "bell-off",
    Default  = false,
    Callback = function(isEnabled)
        getgenv().HidePopups = isEnabled
        local gameGui = LocalPlayer.PlayerGui.gameGui
        LocalPlayer.PlayerGui.orbGui.Enabled                          = not isEnabled
        gameGui.trailsNotificationsFrame.Visible                      = not isEnabled
    end,
})

MiscSection:Toggle({
    Title    = "Infinite Jump",
    Desc     = "Allows you to jump infinitely in the air",
    Icon     = "chevrons-up",
    Default  = false,
    Callback = function(isEnabled)
        _G.InfJump = isEnabled
        UserInputService.JumpRequest:Connect(function()
            if _G.InfJump then
                LocalPlayer.Character
                    :FindFirstChildOfClass("Humanoid")
                    :ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end,
})

MiscSection:Button({
    Title    = "Rejoin",
    Desc     = "Rejoins the current game",
    Icon     = "refresh-cw",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

MiscSection:Button({
    Title    = "Low Server Hop",
    Desc     = "Hops to a lower population server",
    Icon     = "server",
    Callback = function()
        local serverHop = loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings"
        ))()
        serverHop:Teleport(game.PlaceId)
    end,
})

-- ═════════════════════════════════════════════════
-- CREDITS TAB
-- ═════════════════════════════════════════════════

local CreditsSection = Tabs.Credits:Section({ Title = "Credits" })



createCustomOpenButton()
