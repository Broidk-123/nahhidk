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
