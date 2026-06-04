--[[
                LET'S GO LIQUID!
]]

repeat
    task.wait()
until game:IsLoaded()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    ["Name"] = "Dark",
    ["Accent"] = "#18181b",
    ["Dialog"] = "#18181b",
    ["Outline"] = "#FFFFFF",
    ["Text"] = "#FFFFFF",
    ["Placeholder"] = "#999999",
    ["Background"] = "#0e0e10",
    ["Button"] = "#52525b",
    ["Icon"] = "#a1a1aa"
})

WindUI:AddTheme({
    ["Name"] = "Light",
    ["Accent"] = "#f4f4f5",
    ["Dialog"] = "#f4f4f5",
    ["Outline"] = "#000000",
    ["Text"] = "#000000",
    ["Placeholder"] = "#666666",
    ["Background"] = "#ffffff",
    ["Button"] = "#e4e4e7",
    ["Icon"] = "#52525b"
})



WindUI:AddTheme({
    ["Name"] = "Blue",
    ["Accent"] = "#1e40af",
    ["Dialog"] = "#1e3a8a",
    ["Outline"] = "#93c5fd",
    ["Text"] = "#f0f9ff",
    ["Placeholder"] = "#60a5fa",
    ["Background"] = "#1e293b",
    ["Button"] = "#3b82f6",
    ["Icon"] = "#93c5fd"
})

WindUI:AddTheme({
    ["Name"] = "Purple",
    ["Accent"] = "#7c3aed",
    ["Dialog"] = "#6d28d9",
    ["Outline"] = "#c4b5fd",
    ["Text"] = "#faf5ff",
    ["Placeholder"] = "#a78bfa",
    ["Background"] = "#581c87",
    ["Button"] = "#8b5cf6",
    ["Icon"] = "#c4b5fd"
})


local ThemesList = {
    "Dark",
    "Light",
    "Blue",
    "Purple"
}

local CurrentThemeIndex = 1

WindUI:Notify({
    ["Title"] = "Liquid Hub",
    ["Content"] = "Toggle Keybind: R",
    ["Icon"] = "rbxassetid://109069296276521",
    ["Duration"] = 12,
  })


local MainWindow = WindUI:CreateWindow({
    ["Title"] = "Liquid Hub | MM2",
    ["Icon"] = "rbxassetid://109069296276521",
    ["Author"] = "by Takgoo",
    ["Folder"] = "Liquidhub",
    ["Size"] = UDim2.fromOffset(620, 420),
    ["Transparent"] = true,
    ["Theme"] = "Sky",
    ["Resizable"] = true,
    ["SideBarWidth"] = 150,
    ["BackgroundImageTransparency"] = 0.8,
    ["HideSearchBar"] = false,
    ["ScrollBarEnabled"] = true,
    ["User"] = {
        ["Enabled"] = true,
        ["Anonymous"] = false,
        ["Callback"] = function()
            CurrentThemeIndex = CurrentThemeIndex + 1
            if CurrentThemeIndex > #ThemesList then
                CurrentThemeIndex = 1
            end
            local NewTheme = ThemesList[CurrentThemeIndex]
            WindUI:SetTheme(NewTheme)
            WindUI:Notify({
                ["Title"] = "Theme Applied",
                ["Content"] = "Changed to " .. NewTheme .. " theme!",
                ["Duration"] = 2,
                ["Icon"] = "palette"
            })
        end
    }
})


function getMap()
    for _, Child in ipairs(workspace:GetChildren()) do
        if Child:FindFirstChild("CoinContainer") and Child:FindFirstChild("Spawns") then
            return Child
        end
    end
    return nil
end

loadstring(game:HttpGet("https://pastefy.app/hcVkWhQF/raw"))()

MainWindow:EditOpenButton({
    ["Title"] = "Open Liquid",
    ["CornerRadius"] = UDim.new(0, 6),
    ["StrokeThickness"] = 2,
    ["Color"] = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    ["Draggable"] = true
})

MainWindow.ToggleKey = Enum.KeyCode.R

local Tabs = {}

Tabs.Info = MainWindow:Tab({
    ["Title"] = "Information",
    ["Icon"] = "badge-info",
    ["Desc"] = "Information"
})

Tabs.Fling = MainWindow:Tab({
    ["Title"] = "Player",
    ["Icon"] = "user",
    ["Desc"] = "Fling"
})

Tabs.Main = MainWindow:Tab({
    ["Title"] = "Main",
    ["Icon"] = "house",
    ["Desc"] = "Main"
})


Tabs.ESP = MainWindow:Tab({
    ["Title"] = "ESP",
    ["Icon"] = "eye",
    ["Desc"] = "ESP"
})

Tabs.Farm = MainWindow:Tab({
    ["Title"] = "Farm",
    ["Icon"] = "wrench",
    ["Desc"] = "Farm"
})


Tabs.Place = MainWindow:Tab({
    ["Title"] = "Teleport",
    ["Icon"] = "map",
    ["Desc"] = "Teleport"
})

Tabs.Misc = MainWindow:Tab({
    ["Title"] = "Misc",
    ["Icon"] = "settings",
    ["Desc"] = "Misc"
})


local mm2stack = Tabs.Main:HStack()
local murd = mm2stack:VStack()
local sher = mm2stack:VStack()

local mrd = murd:Section({
    ["Title"] = "Murder",
    ["Icon"] = "sword",
    ["TextXAlignment"] = "Center",
    ["Box"] = true,
    ["BoxBorder"] = true,
})

mrd:Button({
    ["Title"] = "Kill All",
    ["Desc"] = "Hold Knife",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/2eOpHYrg/raw"))("true")
    end
})

mrd:Button({
    ["Title"] = "Kill Sheriff",
    ["Desc"] = "Hold Knife",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/YBXds1as/raw"))("true")
    end
})

mrd:Button({
    ["Title"] = "Kill Innocents",
    ["Desc"] = "Hold Knife",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/vmG5vtCc/raw"))("true")
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local HitboxSettings = {
    ["Hitbox"] = {
        ["Enabled"] = false,
        ["Size"] = 5,
        ["Color"] = Color3.new(1, 0, 0),
        ["Adornments"] = {},
        ["Connection"] = nil
    }
}

local function UpdateHitboxes()
    if HitboxSettings.Hitbox.Enabled then
        for _, Player in pairs(Players:GetPlayers()) do
            if Player ~= LocalPlayer then
                local Character = Player.Character
                local Adornment = HitboxSettings.Hitbox.Adornments[Player]
                if Character and HitboxSettings.Hitbox.Enabled then
                    local RootPart = Character:FindFirstChild("HumanoidRootPart")
                    if RootPart then
                        if Adornment then
                            Adornment.Size = Vector3.new(HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size)
                            Adornment.Color3 = HitboxSettings.Hitbox.Color
                        else
                            local NewAdornment = Instance.new("BoxHandleAdornment")
                            NewAdornment.Adornee = RootPart
                            NewAdornment.Size = Vector3.new(HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size)
                            NewAdornment.Color3 = HitboxSettings.Hitbox.Color
                            NewAdornment.Transparency = 0.4
                            NewAdornment.ZIndex = 10
                            NewAdornment.Parent = RootPart
                            HitboxSettings.Hitbox.Adornments[Player] = NewAdornment
                        end
                    end
                elseif Adornment then
                    Adornment:Destroy()
                    HitboxSettings.Hitbox.Adornments[Player] = nil
                end
            end
        end
    end
end

mrd:Toggle({
    ["Title"] = "Hitbox",
    ["Desc"] = "Toggle hitbox on/off",
    ["Callback"] = function(State)
        HitboxSettings.Hitbox.Enabled = State
        if State then
            if not HitboxSettings.Hitbox.Connection then
                HitboxSettings.Hitbox.Connection = RunService.Heartbeat:Connect(UpdateHitboxes)
            end
        else
            if HitboxSettings.Hitbox.Connection then
                HitboxSettings.Hitbox.Connection:Disconnect()
                HitboxSettings.Hitbox.Connection = nil
            end
            for _, Adornment in pairs(HitboxSettings.Hitbox.Adornments) do
                if Adornment then
                    Adornment:Destroy()
                end
            end
            HitboxSettings.Hitbox.Adornments = {}
        end
    end
})

mrd:Slider({
    ["Title"] = "Hitbox Size",
    ["Desc"] = "Set Hitbox Size",
    ["Value"] = {
        ["Min"] = 1,
        ["Max"] = 15,
        ["Default"] = 5
    },
    ["Callback"] = function(Value)
        HitboxSettings.Hitbox.Size = Value
    end
})

mrd:Colorpicker({
    ["Title"] = "Hitbox color",
    ["Desc"] = "Set Hitbox Color",
    ["Default"] = Color3.new(0, 0, 1),
    ["Callback"] = function(Color)
        HitboxSettings.Hitbox.Color = Color
    end
})

local shf = sher:Section({
    ["Title"] = "Sheriff",
    ["Icon"] = "crosshair",
    ["TextXAlignment"] = "Center",
})

shf:Button({
    ["Title"] = "Shoot Murderer",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/IeVSJS2e/raw"))("true")
    end
})

local PlayersService = game:GetService("Players")
local RunServiceAimbot = game:GetService("RunService")
local LocalPlayerAimbot = PlayersService.LocalPlayer
local AimbotEnabled = false
local AimbotConnection = nil

local function FindMurderer()
    for _, Player in ipairs(PlayersService:GetPlayers()) do
        if Player ~= LocalPlayerAimbot then
            local Backpack = Player:FindFirstChild("Backpack")
            local Character = Player.Character
            if Backpack and Backpack:FindFirstChild("Knife") or Character and Character:FindFirstChild("Knife") then
                return Player
            end
        end
    end
    return nil
end

local function PredictPosition(Player, Offset)
    local RootPart = Player.Character
    if RootPart then
        RootPart = Player.Character:FindFirstChild("HumanoidRootPart")
    end
    if RootPart and RootPart.Velocity then
        return RootPart.Position + RootPart.Velocity * 0.125 + Offset
    else
        return RootPart and RootPart.Position or Vector3.zero
    end
end

shf:Toggle({
    ["Title"] = "Camera Aimbot",
    ["Desc"] = "Camera focuses to the Murderer",
    ["Value"] = false,
    ["Callback"] = function(State)
        AimbotEnabled = State
        if AimbotEnabled then
            AimbotConnection = RunServiceAimbot.RenderStepped:Connect(function()
                local Murderer = FindMurderer()
                if Murderer and LocalPlayerAimbot.Character then
                    local TargetPosition = PredictPosition(Murderer, Vector3.new(0, 0, 0))
                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, TargetPosition)
                end
            end)
        elseif AimbotConnection then
            AimbotConnection:Disconnect()
            AimbotConnection = nil
        end
    end
})

local PlayersGun = game:GetService("Players")
local RunServiceGun = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
game:GetService("ContextActionService")
local LocalPlayerGun = PlayersGun.LocalPlayer
_G.GunAimbotArgs = nil
local GunAimbotEnabled = false
local GunAimbotConnection = nil
local TouchConnection = nil

shf:Toggle({
    ["Title"] = "Gun Aimbot",
    ["Desc"] = "Aims to the Murderer",
    ["Value"] = false,
    ["Callback"] = function(State)
        GunAimbotEnabled = State
        if State then
            GunAimbotConnection = RunServiceGun.RenderStepped:Connect(function()
                local TargetPlayer = nil
                for _, Player in ipairs(PlayersGun:GetPlayers()) do
                    if Player ~= LocalPlayerGun then
                        local Backpack = Player:FindFirstChild("Backpack")
                        local Character = Player.Character
                        if Backpack and Backpack:FindFirstChild("Knife") or Character and Character:FindFirstChild("Knife") then
                            TargetPlayer = Player
                            break
                        end
                    end
                end
                if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local RootPart = TargetPlayer.Character.HumanoidRootPart
                    local Args = { 1, RootPart.Position + RootPart.Velocity * 0.125, "AH2" }
                    _G.GunAimbotArgs = Args
                else
                    _G.GunAimbotArgs = nil
                end
            end)
            local function FireGun()
                local Gun = LocalPlayerGun.Character
                if Gun then
                    Gun = LocalPlayerGun.Character:FindFirstChild("Gun")
                end
                if Gun and _G.GunAimbotArgs then
                    pcall(function()
                        Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(unpack(_G.GunAimbotArgs))
                    end)
                end
            end
            UserInputService.InputBegan:Connect(function(Input, GameProcessed)
                if not GameProcessed then
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        FireGun()
                    end
                end
            end)
            TouchConnection = UserInputService.TouchTap:Connect(function()
                FireGun()
            end)
        else
            if GunAimbotConnection then
                GunAimbotConnection:Disconnect()
                GunAimbotConnection = nil
            end
            if TouchConnection then
                TouchConnection:Disconnect()
                TouchConnection = nil
            end
            _G.GunAimbotArgs = nil
        end
    end
})

local inno = Tabs.Main:Section({
    ["Title"] = "Innocent",
    ["Icon"] = "eye",
    ["Opened"] = true,
    ["Box"] = true,
    ["BoxBorder"] = true,
})

local PlayersInvis = game:GetService("Players")
local RunServiceInvis = game:GetService("RunService")
local LocalPlayerInvis = PlayersInvis.LocalPlayer
local InvisAnimationId = "90878454666108"
local InvisAnimTimePos = 0.2
local InvisAnimSpeed = 0
local InvisibilityEnabled = false
local CurrentInvisAnimation = nil
local AnimationBlockConnection = nil
local HeartbeatConnection = nil
local CollisionConnection = nil

local function SetCharacterTransparency(Character, Transparency)
    if Character then
        local BodyParts = {
            "Head",
            "UpperTorso",
            "LowerTorso",
            "LeftUpperArm",
            "LeftLowerArm",
            "LeftHand",
            "RightUpperArm",
            "RightLowerArm",
            "RightHand",
            "LeftUpperLeg",
            "LeftLowerLeg",
            "LeftFoot",
            "RightUpperLeg",
            "RightLowerLeg",
            "RightFoot"
        }
        for _, PartName in ipairs(BodyParts) do
            local Part = Character:FindFirstChild(PartName)
            if Part and Part:IsA("BasePart") then
                Part.Transparency = Transparency
            end
        end
    end
end

local function PlayInvisAnimation(Animator)
    if Animator then
        if not (CurrentInvisAnimation and CurrentInvisAnimation.IsPlaying) then
            local Animation = Instance.new("Animation")
            Animation.AnimationId = "rbxassetid://" .. InvisAnimationId
            CurrentInvisAnimation = Animator:LoadAnimation(Animation)
            CurrentInvisAnimation:Play()
            CurrentInvisAnimation.TimePosition = InvisAnimTimePos
            CurrentInvisAnimation:AdjustSpeed(InvisAnimSpeed)
        end
    end
end

local function StopInvisAnimation()
    if CurrentInvisAnimation then
        CurrentInvisAnimation:Stop()
        CurrentInvisAnimation = nil
    end
end

local function BlockOtherAnimations(Humanoid)
    if Humanoid then
        if AnimationBlockConnection then
            AnimationBlockConnection:Disconnect()
        end
        AnimationBlockConnection = Humanoid.AnimationPlayed:Connect(function(AnimTrack)
            if AnimTrack.Animation.AnimationId:match("%d+") ~= InvisAnimationId then
                AnimTrack:Stop()
            end
        end)
    end
end

local function UnblockAnimations()
    if AnimationBlockConnection then
        AnimationBlockConnection:Disconnect()
        AnimationBlockConnection = nil
    end
end

local function StartInvisibility(Character)
    if Character then
        local Humanoid = Character:WaitForChild("Humanoid")
        local Animator
        if Humanoid then
            Animator = Humanoid:FindFirstChildOfClass("Animator")
        else
            Animator = Humanoid
        end
        if Humanoid and Animator then
            SetCharacterTransparency(Character, 0.5)
            BlockOtherAnimations(Humanoid)
            if HeartbeatConnection then
                HeartbeatConnection:Disconnect()
            end
            HeartbeatConnection = RunServiceInvis.Heartbeat:Connect(function()
                if InvisibilityEnabled then
                    PlayInvisAnimation(Animator)
                end
            end)
        end
    else
        return
    end
end

local function StopInvisibility(Character)
    StopInvisAnimation()
    UnblockAnimations()
    SetCharacterTransparency(Character, 0)
    if HeartbeatConnection then
        HeartbeatConnection:Disconnect()
        HeartbeatConnection = nil
    end
end

local function DisableCollision(Character)
    if Character then
        if CollisionConnection then
            CollisionConnection:Disconnect()
        end
        CollisionConnection = RunServiceInvis.Stepped:Connect(function()
            if Character then
                for _, Descendant in ipairs(Character:GetDescendants()) do
                    if Descendant:IsA("BasePart") and Descendant.Name ~= "HumanoidRootPart" then
                        Descendant.CanCollide = false
                    end
                end
            end
        end)
    end
end

local function EnableCollision(Character)
    if CollisionConnection then
        CollisionConnection:Disconnect()
        CollisionConnection = nil
    end
    if Character then
        for _, Descendant in ipairs(Character:GetDescendants()) do
            if Descendant:IsA("BasePart") then
                Descendant.CanCollide = true
            end
        end
    end
end

local function EnableFullInvisibility(Character)
    StartInvisibility(Character)
    DisableCollision(Character)
end

local function DisableFullInvisibility(Character)
    StopInvisibility(Character)
    EnableCollision(Character)
end

local function OnCharacterAddedInvis(NewCharacter)
    DisableFullInvisibility(LocalPlayerInvis.Character)
    if InvisibilityEnabled then
        task.wait(0.5)
        EnableFullInvisibility(NewCharacter)
    end
    NewCharacter:WaitForChild("Humanoid").Died:Connect(function()
        DisableFullInvisibility(NewCharacter)
    end)
end

inno:Toggle({
    ["Title"] = "Invisibility",
    ["Value"] = false,
    ["Callback"] = function(State)
        InvisibilityEnabled = State
        local Character = LocalPlayerInvis.Character
        if InvisibilityEnabled then
            EnableFullInvisibility(Character)
        else
            DisableFullInvisibility(Character)
        end
    end
})

LocalPlayerInvis.CharacterAdded:Connect(OnCharacterAddedInvis)

if LocalPlayerInvis.Character then
    OnCharacterAddedInvis(LocalPlayerInvis.Character)
end

local AutoGetGunEnabled = false

inno:Toggle({
    ["Title"] = "Auto Get Gun",
    ["Value"] = false,
    ["Callback"] = function(State)
        AutoGetGunEnabled = State
        if State then
            task.spawn(function()
                while AutoGetGunEnabled do
                    local Character = game.Players.LocalPlayer.Character
                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        local OriginalPosition = Character.HumanoidRootPart.Position
                        local NearestGun = nil
                        local NearestDistance = math.huge
                        for _, Descendant in pairs(workspace:GetDescendants()) do
                            if Descendant.Name == "GunDrop" and Descendant:IsA("BasePart") then
                                local Distance = (Character.HumanoidRootPart.Position - Descendant.Position).Magnitude
                                if Distance < NearestDistance then
                                    NearestGun = Descendant
                                    NearestDistance = Distance
                                end
                            end
                        end
                        if NearestGun then
                            Character.HumanoidRootPart.CFrame = NearestGun.CFrame
                            task.wait(0.1)
                            Character.HumanoidRootPart.CFrame = CFrame.new(OriginalPosition)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

--[[Tabs.Main:Button({
    ["Title"] = "Respawn",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/FHl36Zg1/raw"))("true")
    end
})
]]

local spect = Tabs.Main:Section({
    ["Title"] = "Spectate",
    ["Desc"] = "Spectate and focus camera to selected.",
    ["Icon"] = "eye",
    ["Opened"] = true,
    ["Box"] = true,
    ["BoxBorder"] = true,
  })


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().SpectateLoop = nil

local function FindMurdererCharacter()
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character then
            if Player.Backpack:FindFirstChild("Knife") or Player.Character:FindFirstChild("Knife") then
                return Player.Character
            end
        end
    end
    return nil
end

local function FindSheriffCharacter()
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character then
            if Player.Backpack:FindFirstChild("Gun") or Player.Character:FindFirstChild("Gun") then
                return Player.Character
            end
        end
    end
    return nil
end

local function StopSpectate()
    if getgenv().SpectateLoop then
        task.cancel(getgenv().SpectateLoop)
        getgenv().SpectateLoop = nil
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
    end
end

spect:Toggle({
    ["Title"] = "Spectate Murderer",
    ["Default"] = false,
    ["Callback"] = function(Value)
        if Value then
            StopSpectate()
            getgenv().SpectateLoop = task.spawn(function()
                while Value do
                    task.wait(1)
                    local MurdererCharacter = FindMurdererCharacter()
                    if MurdererCharacter and MurdererCharacter:FindFirstChild("Humanoid") then
                        Camera.CameraSubject = MurdererCharacter:FindFirstChild("Humanoid")
                    else
                        WindUI:Notify({
                            ["Title"] = "Liquid Hub",
                            ["Content"] = "Murderer not found!",
                            ["Duration"] = 2,
                            ["Icon"] = "x"
                        })
                        task.wait(2)
                    end
                end
            end)
        else
            StopSpectate()
        end
    end
})

spect:Toggle({
    ["Title"] = "Spectate Sheriff",
    ["Default"] = false,
    ["Callback"] = function(Value)
        if Value then
            StopSpectate()
            getgenv().SpectateLoop = task.spawn(function()
                while Value do
                    task.wait(1)
                    local SheriffCharacter = FindSheriffCharacter()
                    if SheriffCharacter and SheriffCharacter:FindFirstChild("Humanoid") then
                        Camera.CameraSubject = SheriffCharacter:FindFirstChild("Humanoid")
                    else
                        WindUI:Notify({
                            ["Title"] = "Liquid Hub",
                            ["Content"] = "Sheriff not found!",
                            ["Duration"] = 2,
                            ["Icon"] = "x"
                        })
                        task.wait(2)
                    end
                end
            end)
        else
            StopSpectate()
        end
    end
})

spect:Toggle({
    ["Title"] = "Spectate Random Player",
    ["Default"] = false,
    ["Callback"] = function(Value)
        if Value then
            StopSpectate()
            getgenv().SpectateLoop = task.spawn(function()
                while Value do
                    task.wait(3)
                    local AllPlayers = Players:GetPlayers()
                    if #AllPlayers <= 1 then
                        WindUI:Notify({
                            ["Title"] = "Liquid Hub",
                            ["Content"] = "No enough player",
                            ["Duration"] = 2,
                            ["Icon"] = "users"
                        })
                    else
                        local RandomPlayer
                        repeat
                            RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
                        until RandomPlayer ~= LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("Humanoid")
                        Camera.CameraSubject = RandomPlayer.Character:FindFirstChild("Humanoid")
                        WindUI:Notify({
                            ["Title"] = "Spectating",
                            ["Content"] = "Now spectating: " .. RandomPlayer.Name,
                            ["Duration"] = 2,
                            ["Icon"] = "eye"
                        })
                    end
                end
            end)
        else
            StopSpectate()
        end
    end
})


Tabs.Misc:Section({
    ["Title"] = "Universal Scripts",
    ["Icon"] = "flame"
})

Tabs.Misc:Button({
    ["Title"] = "Infinite Yield",
    ["Desc"] = "Loads a universal admin script",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})




Tabs.Misc:Button({
    ["Title"] = "Fly V3",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
    end
})


Tabs.Misc:Section({
    ["Title"] = "Tools",
    ["Icon"] = "hammer"
})

Tabs.Misc:Button({
    ["Title"] = "Teleport Tool",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/ZLpXLAeF/raw"))()
    end
})

Tabs.Misc:Button({
    ["Title"] = "Jerk Off Tool",
    ["Locked"] = false,
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/LcC6ZrhN/raw"))()
    end
})

Tabs.ESP:Section({
    ["Title"] = "ESP",
    ["Icon"] = "package"
})

local PlayersESP = game:GetService("Players")
local LocalPlayerESP = PlayersESP.LocalPlayer

local ESPSettings = {
    ["Murder"] = false,
    ["Sheriff"] = false,
    ["Innocent"] = false
}

local function GetMurdererPlayer()
    for _, Player in pairs(PlayersESP:GetPlayers()) do
        if Player.Character and Player.Character:FindFirstChild("Knife") then
            return Player
        end
        if Player:FindFirstChild("Backpack") and Player.Backpack:FindFirstChild("Knife") then
            return Player
        end
    end
    return nil
end

local function GetSheriffPlayer()
    for _, Player in pairs(PlayersESP:GetPlayers()) do
        if Player.Character and Player.Character:FindFirstChild("Gun") then
            return Player
        end
        if Player:FindFirstChild("Backpack") and Player.Backpack:FindFirstChild("Gun") then
            return Player
        end
    end
    return nil
end

local function GetPlayerRole(Player)
    return Player ~= GetMurdererPlayer() and (Player ~= GetSheriffPlayer() and "Innocent" or "Sheriff") or "Murder"
end

local function GetRoleColor(Role)
    if Role == "Murder" then
        return Color3.fromRGB(255, 0, 0)
    elseif Role == "Sheriff" then
        return Color3.fromRGB(0, 150, 255)
    else
        return Color3.fromRGB(0, 255, 0)
    end
end

local function ClearAllESP()
    for _, Player in pairs(PlayersESP:GetPlayers()) do
        if Player.Character then
            local Highlight = Player.Character:FindFirstChild("ESPHighlight")
            if Highlight then
                Highlight:Destroy()
            end
        end
    end
end

local function RefreshESP()
    ClearAllESP()
    for _, Player in pairs(PlayersESP:GetPlayers()) do
        if Player ~= LocalPlayerESP and Player.Character then
            local Role = GetPlayerRole(Player)
            if ESPSettings[Role] then
                local Highlight = Instance.new("Highlight")
                Highlight.Name = "ESPHighlight"
                Highlight.Adornee = Player.Character
                Highlight.FillTransparency = 0.5
                Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                Highlight.FillColor = GetRoleColor(Role)
                Highlight.OutlineColor = GetRoleColor(Role)
                Highlight.Parent = Player.Character
            end
        end
    end
end

local function SetupBackpackListener(Player)
    local function ConnectBackpack()
        local Backpack = Player:FindFirstChild("Backpack")
        if Backpack then
            Backpack.ChildAdded:Connect(RefreshESP)
            Backpack.ChildRemoved:Connect(RefreshESP)
        end
    end
    if Player:FindFirstChild("Backpack") then
        ConnectBackpack()
    else
        Player.ChildAdded:Connect(function(Child)
            if Child.Name == "Backpack" then
                ConnectBackpack()
            end
        end)
    end
end

local function SetupPlayerListener(Player)
    Player.CharacterAdded:Connect(function()
        SetupBackpackListener(Player)
        RefreshESP()
    end)
end

PlayersESP.PlayerAdded:Connect(function(Player)
    SetupPlayerListener(Player)
    SetupBackpackListener(Player)
end)

for _, Player in pairs(PlayersESP:GetPlayers()) do
    if Player ~= LocalPlayerESP then
        SetupPlayerListener(Player)
        SetupBackpackListener(Player)
    end
end

Tabs.ESP:Toggle({
    ["Title"] = "ESP Murderer",
    ["Value"] = false,
    ["Callback"] = function(State)
        ESPSettings.Murder = State
        RefreshESP()
    end
})

Tabs.ESP:Toggle({
    ["Title"] = "ESP Sheriff",
    ["Value"] = false,
    ["Callback"] = function(State)
        ESPSettings.Sheriff = State
        RefreshESP()
    end
})

Tabs.ESP:Toggle({
    ["Title"] = "ESP Innocent",
    ["Value"] = false,
    ["Callback"] = function(State)
        ESPSettings.Innocent = State
        RefreshESP()
    end
})

local GunESPHighlight = nil

Tabs.ESP:Toggle({
    ["Title"] = "Gun ESP",
    ["Value"] = false,
    ["Callback"] = function(State)
        if State then
            GunESPHighlight = Instance.new("Highlight", game.CoreGui)
            GunESPHighlight.OutlineTransparency = 1
            GunESPHighlight.FillColor = Color3.fromRGB(0, 255, 0)
            GunESPHighlight.Name = "GunESP"
            GunESPHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local function CheckGunDrop(Instance)
                if Instance.Name == "GunDrop" then
                    GunESPHighlight.Adornee = Instance
                    GunESPHighlight.Enabled = true
                end
            end
            for _, Descendant in pairs(workspace:GetDescendants()) do
                CheckGunDrop(Descendant)
            end
            workspace.DescendantAdded:Connect(CheckGunDrop)
        elseif GunESPHighlight then
            GunESPHighlight:Destroy()
            GunESPHighlight = nil
        end
    end
})

Tabs.ESP:Section({
    ["Title"] = "Expose Roles",
    ["Icon"] = "info"
})

local PlayersExpose = game:GetService("Players")
local RunServiceExpose = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

local function SendChatMessage(Message)
    if TextChatService and TextChatService:FindFirstChild("ChatInputBarConfiguration") then
        local TextChannels = TextChatService:FindFirstChild("TextChannels")
        if TextChannels and TextChannels:FindFirstChild("RBXGeneral") then
            TextChannels.RBXGeneral:SendAsync(Message)
        end
    else
        local ChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if ChatEvents then
            ChatEvents.SayMessageRequest:FireServer(Message, "All")
        end
    end
end

local function ExposeRole(WeaponName, RoleName)
    for _, Player in pairs(PlayersExpose:GetPlayers()) do
        local Character = Player.Character
        local Backpack = Player.Backpack
        if Character and Character:FindFirstChild(WeaponName) or Backpack and Backpack:FindFirstChild(WeaponName) then
            SendChatMessage(RoleName .. ": " .. Player.Name)
            return true
        end
    end
    return false
end

local function CreateAutoExposeToggle(Title, WeaponName, RoleName)
    local ExposeConnection = nil
    Tabs.ESP:Toggle({
        ["Title"] = Title,
        ["Value"] = false,
        ["Callback"] = function(State)
            if State then
                ExposeConnection = RunServiceExpose.Heartbeat:Connect(function()
                    if ExposeRole(WeaponName, RoleName) and ExposeConnection then
                        ExposeConnection:Disconnect()
                        ExposeConnection = nil
                    end
                end)
            elseif ExposeConnection then
                ExposeConnection:Disconnect()
                ExposeConnection = nil
            end
        end
    })
end

Tabs.ESP:Button({
    ["Title"] = "Expose Murderer",
    ["Callback"] = function()
        ExposeRole("Knife", "Murderer")
    end
})

Tabs.ESP:Button({
    ["Title"] = "Expose Sheriff",
    ["Callback"] = function()
        ExposeRole("Gun", "Sheriff")
    end
})

CreateAutoExposeToggle("Auto Expose Murderer", "Knife", "Murderer")
CreateAutoExposeToggle("Auto Expose Sheriff", "Gun", "Sheriff")

Tabs.ESP:Section({
    ["Title"] = "Notify",
    ["Icon"] = "alert-circle"
})

local PlayersNotify = game:GetService("Players")
local RunServiceNotify = game:GetService("RunService")

local function SendNotification(Message)
    --[[game.StarterGui:SetCore("SendNotification", {
        ["Title"] = "VexonHub",
        ["Text"] = Message,
        ["Icon"] = "http://www.roblox.com/asset/?id=84519376661277",
        ["Duration"] = 5
    })]]
  WindUI:Notify({
      ["Title"] = "Liquid Hub",
      ["Content"] = Message,
      ["Icon"] = "bell",
      ["Duration"] = 5,
    })
end

local function NotifyRole(WeaponName, RoleName)
    for _, Player in pairs(PlayersNotify:GetPlayers()) do
        if Player.Character and Player.Character:FindFirstChild(WeaponName) or Player.Backpack and Player.Backpack:FindFirstChild(WeaponName) then
            SendNotification(RoleName .. ": " .. Player.Name)
            return true
        end
    end
    return false
end

local function CreateAutoNotifyToggle(Title, WeaponName, RoleName)
    local NotifyConnection = nil
    Tabs.ESP:Toggle({
        ["Title"] = Title,
        ["Value"] = false,
        ["Callback"] = function(State)
            if State then
                NotifyConnection = RunServiceNotify.Heartbeat:Connect(function()
                    if NotifyRole(WeaponName, RoleName) and NotifyConnection then
                        NotifyConnection:Disconnect()
                        NotifyConnection = nil
                    end
                end)
            elseif NotifyConnection then
                NotifyConnection:Disconnect()
                NotifyConnection = nil
            end
        end
    })
end

Tabs.ESP:Button({
    ["Title"] = "Notify Murderer",
    ["Callback"] = function()
        NotifyRole("Knife", "Murderer")
    end
})

Tabs.ESP:Button({
    ["Title"] = "Notify Sheriff",
    ["Callback"] = function()
        NotifyRole("Gun", "Sheriff")
    end
})

CreateAutoNotifyToggle("Auto Notify Murderer", "Knife", "Murderer")
CreateAutoNotifyToggle("Auto Notify Sheriff", "Gun", "Sheriff")


Tabs.Farm:Section({
    ["Title"] = "Coins",
    ["Icon"] = "package"
})

local PlayersFarm = game:GetService("Players")
local RunServiceFarm = game:GetService("RunService")
local WorkspaceFarm = game:GetService("Workspace")
local CoinFarmEnabled = false
local TeleportWalkEnabled = false
local CoinFarmMode = "Nearest"
local TeleportInterval = 3
local WalkCoinRadius = 15
local LastTeleportTime = 0
local LastTeleportedCoin = nil
local CurrentWalkTarget = nil
local CoinContainer = nil

local function FindTargetCoin(RootPart)
    local NearestDistance = math.huge
    local AllCoins = {}
    local NearestCoin = nil
    for _, Child in ipairs(CoinContainer:GetChildren()) do
        local CoinPart = nil
        if Child:IsA("BasePart") then
            CoinPart = Child
        elseif Child:IsA("Model") and Child.PrimaryPart then
            CoinPart = Child.PrimaryPart
        end
        if CoinPart and (CoinPart.Parent and CoinPart ~= LastTeleportedCoin) then
            if CoinFarmMode ~= "Nearest" then
                table.insert(AllCoins, CoinPart)
            else
                local Distance = (RootPart.Position - CoinPart.Position).Magnitude
                if Distance < NearestDistance then
                    NearestCoin = CoinPart
                    NearestDistance = Distance
                end
            end
        end
    end
    if CoinFarmMode == "Nearest" then
        return NearestCoin
    end
    if #AllCoins > 0 then
        return AllCoins[math.random(1, #AllCoins)]
    end
end

local function FindNearbyCoin(RootPart)
    local SearchRadius = WalkCoinRadius
    local CurrentPosition = RootPart.Position
    local NearestCoin = nil
    local NearestDistance = SearchRadius
    for _, Child in ipairs(CoinContainer:GetChildren()) do
        local CoinPart = nil
        if Child:IsA("BasePart") then
            CoinPart = Child
        elseif Child:IsA("Model") and Child.PrimaryPart then
            CoinPart = Child.PrimaryPart
        end
        if CoinPart and (CoinPart.Parent and (CoinPart ~= LastTeleportedCoin and CoinPart ~= CurrentWalkTarget)) then
            local Distance = (CurrentPosition - CoinPart.Position).Magnitude
            if Distance < NearestDistance then
                NearestCoin = CoinPart
                NearestDistance = Distance
            end
        end
    end
    return NearestCoin
end

RunServiceFarm.Heartbeat:Connect(function()
    if not (CoinContainer and CoinContainer.Parent) then
        CoinContainer = WorkspaceFarm:FindFirstChild("CoinContainer", true)
    end
    local LocalPlayerFarm = PlayersFarm.LocalPlayer
    if CoinFarmEnabled and (LocalPlayerFarm and CoinContainer) then
        local Character = LocalPlayerFarm.Character
        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local RootPart = Character:FindFirstChild("HumanoidRootPart")
            if Humanoid and (Humanoid.Health > 0 and RootPart) then
                local CurrentTime = os.clock()
                if TeleportWalkEnabled then
                    if TeleportInterval > CurrentTime - LastTeleportTime then
                        local NearbyCoin = not (CurrentWalkTarget and CurrentWalkTarget.Parent) and FindNearbyCoin(RootPart)
                        if NearbyCoin then
                            CurrentWalkTarget = NearbyCoin
                            Humanoid:MoveTo(NearbyCoin.Position)
                            Humanoid.MoveToFinished:Wait()
                            CurrentWalkTarget = nil
                        end
                    else
                        local TargetCoin = FindTargetCoin(RootPart)
                        if TargetCoin then
                            RootPart.CFrame = TargetCoin.CFrame
                            LastTeleportedCoin = TargetCoin
                            CurrentWalkTarget = nil
                            LastTeleportTime = CurrentTime
                        end
                    end
                else
                    local TargetCoin = TeleportInterval <= CurrentTime - LastTeleportTime and FindTargetCoin(RootPart)
                    if TargetCoin then
                        RootPart.CFrame = TargetCoin.CFrame
                        LastTeleportedCoin = TargetCoin
                        LastTeleportTime = CurrentTime
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end)

Tabs.Farm:Toggle({
    ["Title"] = "Auto Farm Coin",
    ["Value"] = false,
    ["Callback"] = function(State)
        CoinFarmEnabled = State
        if not State then
            LastTeleportedCoin = nil
            CurrentWalkTarget = nil
        end
    end
})

Tabs.Farm:Toggle({
    ["Title"] = "Teleport + Walk",
    ["Value"] = false,
    ["Callback"] = function(State)
        TeleportWalkEnabled = State
    end
})

Tabs.Farm:Dropdown({
    ["Title"] = "Coin Farm Mode",
    ["Desc"] = "Select which mode you want to.",
    ["Values"] = { "Nearest", "Random" },
    ["Value"] = "Nearest",
    ["Callback"] = function(Value)
        CoinFarmMode = Value
    end
})

Tabs.Farm:Slider({
    ["Title"] = "Teleport Interval",
    ["step"] = 1,
    ["Value"] = {
        ["Min"] = 3,
        ["Max"] = 10,
        ["Default"] = 4
    },
    ["Callback"] = function(Value)
        TeleportInterval = tonumber(Value) or 3
    end
})

local RunServiceSpin = game:GetService("RunService")
local SpinEnabled = false
local SpinSpeed = 5
local SpinConnection = nil

Tabs.Farm:Toggle({
    ["Title"] = "Spin Character",
    ["Desc"] = "Spin for ease",
    ["Value"] = false,
    ["Callback"] = function(State)
        if State then
            SpinEnabled = true
            local RootPart = (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
            SpinConnection = RunServiceSpin.RenderStepped:Connect(function(_)
                if SpinEnabled and RootPart then
                    RootPart.CFrame = RootPart.CFrame * CFrame.Angles(0, math.rad(SpinSpeed), 0)
                end
            end)
        else
            SpinEnabled = false
            if SpinConnection then
                SpinConnection:Disconnect()
                SpinConnection = nil
            end
        end
    end
})

local AntiAFKConnection = nil

Tabs.Farm:Toggle({
    ["Title"] = "Anti-AFK",
    ["Desc"] = "Prevents system kick",
    ["Value"] = false,
    ["Callback"] = function(State)
        if State then
            AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(10)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        elseif AntiAFKConnection then
            AntiAFKConnection:Disconnect()
            AntiAFKConnection = nil
        end
    end
})


        
local matchs = Tabs.Place:Section({
    ["Title"] = "In-game Teleport",
    ["Icon"] = "",
    ["Opened"] = true,
    ["Box"] = true,
    ["BoxBorder"] = true,
  })
    
    
matchs:Button({
    ["Title"] = "Teleport To Sheriff",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/62Z9VRVr/raw"))("ture")
    end
})

matchs:Button({
    ["Title"] = "Teleport To Murderer",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/IrRhoidd/raw"))("true")
    end
})

local PlayersPlace = game:GetService("Players")
local LocalPlayerPlace = PlayersPlace.LocalPlayer
local LoopTeleportAllEnabled = false
originalPosition = nil

matchs:Toggle({
    ["Title"] = "Loop Teleport Everyone",
    ["Value"] = false,
    ["Callback"] = function(State)
        LoopTeleportAllEnabled = State
        if State then
            if LocalPlayerPlace.Character and LocalPlayerPlace.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = LocalPlayerPlace.Character.HumanoidRootPart.CFrame
            end
            startTeleporting()
        elseif originalPosition and LocalPlayerPlace.Character and LocalPlayerPlace.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayerPlace.Character.HumanoidRootPart.CFrame = originalPosition
        end
    end
})

function startTeleporting()
    task.spawn(function()
        while LoopTeleportAllEnabled do
            for _, Player in ipairs(PlayersPlace:GetPlayers()) do
                if Player ~= LocalPlayerPlace and Player.Character and (Player.Character:FindFirstChild("HumanoidRootPart") and LocalPlayerPlace.Character and LocalPlayerPlace.Character:FindFirstChild("HumanoidRootPart")) then
                    LocalPlayerPlace.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                    task.wait(0.1)
                end
            end
            task.wait(0.1)
        end
    end)
end

LocalPlayerPlace.CharacterAdded:Connect(function()
    if LoopTeleportAllEnabled then
        startTeleporting()
    end
end)

local maintp = Tabs.Main:Section({
    ["Title"] = "Map Teleport",
    ["Icon"] = "",
    ["Opened"] = true,
    ["Box"] = true,
    ["BoxBorder"] = true,
  })

maintp:Button({
    ["Title"] = "Teleport To Lobby",
    ["Callback"] = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.5, 142, 0.6)
    end
})

maintp:Button({
    ["Title"] = "Teleport To Map",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastefy.app/lvZs7ugv/raw"))("true")
    end
})

local lpmove = Tabs.Fling:Section({
    ["Title"] = "Player Movement",
    ["Desc"] = "Control your character movement",
    ["Opened"] = true,
    ["Box"] = true,
    ["BoxBorder"] = true,
  })

--[[Tabs.Fling:Button({
    ["Title"] = "Fling Sheriff",
    ["Callback"] = function()
        local PlayersFling = game:GetService("Players")
        local LocalPlayerFling = PlayersFling.LocalPlayer
        local TargetPlayer = nil
        for _, Player in pairs(PlayersFling:GetPlayers()) do
            if Player ~= LocalPlayerFling and Player.Character then
                local Backpack = Player:FindFirstChild("Backpack")
                if Backpack and Backpack:FindFirstChild("Gun") then
                    TargetPlayer = Player
                    break
                end
            end
        end
        if TargetPlayer then
            miniFling(TargetPlayer)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                ["Title"] = "Liquid Hub",
                ["Text"] = "Sheriff Not found!",
                ["Duration"] = 1
            })
        end
    end
})

Tabs.Fling:Button({
    ["Title"] = "Fling Murderer",
    ["Callback"] = function()
        local PlayersFling = game:GetService("Players")
        local LocalPlayerFling = PlayersFling.LocalPlayer
        local TargetPlayer = nil
        for _, Player in pairs(PlayersFling:GetPlayers()) do
            if Player ~= LocalPlayerFling and Player.Character then
                local Backpack = Player:FindFirstChild("Backpack")
                if Backpack and Backpack:FindFirstChild("Knife") then
                    TargetPlayer = Player
                    break
                end
            end
        end
        if TargetPlayer then
            miniFling(TargetPlayer)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                ["Title"] = "VexonHub",
                ["Text"] = "Murderer Not Found",
                ["Duration"] = 1,
                ["Callback"] = AllowRunServiceBind
            })
        end
    end
})

Tabs.Fling:Button({
    ["Title"] = "Fix fling teleport bug",
    ["Callback"] = function()
        local RootPart = game:GetService("Players").LocalPlayer.Character
        if RootPart then
            RootPart = RootPart:FindFirstChild("HumanoidRootPart")
        end
        if RootPart then
            if getgenv().OldPos then
                getgenv().OldPos = RootPart.CFrame
                game.StarterGui:SetCore("SendNotification", {
                    ["Title"] = "VexonHub",
                    ["Text"] = "Teleport bug fixed!",
                    ["Icon"] = "http://www.roblox.com/asset/?id=84519376661277",
                    ["Duration"] = 5
                })
            else
                game.StarterGui:SetCore("SendNotification", {
                    ["Title"] = "VexonHub",
                    ["Text"] = "Didint find any teleport bug?",
                    ["Icon"] = "http://www.roblox.com/asset/?id=84519376661277",
                    ["Duration"] = 5
                })
            end
        end
    end
})
]]
local StarterGuiPlayer = game:GetService("StarterGui")
local PlayersPlayer = game:GetService("Players")
local RunServicePlayer = game:GetService("RunService")
local LocalPlayerPlayer = PlayersPlayer.LocalPlayer
local CameraPlayer = workspace.CurrentCamera
local OriginalCameraSubject = CameraPlayer.CameraSubject
local SelectedPlayer = nil
local DeathNotifyConnection = nil
local OrbitHeartbeatConnection = nil
local OrbitRenderConnection = nil
local ESPRenderConnection = nil
local ESPBillboards = {}
local ESPEnabled = false

local PlayerActions = {
    ["teleport"] = false,
    ["fling"] = false,
    ["view"] = false,
    ["aimLockCam"] = false,
    ["aimLockChar"] = false,
    ["orbit"] = false,
    ["notifyOnDeath"] = false
}

local function SendPlayerNotification(Title, Text, Icon, Duration)
    WindUI:Notify({
      ["Title"] = Title or "Liquid Hub",
      ["Content"] = Text,
      ["Icon"] = Icon or "rbxassetid://109069296276521",
      ["Duration"] = Duration or 4
    })
  --[[StarterGuiPlayer:SetCore("SendNotification", {
        ["Title"] = Title or "VexonHub",
        ["Text"] = Text,
        ["Icon"] = Icon or "rbxassetid://84519376661277",
        ["Duration"] = Duration or 5
    })]]
end

local function AimCameraAtPlayer(Player)
    if Player then
        Player = Player.Character
    end
    if Player then
        Player = Player:FindFirstChild("Head")
    end
    if Player then
        CameraPlayer.CFrame = CFrame.new(CameraPlayer.CFrame.Position, Player.Position)
    end
end

local function AimCharacterAtPlayer(Player)
    local MyRootPart = LocalPlayerPlayer.Character
    if MyRootPart then
        MyRootPart = MyRootPart:FindFirstChild("HumanoidRootPart")
    end
    if Player then
        Player = Player.Character
    end
    if Player then
        Player = Player:FindFirstChild("HumanoidRootPart")
    end
    if MyRootPart and Player then
        MyRootPart.CFrame = CFrame.new(MyRootPart.Position, Player.Position)
    end
end

local function SetupDeathNotification()
    if DeathNotifyConnection then
        DeathNotifyConnection:Disconnect()
        DeathNotifyConnection = nil
    end
    if PlayerActions.notifyOnDeath and SelectedPlayer then
        local Character = SelectedPlayer.Character or SelectedPlayer.CharacterAdded:Wait()
        if Character then
            Character = Character:FindFirstChildOfClass("Humanoid")
        end
        if Character then
            DeathNotifyConnection = Character.Died:Connect(function()
                SendPlayerNotification("Liquid Hub", SelectedPlayer.DisplayName .. " Died")
            end)
        end
    end
end

--[[local function SelectPlayer(PlayerName)
    if DeathNotifyConnection then
        DeathNotifyConnection:Disconnect()
        DeathNotifyConnection = nil
    end
    SelectedPlayer = nil
    if not PlayerName or PlayerName == "" then
        SendPlayerNotification("Liquid Hub", "No One Selected")
        return
    end
    local LowerName = string.lower(PlayerName)
    local FoundPlayer = nil
    for _, Player in ipairs(PlayersPlayer:GetPlayers()) do
        if string.find(string.lower(Player.Name), LowerName, 1, true) or string.find(string.lower(Player.DisplayName), LowerName, 1, true) then
            FoundPlayer = Player
            break
        end
    end
    if FoundPlayer then
        SelectedPlayer = FoundPlayer
        SendPlayerNotification("VexonHub", "Selected: " .. FoundPlayer.DisplayName, "https://www.roblox.com/headshot-thumbnail/image?userId=" .. FoundPlayer.UserId .. "&width=420&height=420&format=png", 10)
        SetupDeathNotification()
    else
        SendPlayerNotification("VexonHub", "Player Not Found...")
    end
end
]]
function createEspForPlayer(Player)
    local Head = Player.Character
    if Head then
        Head = Player.Character:FindFirstChild("Head")
    end
    if Head then
        local Billboard = Instance.new("BillboardGui")
        Billboard.Name = "ESP_Billboard"
        Billboard.Size = UDim2.new(0, 200, 0, 50)
        Billboard.Adornee = Head
        Billboard.AlwaysOnTop = true
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, 0, 1, 0)
        Frame.BackgroundColor3 = Color3.new(0.8, 0, 0)
        Frame.BackgroundTransparency = 0.6
        Frame.Parent = Billboard
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Frame
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.BackgroundTransparency = 1
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.Text = Player.DisplayName
        Label.Font = Enum.Font.SourceSansBold
        Label.TextSize = 16
        Label.Parent = Frame
        ESPBillboards[Player] = {
            ["billboard"] = Billboard
        }
        Billboard.Parent = LocalPlayerPlayer.PlayerGui
    end
end

function updateEspForPlayer(Player)
    local Data = ESPBillboards[Player]
    if Data and Data.billboard then
        local Head = Player.Character
        if Head then
            Head = Head:FindFirstChild("Head")
        end
        if Head and Data.billboard.Adornee ~= Head then
            Data.billboard.Adornee = Head
        end
    end
end

function removeEspForPlayer(Player)
    if ESPBillboards[Player] then
        if ESPBillboards[Player].billboard then
            ESPBillboards[Player].billboard:Destroy()
        end
        ESPBillboards[Player] = nil
    end
end

function runEspLoop()
    for _, Player in ipairs(PlayersPlayer:GetPlayers()) do
        if Player == LocalPlayerPlayer or not Player.Character or not Player.Character:FindFirstChild("Head") then
            if ESPBillboards[Player] then
                removeEspForPlayer(Player)
            end
        elseif ESPBillboards[Player] then
            updateEspForPlayer(Player)
        else
            createEspForPlayer(Player)
        end
    end
end

local lpact = Tabs.Fling:Section({
    ["Title"] = "Player Actions",
    ["Icon"] = "eye",
    ["Opened"] = true,
    ["Box"] = true,
    ["BoxBorder"] = true,
})



lpact:Button({
    ["Title"] = "Teleport to Player",
    ["Callback"] = function()
      
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "Loop Teleport",
    ["Value"] = false,
    ["Callback"] = function()
        
    end
})

--[[
Tabs.Fling:Button({
    ["Title"] = "Fling Player",
    ["Callback"] = function()
        if SelectedPlayer then
            miniFling(SelectedPlayer)
        else
            SendPlayerNotification("VexonHub", "No One Selected")
        end
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "Loop Fling",
    ["Value"] = PlayerActions.fling,
    ["Callback"] = function(State)
        PlayerActions.fling = State
        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.fling and (SelectedPlayer and SelectedPlayer.Parent) do
                        miniFling(SelectedPlayer)
                        task.wait(0.5)
                    end
                end)
            else
                SendPlayerNotification("VexonHub", "No One Selected")
                PlayerActions.fling = false
            end
        else
            return
        end
    end
})

lpact:Button({
    ["Title"] = "View Player (3 sec)",
    ["Callback"] = function()
        if SelectedPlayer then
            local TargetHumanoid = SelectedPlayer.Character
            if TargetHumanoid then
                TargetHumanoid = TargetHumanoid:FindFirstChildOfClass("Humanoid")
            end
            if TargetHumanoid then
                CameraPlayer.CameraSubject = TargetHumanoid
                task.delay(3, function()
                    if CameraPlayer.CameraSubject == TargetHumanoid then
                        CameraPlayer.CameraSubject = OriginalCameraSubject
                    end
                end)
            else
                SendPlayerNotification("VexonHub", "Could not find the player's character to view.")
            end
        else
            SendPlayerNotification("VexonHub", "No One Selected")
        end
    end
})

lpact:Toggle({
    ["Title"] = "Loop View",
    ["Value"] = PlayerActions.view,
    ["Callback"] = function(State)
        PlayerActions.view = State
        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.view and (SelectedPlayer and SelectedPlayer.Parent) do
                        local TargetHumanoid = SelectedPlayer.Character
                        if TargetHumanoid then
                            TargetHumanoid = TargetHumanoid:FindFirstChildOfClass("Humanoid")
                        end
                        if TargetHumanoid then
                            CameraPlayer.CameraSubject = TargetHumanoid
                        end
                        task.wait(0.1)
                    end
                    CameraPlayer.CameraSubject = OriginalCameraSubject
                end)
            else
                SendPlayerNotification("VexonHub", "No One Selected")
                PlayerActions.view = false
            end
        else
            CameraPlayer.CameraSubject = OriginalCameraSubject
            return
        end
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "AimLock (Camera)",
    ["Value"] = PlayerActions.aimLockCam,
    ["Callback"] = function(State)
        PlayerActions.aimLockCam = State
        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.aimLockCam and (SelectedPlayer and SelectedPlayer.Parent) do
                        AimCameraAtPlayer(SelectedPlayer)
                        RunServicePlayer.RenderStepped:Wait()
                    end
                end)
            else
                SendPlayerNotification("VexonHub", "No One Selected")
                PlayerActions.aimLockCam = false
            end
        else
            return
        end
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "AimLock (Character)",
    ["Value"] = PlayerActions.aimLockChar,
    ["Callback"] = function(State)
        PlayerActions.aimLockChar = State
        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.aimLockChar and (SelectedPlayer and SelectedPlayer.Parent) do
                        AimCharacterAtPlayer(SelectedPlayer)
                        RunServicePlayer.Heartbeat:Wait()
                    end
                end)
            else
                SendPlayerNotification("VexonHub", "No One Selected")
                PlayerActions.aimLockChar = false
            end
        else
            return
        end
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "ESP",
    ["Value"] = ESPEnabled,
    ["Callback"] = function(State)
        ESPEnabled = State
        if ESPEnabled then
            if not ESPRenderConnection then
                ESPRenderConnection = RunServicePlayer.RenderStepped:Connect(runEspLoop)
            end
        else
            if ESPRenderConnection then
                ESPRenderConnection:Disconnect()
                ESPRenderConnection = nil
            end
            for Player, _ in pairs(ESPBillboards) do
                removeEspForPlayer(Player)
            end
            table.clear(ESPBillboards)
        end
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "Orbit Player",
    ["Value"] = PlayerActions.orbit,
    ["Callback"] = function(State)
        PlayerActions.orbit = State
        if OrbitHeartbeatConnection then
            OrbitHeartbeatConnection:Disconnect()
            OrbitHeartbeatConnection = nil
        end
        if OrbitRenderConnection then
            OrbitRenderConnection:Disconnect()
            OrbitRenderConnection = nil
        end
        if State then
            if SelectedPlayer then
                task.spawn(function()
                    local OrbitAngle = 0
                    local OrbitSpeed = 8
                    local OrbitRadius = 10
                    OrbitHeartbeatConnection = RunServicePlayer.Heartbeat:Connect(function()
                        if PlayerActions.orbit and (SelectedPlayer and SelectedPlayer.Parent) then
                            local MyRootPart = LocalPlayerPlayer.Character
                            if MyRootPart then
                                MyRootPart = MyRootPart:FindFirstChild("HumanoidRootPart")
                            end
                            local TargetRootPart = SelectedPlayer.Character
                            if TargetRootPart then
                                TargetRootPart = TargetRootPart:FindFirstChild("HumanoidRootPart")
                            end
                            if MyRootPart and TargetRootPart then
                                OrbitAngle = OrbitAngle + OrbitSpeed
                                MyRootPart.CFrame = CFrame.new(TargetRootPart.Position) * CFrame.Angles(0, math.rad(OrbitAngle), 0) * CFrame.new(OrbitRadius, 0, 0)
                            else
                                PlayerActions.orbit = false
                            end
                        else
                            if OrbitHeartbeatConnection then
                                OrbitHeartbeatConnection:Disconnect()
                                OrbitHeartbeatConnection = nil
                            end
                            if OrbitRenderConnection then
                                OrbitRenderConnection:Disconnect()
                                OrbitRenderConnection = nil
                            end
                            return
                        end
                    end)
                    OrbitRenderConnection = RunServicePlayer.RenderStepped:Connect(function()
                        if PlayerActions.orbit and (SelectedPlayer and SelectedPlayer.Parent) then
                            local MyRootPart = LocalPlayerPlayer.Character
                            if MyRootPart then
                                MyRootPart = MyRootPart:FindFirstChild("HumanoidRootPart")
                            end
                            local TargetRootPart = SelectedPlayer.Character
                            if TargetRootPart then
                                TargetRootPart = TargetRootPart:FindFirstChild("HumanoidRootPart")
                            end
                            if MyRootPart and TargetRootPart then
                                MyRootPart.CFrame = CFrame.new(MyRootPart.Position, TargetRootPart.Position)
                            else
                                PlayerActions.orbit = false
                            end
                        else
                            if OrbitHeartbeatConnection then
                                OrbitHeartbeatConnection:Disconnect()
                                OrbitHeartbeatConnection = nil
                            end
                            if OrbitRenderConnection then
                                OrbitRenderConnection:Disconnect()
                                OrbitRenderConnection = nil
                            end
                            return
                        end
                    end)
                end)
            else
                SendPlayerNotification("VexonHub", "No One Selected")
                PlayerActions.orbit = false
            end
        else
            return
        end
    end
})

Tabs.Fling:Toggle({
    ["Title"] = "Notify On Death",
    ["Value"] = PlayerActions.notifyOnDeath,
    ["Callback"] = function(State)
        PlayerActions.notifyOnDeath = State
        SetupDeathNotification()
    end
})

PlayersPlayer.PlayerRemoving:Connect(function(Player)
    if SelectedPlayer and Player == SelectedPlayer then
        SendPlayerNotification("VexonHub", Player.DisplayName .. " left the game")
        SelectedPlayer = nil
        for Key, _ in pairs(PlayerActions) do
            PlayerActions[Key] = false
        end
    end
    removeEspForPlayer(Player)
end)

Tabs.Fling:Section({
    ["Title"] = "Fling",
    ["Icon"] = "utensils"
})

local FlingAuraEnabled = false
local FlingAuraPlayer = game.Players.LocalPlayer

Tabs.Fling:Toggle({
    ["Title"] = "Fling Aura",
    ["Value"] = false,
    ["Callback"] = function(State)
        FlingAuraEnabled = State
        if State then
            task.spawn(function()
                while FlingAuraEnabled do
                    if FlingAuraPlayer.Character and FlingAuraPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        for _, Player in pairs(game.Players:GetPlayers()) do
                            if Player ~= FlingAuraPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                                local TargetRootPart = Player.Character.HumanoidRootPart
                                if (FlingAuraPlayer.Character.HumanoidRootPart.Position - TargetRootPart.Position).Magnitude <= 10 then
                                    miniFling(Player)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

FlingAuraPlayer.CharacterAdded:Connect(function()
    FlingAuraEnabled = false
end)

local PlayersClickFling = game:GetService("Players")
local UserInputServiceClick = game:GetService("UserInputService")
local LocalPlayerClickFling = PlayersClickFling.LocalPlayer
local MouseClickFling = LocalPlayerClickFling:GetMouse()
local CameraClickFling = workspace.CurrentCamera
local ClickFlingEnabled = false

Tabs.Fling:Toggle({
    ["Title"] = "Click Fling",
    ["Value"] = false,
    ["Callback"] = function(State)
        ClickFlingEnabled = State
    end
})

local function GetPlayerFromPart(Part)
    if Part and Part.Parent and Part.Parent:IsA("Model") then
        local _ = PlayersClickFling.GetPlayerFromCharacter
        local _ = Part.Parent
    end
end

MouseClickFling.Button1Down:Connect(function()
    if ClickFlingEnabled then
        local TargetPlayer = GetPlayerFromPart(MouseClickFling.Target)
        if TargetPlayer and TargetPlayer ~= LocalPlayerClickFling then
            miniFling(TargetPlayer)
        end
    end
end)

UserInputServiceClick.TouchTap:Connect(function(TouchPositions, GameProcessed)
    if ClickFlingEnabled and not GameProcessed then
        local TouchPosition = TouchPositions[1]
        local CameraPosition = CameraClickFling.CFrame.Position
        local RayDirection = CameraClickFling:ViewportPointToRay(TouchPosition.X, TouchPosition.Y).Direction * 500
        local RayParams = RaycastParams.new()
        RayParams.FilterDescendantsInstances = { LocalPlayerClickFling.Character }
        RayParams.FilterType = Enum.RaycastFilterType.Blacklist
        local RayResult = workspace:Raycast(CameraPosition, RayDirection, RayParams)
        local HitInstance
        if RayResult then
            HitInstance = RayResult.Instance
        end
        local TargetPlayer = GetPlayerFromPart(HitInstance)
        if TargetPlayer and TargetPlayer ~= LocalPlayerClickFling then
            miniFling(TargetPlayer)
        end
    end
end)

local FlingAllEnabled = false
local PlayersFlingAll = game:GetService("Players")
local LocalPlayerFlingAll = PlayersFlingAll.LocalPlayer
local OriginalCFrameFlingAll = (LocalPlayerFlingAll.Character or LocalPlayerFlingAll.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
local SavedCFrameFlingAll
if OriginalCFrameFlingAll then
    SavedCFrameFlingAll = OriginalCFrameFlingAll.CFrame
else
    SavedCFrameFlingAll = OriginalCFrameFlingAll
end

Tabs.Fling:Toggle({
    ["Title"] = "Fling All (Buggy?)",
    ["Value"] = false,
    ["Callback"] = function(State)
        FlingAllEnabled = State
        if State then
            task.spawn(function()
                while FlingAllEnabled do
                    for _, Player in pairs(PlayersFlingAll:GetPlayers()) do
                        if Player ~= LocalPlayerFlingAll then
                            miniFling(Player)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        elseif SavedCFrameFlingAll and OriginalCFrameFlingAll then
            OriginalCFrameFlingAll.CFrame = SavedCFrameFlingAll
        end
    end
})

local _ = game.Players.LocalPlayer
game:GetService("UserInputService")

local TouchFlingEnabled
if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    TouchFlingEnabled = false
else
    local Decal = Instance.new("Decal")
    Decal.Name = "juisdfj0i32i0eidsuf0iok"
    Decal.Parent = game:GetService("ReplicatedStorage")
    TouchFlingEnabled = false
end

local function TouchFlingLoop()
    local Character = nil
    local RootPart = nil
    local ToggleValue = 0.1
    while TouchFlingEnabled do
        game:GetService("RunService").Heartbeat:Wait()
        local LocalPlayerTouch = game.Players.LocalPlayer
        while TouchFlingEnabled and not (Character and (Character.Parent and (RootPart and RootPart.Parent))) do
            game:GetService("RunService").Heartbeat:Wait()
            Character = LocalPlayerTouch.Character
            RootPart = Character:FindFirstChild("HumanoidRootPart") or (Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso"))
        end
        if TouchFlingEnabled then
            local CurrentVelocity = RootPart.Velocity
            RootPart.Velocity = CurrentVelocity * 10000 + Vector3.new(0, 10000, 0)
            game:GetService("RunService").RenderStepped:Wait()
            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity
            end
            game:GetService("RunService").Stepped:Wait()
            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity + Vector3.new(0, ToggleValue, 0)
                ToggleValue = ToggleValue * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    ["Title"] = "Touch Fling",
    ["Value"] = false,
    ["Callback"] = function(State)
        if State then
            TouchFlingEnabled = true
            coroutine.wrap(TouchFlingLoop)()
        else
            TouchFlingEnabled = false
        end
    end
})

local AntiFlingEnabled = false
local AntiFlingConnections = {}

local function DisablePlayerCollision(Player)
    if AntiFlingEnabled and Player.Character then
        for _, Descendant in pairs(Player.Character:GetDescendants()) do
            if Descendant:IsA("BasePart") and Descendant.CanCollide then
                Descendant.CanCollide = false
            end
        end
    end
end

local function EnableAllPlayerCollisions()
    for _, Player in pairs(game.Players:GetPlayers()) do
        if Player ~= game.Players.LocalPlayer and Player.Character then
            for _, Descendant in pairs(Player.Character:GetDescendants()) do
                if Descendant:IsA("BasePart") then
                    Descendant.CanCollide = true
                end
            end
        end
    end
end

local function StartAntiFling()
    for _, Player in pairs(game.Players:GetPlayers()) do
        if Player ~= game.Players.LocalPlayer then
            local Connection = game:GetService("RunService").Stepped:Connect(function()
                DisablePlayerCollision(Player)
            end)
            table.insert(AntiFlingConnections, Connection)
        end
    end
    game.Players.PlayerAdded:Connect(function(Player)
        if Player ~= game.Players.LocalPlayer then
            local Connection = game:GetService("RunService").Stepped:Connect(function()
                DisablePlayerCollision(Player)
            end)
            table.insert(AntiFlingConnections, Connection)
        end
    end)
end

local function StopAntiFling()
    for _, Connection in pairs(AntiFlingConnections) do
        Connection:Disconnect()
    end
    table.clear(AntiFlingConnections)
    EnableAllPlayerCollisions()
end

Tabs.Fling:Toggle({
    ["Title"] = "Anti Fling",
    ["Value"] = false,
    ["Callback"] = function(State)
        AntiFlingEnabled = State
        if State then
            StartAntiFling()
        else
            StopAntiFling()
        end
    end
})

local CustomFlingPower = 1000

local CustomTouchFlingEnabled
if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    CustomTouchFlingEnabled = false
else
    local Decal = Instance.new("Decal")
    Decal.Name = "juisdfj0i32i0eidsuf0iok"
    Decal.Parent = game:GetService("ReplicatedStorage")
    CustomTouchFlingEnabled = false
end

local function CustomTouchFlingLoop()
    local Character = nil
    local RootPart = nil
    local ToggleValue = 0.1
    while CustomTouchFlingEnabled do
        game:GetService("RunService").Heartbeat:Wait()
        local LocalPlayerCustom = game.Players.LocalPlayer
        while CustomTouchFlingEnabled and not (Character and (Character.Parent and (RootPart and RootPart.Parent))) do
            game:GetService("RunService").Heartbeat:Wait()
            Character = LocalPlayerCustom.Character
            RootPart = Character:FindFirstChild("HumanoidRootPart") or (Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso"))
        end
        if CustomTouchFlingEnabled then
            local CurrentVelocity = RootPart.Velocity
            RootPart.Velocity = CurrentVelocity * CustomFlingPower + Vector3.new(0, 100, 0)
            game:GetService("RunService").RenderStepped:Wait()
            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity
            end
            game:GetService("RunService").Stepped:Wait()
            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity + Vector3.new(0, ToggleValue, 0)
                ToggleValue = ToggleValue * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    ["Title"] = "Costum Touch Fling Power",
    ["Value"] = false,
    ["Callback"] = function(State)
        if State then
            CustomTouchFlingEnabled = true
            coroutine.wrap(CustomTouchFlingLoop)()
        else
            CustomTouchFlingEnabled = false
        end
    end
})

Tabs.Fling:Slider({
    ["Title"] = "Fling Power Value",
    ["Value"] = {
        ["Min"] = 1,
        ["Max"] = 10000,
        ["Default"] = 100
    },
    ["Callback"] = function(Value)
        CustomFlingPower = Value
    end
})
]]

