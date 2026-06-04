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

function getMap()
    for _, Child in ipairs(workspace:GetChildren()) do
        if Child:FindFirstChild("CoinContainer") and Child:FindFirstChild("Spawns") then
            return Child
        end
    end
    return nil
end

loadstring(game:HttpGet("https://pastefy.app/hcVkWhQF/raw"))()


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
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/2eOpHYrg/raw"))("true")
    end
})

Mrd:Button({
        Title = "Kill Sheriff",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/YBXds1as/raw"))("true")
    end
})

Mrd:Button({
        Title = "Kill Innocents",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/vmG5vtCc/raw"))("true")
    end
})

--service
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

Mrd:Toggle({
        Title = "Hitbox",
        Desc = "Toggle Hitbox on/off",
        Default = false,
        Callback = function(v)
            HitboxSettings.Hitbox.Enabled = v
        if v then
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

Mrd:Slider({
        Title = "Hitbox Size",
        Desc = "Set hitbox size (1-20)",
        Value = {
            Min = 1,
            Max = 20,
            Default = 10,
        },
        Callback = function(v)
            HitboxSettings.Hitbox.Size = v
})

Mrd:Colorpicker({
            Title = "Hitbox Color",
            Desc = "Set Hitbox Color",
            Default = Color3.fromRGB(0, 0, 255),
            Callback = function(color)
                HitboxSettings.Hitbox.Color = color
})
