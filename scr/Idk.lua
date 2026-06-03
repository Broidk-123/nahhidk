--[[
LIQUID HUB TEMP FILE 
]]
--local WindUI = _G.WindUI
local scriptVersion = "v1.667.67"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


---- services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")

local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local SoundService = game:GetService("SoundService")

local Roles = {
    Owner = {
		"eddiejr031"
    },

    Admin = {
        "JumpyFrog80",
		"alvicc12"
    },

	Beta = {
		""
	},

    Free = {}
}



local function hasRole(roleName)
    local roleList = Roles[roleName]
    if not roleList then return false end

    for _, name in ipairs(roleList) do
        if name == player.Name then
            return true
        end
    end

    return false
end

-- idk what i should call these, but yea
local canUse = hasRole("Admin") or hasRole("Owner")
local isOwner = hasRole("Owner")
local isAdmin = hasRole("Admin")
local isBeta = hasRole("Beta")
local isFree = hasRole("Free")

--  Colors
local RoleColors = {
    Owner = Color3.fromHex("#ff2d2d"),
    Admin = Color3.fromHex("#ffae00"),
    Beta  = Color3.fromHex("#a855f7"),
    Free  = Color3.fromHex("#30ff6a")
}

--  Icons
local RoleIcons = {
    Owner = "crown",
    Admin = "shield",
    Beta  = "flask",
    Free  = "user"
}

--  Detect Role
local function getRole()
    if isOwner then
        return "Owner"
    elseif isAdmin then
        return "Admin"
    elseif isBeta then
        return "Beta"
    else
        return "Free"
    end
end

local roleName = getRole()



-------- TAG CALLLBACK



if game.PlaceId == 126884695634066 then
    GAG = true
elseif game.PlaceId == 130594398886540 then
	GH = true
elseif game.PlaceId == 4924922222 then
    Brookhaven = true
elseif game.PlaceId == 119048529960596 then
    RT3 = true
elseif game.PlaceId == 3398014311 then
	RT2 = true
elseif game.PlaceId == 2753915549 then
    BF1 = true
elseif game.PlaceId == 4442272183 then
	BF2 = true
elseif game.PlaceId == 7449423635 then
	BF3 = true
elseif game.PlaceId == 77747658251236 then
    SailorPiece = true
elseif game.PlaceId == 3101667897 then
	los = true
elseif game.PlaceId == 89469502395769 then
	Kick = true
elseif game.PlaceId == 17625359962 then
	Rvs = true
elseif game.PlaceId == 109983668079237 then
	SAB = true
elseif game.PlaceId == 6284583030 then
	PSX = true
elseif game.PlaceId == 8737899170 then
	PS99 = true
elseif game.PlaceId == 18901165922 then
	PG = true
elseif game.PlaceId == 920587237 then
	AM = true
elseif game.PlaceId == 79546208627805 then
	Nights = true
elseif game.PlaceId == 10260193230 then
	MS = true
elseif game.PlaceId == 142823291 then
	MM2 = true
elseif game.PlaceId == 116495829188952 then 
	DRL = true
elseif game.PlaceId == 70876832253163 then
	DRG = true
elseif game.PlaceId == 13772394625 then
	BD = true
end

--[[ 

== GAME SUMMARY ==
GAG = Grow a Garden
GH  = Garden Horizon
BH  = Brookhaven RP
RT3 = Restaurant Tycoon 3
RT2 = Restaurant Tycoon 2
BF1 = Blox Fruits | First Sea
BF2 = Blox Fruits | Second Sea
BF3 = Blox Fruits | Third Sea
SP  = Sailor Piece
los = Legend of Speed
kck = Kick a Lucky Block
Rvs = Rivals
SAB = Steal a Brainrot
PSX = Pet Simulator X
PS99 = Pet Simulator 99
PG = Pet's Go
AM. = Adopt Me
99N = 99 Nights in the Forest
MS. = Meme Sea
MM2 = Murder Mystery 2
DRL.= Dead Rails (Lobby)
DRG = Dead Rails (game)
BD. = Blade Ball

Tab: Script Tab

]]



WindUI:Popup({
    Title = "Welcome, ".. player.Name.. "!",
    Icon = "info",
    Content = "Hello! Thanks for using our script! Join to our discord server!",
    Buttons = {
        {
            Title = "Get Started",
            Icon = "arrow-right",
			Variant = "Primary",
            Callback = function() 
	
WindUI:Notify({
                Title = "Liquid Hub • Loaded!",
                Content = "Universal Hub Loaded..",
                Duration = 12, -- 3 seconds
                Icon = "bell",
})

WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Explore the features of the script, enjoy!",
                Duration = 10, -- 3 seconds
                Icon = "bell",
})
					
				end,
            
        },
			--[[{
				Title = "Discord",
				Icon = "Copy",
				Variant = "Secondary",
				Callback = function()
					setclipboard("https://discord.gg/jYkbeWtYsf")
					WindUI:Notify({
							Title = "Liquid Hub",
							Content = "Discord Server copied to clipboard!",
							Icon = "check-circle",
							Duration = 3,
						})
						end
					},]]
    }
})

local Window = WindUI:CreateWindow({
    Title = "Liquid Hub | Universal",
    Icon = "rbxassetid://85217490213932", -- lucide icon. optional
	IconSize = "42",
    Author = "by Takgoo", -- optional
	Theme = "Crimson",
    HideSearchBar = false,
	Transparent = true,
	Resizable = true,
	NewElements = true,
	Acrylic = true,
	ScrollBarEnabled = true,
	SideBarWidth = 180,
	Size = UDim2.fromOffset(720, 500),
	MinSize = Vector2.new(580, 400),
	MaxSize = Vector2.new(1050, 725),
		

		User = {
			Enabled = true,
        
        
        Callback = function()
            print("clicked")
        end,
    },
		Topbar = {
			Height = 46,
			ButtonsType = "Default", -- "Default" or "Mac"
		},
		
})



Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "Theme Changed",
        Content = "Current theme: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)


Window:Tag({
    Title = roleName,
    Icon = RoleIcons[roleName],
    Color = RoleColors[roleName],
	Border = true,
    Radius = 6
})


local ClockTag = Window:Tag({
    Title = "Loading...",
    Icon = "clock",
    Color = Color3.fromHex("#1c1c1c"),
    Border = true,
    Radius = 8,
})

local is24Hour = true

task.spawn(function()
    while true do
        task.wait(1)
			local Days = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}
local Months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}

			
        local t = os.date("*t")
        local day = Days[t.wday]
        local month = Months[t.month]
        local min = string.format("%02d", t.min)
        local timeStr

        if is24Hour then
            local hour = string.format("%02d", t.hour)
            timeStr = string.format("%s:%s", hour, min)
        else
            local hour = t.hour
            local suffix = hour >= 12 and "PM" or "AM"
            hour = hour % 12
            if hour == 0 then hour = 12 end
            timeStr = string.format("%02d:%s %s", hour, min, suffix)
        end

        ClockTag:SetTitle(string.format("%s | %s, %s %d", timeStr, day, month, t.day))
    end
end)



local Tag1 = Window:Tag({
    Title = "Loading...",
    Icon = "wifi",
    Color = Color3.fromHex("#30ff6a"),
	Border = true,
    Radius = 10,
})

local fps = 0
local lastTime = tick()

-- FPS Calculator
RunService.RenderStepped:Connect(function()
    local now = tick()
    fps = math.floor(1 / (now - lastTime))
    lastTime = now
end)

-- Main Loop (update UI)
task.spawn(function()
    while true do
        task.wait(1)

        -- Get Ping (MS)
        local pingStat = Stats.Network.ServerStatsItem["Data Ping"]
        local ms = math.floor(pingStat:GetValue())

        -- Determine Color
        local color

        if fps <= 24 or ms >= 225 then
            --color = Color3.fromRGB(255, 0, 0) -- RED
			color = Color3.fromHex("#e61212")
        elseif fps <= 45 or ms >= 120 then
            --color = Color3.fromRGB(255, 255, 0) -- YELLOW
			color = Color3.fromHex("#ffa703")
        else
            --color = Color3.fromRGB(0, 255, 0) -- GREEN
			color = Color3.fromHex("#24ff03")
        end

        -- Update Tag
        Tag1:SetTitle(string.format("%d MS | %d FPS", ms, fps))
        Tag1:SetColor(color)
    end
end)



local VersionTag = Window:Tag({
    Title = scriptVersion,
    Icon = "github",
    Color = Color3.fromHex("#1c1c1c"),
	Border = true,
    Radius = 12,
})

------ TABS
local Mod = Window:Tab({
		Title = "Moderator Only",
		Icon = "hammer",
		Locked = not canUse,
	})

Window:Divider()
local Section1 = Window:Section({
    Title = "Informations",
    Icon = "",
    Opened = true,
})

local Main = Section1:Tab({
    Title = "Info",
    Icon = "info", -- optional
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local Upd = Section1:Tab({
    Title = "Updates",
    Icon = "message-square", -- optional
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local lp = Section1:Tab({
	Title = "Player",
	Icon = "user", -- optional
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local Server = Section1:Tab({
	Title = "Server",
	Icon = "globe",
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local Section2 = Window:Section({
    Title = "Main",
    Icon = "",
    Opened = true,
})

local Script = Section2:Tab({
    Title = "Scripts",
    Icon = "bird", -- optional
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local More = Section2:Tab({
    Title = "More Scripts",
    Icon = "bird", -- optional
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

--[[local Troll = Section2:Tab({
	Title = "Troll",
	Icon = "skull",
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})
]]

local Section3 = Window:Section({
    Title = "Misc",
    Icon = "",
    Opened = true,
})

local Teleport = Section3:Tab({
	Title = "Teleport",
	Icon = "locate",
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})
local Settings = Section3:Tab({
    Title = "Settings",
    Icon = "settings", -- optional
	IconColor = Color3.fromRGB(5, 5, 5), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = true, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})



-- TAB SELECTED
Main:Select()
--- MAIN INFO

local Stack11 = Main:Section({
		Title = "Info",
		Icon = "info",
		TextXAlignment = "Center",
	})
local HStack = Stack11:HStack()

local VStack1 = HStack:VStack() -- left
local VStack2 = HStack:VStack() -- right


--  USER INFO

--[[
local groupsect = VStack3:Section({
		Title = "Action Buttons",
		TextXAlignment = "Center",
	})]]

local username = player.Name
local displayName = player.DisplayName
local userId = player.UserId

-- Avatar Image
local userImage = string.format(
    "https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png",
    userId
)

local userParagraph = VStack1:Paragraph({
    Title = displayName, -- 🔥 Display Name sa Title
    Desc = "@" .. username, -- 🔥 Username sa baba
    Image = userImage,
    ImageSize = 80,
    
})



-- 🔁 Execution Counter (global para di ma-reset agad)
getgenv().ExecutionCount = (getgenv().ExecutionCount or 0) + 1

-- 🧾 Account Info
local accountId = player.UserId
local accountAge = player.AccountAge -- in days
local executionTimes = getgenv().ExecutionCount

-- 📌 Format Desc
local descText = string.format(
    "Account ID: %d\nAccount Age: %d days\nExecution Times: %d",
    accountId,
    accountAge,
    executionTimes
)

-- 📌 UI
local accountParagraph = VStack1:Paragraph({
    Title = "Account Details",
    Desc = descText,
    
})



-- 📌 Paragraph
local StatsParagraph = VStack1:Paragraph({
    Title = "Character Stats",
    Desc = "Loading...",
    
})

-- 🔄 Update loop
RunService.RenderStepped:Connect(function()
    local char = player.Character
    if not char then return end

    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")

    if humanoid and root then
        local health = math.floor(humanoid.Health)
        local maxHealth = math.floor(humanoid.MaxHealth)

        local speed = humanoid.WalkSpeed
        local jump = humanoid.JumpPower

        local rigType =
            humanoid.RigType == Enum.HumanoidRigType.R15
            and "R15"
            or "R6"

        local pos = root.Position

        local text = string.format(
            "Health: %d/%d\nWalkSpeed: %d\nJumpPower: %d\nRig Type: %s\nPos: X: %.1f | Y: %.1f | Z: %.1f",
            health,
            maxHealth,
            speed,
            jump,
            rigType,
            pos.X,
            pos.Y,
            pos.Z
        )

        StatsParagraph:SetDesc(text)
    end
end)

local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif syn then
        return "Synapse X"
    elseif KRNL_LOADED then
        return "KRNL"
    elseif is_sirhurt_closure then
        return "SirHurt"
    elseif pebc_execute then
        return "ProtoSmasher"
    elseif getexecutorname then
        return getexecutorname()
    else
        return "Executor Unknown"
    end
end

local executorName = detectExecutor()

local UIS = game:GetService("UserInputService")

local platform = "Unknown"

if UIS.TouchEnabled and not UIS.KeyboardEnabled then
    platform = "Mobile"
elseif UIS.KeyboardEnabled then
    platform = "PC"
elseif UIS.GamepadEnabled then
    platform = "Console"
end

local device = "Unknown"
local platformEnum = UIS:GetPlatform()

if platformEnum == Enum.Platform.IOS then
    device = "iOS"
elseif platformEnum == Enum.Platform.Android then
    device = "Android"
elseif platformEnum == Enum.Platform.Windows then
    device = "Windows"
elseif platformEnum == Enum.Platform.OSX then
    device = "MacOS"
else
    device = "Unsupported"
end

local ExecuteTime = os.date("%H:%M:%S")

local descText = string.format(
    "Executor: %s\nPlatform: %s\nDevice: %s\nExecuted At: %s",
    executorName,
    platform,
    device,
    ExecuteTime
)

local exe = VStack1:Paragraph({
    Title = "Client Info",
    Desc = descText,
    Locked = false,
})

local UserAction = VStack1:Section({
		Title = "User Action",
		TextXAlignment = "Center",
	})

VStack1:Button({
		Title = "Copy Username",
		Icon = "copy",
		Callback = function()
			setclipboard("" .. player.Name)
			WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Copied to clipboard",
						Icon = "clipboard-copy",
						Duration = 2
					})
		end,
	})

VStack1:Button({
		Title = "Copy User ID",
		Icon = "copy",
		Callback = function()
			setclipboard("" .. player.UserId)
			WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Copied to clipboard",
						Icon = "clipboard-copy",
						Duration = 2
					})
		end,
	})

VStack1:Divider()

VStack1:Button({
	Title = "Reset Character",
	Icon = "rotate-ccw",
	Callback = function()
		Players.LocalPlayer.Character:BreakJoints()
	end,
})

VStack1:Button({
	Title = "Leave Game",
	Icon = "door-open",
	Callback = function()
		Players.LocalPlayer:Kick("You left the game.")
	end,
})

-- 📌 Paragraph




-- 🎮 GAME INFO


local placeId = game.PlaceId
local gameName = "Unknown Game"
local creatorName = "Unknown"

pcall(function()
    local info = MarketplaceService:GetProductInfo(placeId)
    gameName = info.Name

    -- Creator info
    if info.Creator and info.Creator.Name then
        creatorName = info.Creator.Name
    end
end)

-- Game Thumbnail
local gameImage = string.format(
    "https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=420&height=420&format=png",
    placeId
)

local gameParagraph = VStack2:Paragraph({
    Title = gameName, -- 🔥 Game Name sa Title
    Desc = "@" .. creatorName, -- 🔥 Creator username
    Image = gameImage,
    ImageSize = 80,
    Locked = false,
})

--InfoGroup2:Space()

--local InfoGroup3 = Main:Group({})
local placeId = game.PlaceId
local gameId = game.GameId

local creatorId = "Unknown"
local creatorName = "Unknown"

pcall(function()
    local info = MarketplaceService:GetProductInfo(placeId)

    if info.Creator then
        creatorId = info.Creator.Id or "Unknown"
        creatorName = info.Creator.Name or "Unknown"
    end
end)

local gameDetailsParagraph = VStack2:Paragraph({
    Title = "Game Details",
    Desc = "Loading...",
    Locked = false,
})

local function updateUI()
    local descText = string.format(
        "Place Id: %s\nGame Id: %s\nCreator Name: %s\nCreator Id: %s",
        tostring(placeId),
        tostring(gameId),
        tostring(creatorName),
        tostring(creatorId)
    )

    gameDetailsParagraph:SetDesc(descText)
end

updateUI()

local serverParagraph = VStack2:Paragraph({
    Title = "Server Details",
    Desc = "Loading...",
    Locked = false,
})

task.spawn(function()

    while task.wait(1) do

        local currentPlayers = #Players:GetPlayers()
        local maxPlayers = Players.MaxPlayers

        local serverType = game.PrivateServerId ~= "" and "Private" or "Public"

        local descText = string.format(
            "Players: %d/%d\nServer Type: %s\nJob ID: %s",
            currentPlayers,
            maxPlayers,
            serverType,
            tostring(game.JobId)
        )

        serverParagraph:SetDesc(descText)

    end

end)







-- 🔍 Executor Detection


-- 📱 Platform (Mobile / PC / Console)


local GameAction = VStack2:Section({
		Title = "Game Action",
		TextXAlignment = "Center",
	})

VStack2:Button({
	Title = "Copy Place ID",
	Icon = "copy",
	Callback = function()
			setclipboard(game.PlaceId)
				WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Copied to clipboard",
						Icon = "clipboard-copy",
						Duration = 2
					})
			end,
})

VStack2:Button({
	Title = "Copy Game ID",
	Icon = "copy",
	Callback = function()
			setclipboard(game.GameId)
				WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Copied to clipboard",
						Icon = "clipboard-copy",
						Duration = 2
					})
	end,
})

VStack2:Button({
	Title = "Copy Creator ID",
	Icon = "copy",
	Callback = function()
		if setclipboard then
			setclipboard(tostring(creatorId))
				WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Copied to clipboard",
						Icon = "clipboard-copy",
						Duration = 2
					})
		else
			print("Creator ID:", PlaceInfo.Creator.Id)
		end
	end,
})

VStack2:Button({
	Title = "Copy Creator Name",
	Icon = "copy",
	Callback = function()
			setclipboard(tostring(creatorName))
				WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Copied to clipboard",
						Icon = "clipboard-copy",
						Duration = 2
					})
			end,
})
--[[local gs2 = VStack3:Section({
		Title = "User Info",
		Icon = "user",
		
	})

]]
local Stack22 = Stack11:Section({
		Title = "Credits",
		Icon = "heart",
		TextXAlignment = "Center",
		Opened = true
	})

local Stackk1 = Stack22:HStack()

local GRStack1 = Stackk1:VStack()
local GRStack2 = Stackk1:VStack()

local aboutme = GRStack1:Paragraph({
		Title = "Dev/Owner",
		Desc = "- Takgoo (a.k.a POGI)\n- Filipino\n- Not 18+\n- Always POGI",
		Image = "https://i.pinimg.com/474x/0f/04/ac/0f04ac135a8d6db96514bd97261c1c97.jpg",
        ImageSize = 60,
		Buttons = {
        {
            Icon = "user",
            Title = "Discord Account",
            Callback = function() 
				setclipboard("@takgoo.second")
					WindUI:Notify({
							Title = "Liquid Hub",
							Content = "Discord username copied to clipboard",
							Icon = "clipboard",
							Duration = 2,
						})
				end,
        }
		}
	})
local Credits = GRStack1:Paragraph({
    Title = "Credentials",
    Desc = "Takgoo - Dev/Owner\nWind UI\nLucide Icons\nLiquidians (Community)",
   --Color = "Red",
    Image = "https://i.pinimg.com/474x/0f/04/ac/0f04ac135a8d6db96514bd97261c1c97.jpg",
    ImageSize = 65,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})

GRStack1:Button({
				Title = "Wind UI Github",
				Desc = "Copies Wind UI's Github site",
				Icon = "copy",
				Callback = function()
					setclipboard("https://github.com/Footagesus/WindUI")
						WindUI:Notify({
								Title = "Liquid Hub",
								Content = "Wind UI's Github Repository copied to clipboard",
								Icon = "clipboard",
								Duration = 2,
							})
					end
				})

GRStack1:Button({
				Title = "Lucide Icon",
				Desc = "Copies Lucide's website",
				Icon = "copy",
				Callback = function()
						setclipboard("https://lucide.dev/")
									WindUI:Notify({
								Title = "Liquid Hub",
								Content = "Lucide Icon's copied to clipboard",
								Icon = "clipboard",
								Duration = 2,
							})
					end
				})
local discordParagraph = GRStack2:Paragraph({
			Title = "Liquid Hub",
			Desc = "join now",
			Image = "rbxassetid://85217490213932",
		--	.. Response.guild.id
			--	.. "/"
			--	.. Response.guild.icon
			--	.. ".png?size=1024",
		    Thumbnail = "",
		--Thumbnail = "https://cdn.discordapp.com/banners/1300692552005189632/35981388401406a4b7dffd6f447a64c4.png?size=512",
			ImageSize = 45,
			Buttons = {
				{
					Title = "Copy link",
					Icon = "link",
					Callback = function()
						local Dialog = Window:Dialog({
    Icon = "external-link",
    Title = "Liquid Hub | Discord Community",
    Content = "Join to our discord servers.",
    Buttons = {
        {
            Title = "NEW",
			Icon = "link",
            Callback = function()
                setclipboard("https://discord.gg/jYkbeWtYsf")
				WindUI:Notify({
				Title = "Liquid Hub",
				Content = "New discord server copied to clipboard",
				Icon = "link",
				Duration = 2
											})
            end,
        },
        {
            Title = "OLD",
			Icon = "link",
            Callback = function()
                setclipboard("https://discord.gg/wDMPK3QAmY")
				WindUI:Notify({
				Title = "Liquid Hub",
				Content = "Old discord server copied to clipboard",
				Icon = "link",
				Duration = 2
											})						
            end,
        },
    },
})	    
					end,
				},
			},
		})
		







local dscfeedb = Stack11:Section({
		Title = "Feedback",
		Icon = "pencil",
		TextXAlignment = "Center",
		Opened = true,
	})

local discordstack = dscfeedb:HStack()

local discordstack1 = discordstack:VStack()
local discordstack2 = discordstack:VStack()

local cooldown = false
local messageValue = ""

discordstack1:Input({
    Title = "Message",
    Desc = "Enter message",
    Icon = "message-circle",
    Placeholder = "Type here...",
    Callback = function(value)
        messageValue = value
    end,
})

discordstack1:Button({
    Title = "Send Message",
    Desc = "Send message to Discord",
    Icon = "send",
    Callback = function()
        local WEBHOOK_URL = ""

        if cooldown then
            WindUI:Notify({ Title = "Cooldown!", Content = "Please wait before sending.", Icon = "clock", Duration = 3 })
            return
        end

        if messageValue == "" or messageValue == nil then
            WindUI:Notify({ Title = "Error!", Content = "Message cannot be empty!", Icon = "alert-circle", Duration = 3 })
            return
        end

        -- Fetch avatar URL
        local avatarUrl = "https://www.roblox.com/bust-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

        pcall(function()
            local response = request({
                Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. player.UserId .. "&size=420x420&format=Png&isCircular=false",
                Method = "GET",
            })
            local data = HttpService:JSONDecode(response.Body)
            if data and data.data and data.data[1] then
                avatarUrl = data.data[1].imageUrl
            end
        end)

        -- Send to Discord
        local success, err = pcall(function()
            request({
                Url = WEBHOOK_URL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    content = messageValue,
                    username = player.DisplayName .. " (@" .. player.Name .. ")",
                    avatar_url = avatarUrl,
                })
            })
        end)

        if success then
            WindUI:Notify({ Title = "Message Sent!", Content = "Your message was sent to Discord!", Icon = "message-circle-check", Duration = 3 })
            cooldown = true
            task.delay(5, function() cooldown = false end)
        else
            print("WEBHOOK ERROR: " .. tostring(err))
            WindUI:Notify({ Title = "Failed!", Content = "Something went wrong, try again.", Icon = "message-circle-off", Duration = 3 })
        end
    end,
})	


local ratingCooldown = false
local ratingValue = ""
local ratingMessage = ""

local starColors = {
    ["⭐"] = 15158332,
    ["⭐⭐"] = 15105570,
    ["⭐⭐⭐"] = 16766720,
    ["⭐⭐⭐⭐"] = 65280,
    ["⭐⭐⭐⭐⭐"] = 5814783,
}

discordstack2:Dropdown({
    Title = "Star Rating",
    Desc = "Rate the script",
    Icon = "star",
    Values = {
        "⭐",
        "⭐⭐",
        "⭐⭐⭐",
        "⭐⭐⭐⭐",
        "⭐⭐⭐⭐⭐",
    },
    Callback = function(value)
        ratingValue = value
    end,
})

discordstack2:Input({
    Title = "Rating Message",
    Desc = "Tell us about your experience",
    Icon = "message-circle",
    Placeholder = "Type your feedback here...",
    Callback = function(value)
        ratingMessage = value
    end,
})

discordstack2:Button({
    Title = "Send Feedback",
    Desc = "Submit your rating",
    Icon = "send",
    Callback = function()
        local WEBHOOK_URL = ""

        if ratingCooldown then
            WindUI:Notify({ Title = "Cooldown!", Content = "Please wait before sending another feedback.", Icon = "clock", Duration = 3 })
            return
        end

        if ratingValue == "" or ratingValue == nil then
            WindUI:Notify({ Title = "Error!", Content = "Please select a star rating first!", Icon = "alert-circle", Duration = 3 })
            return
        end

        if ratingMessage == "" or ratingMessage == nil then
            WindUI:Notify({ Title = "Error!", Content = "Please write a message before sending!", Icon = "alert-circle", Duration = 3 })
            return
        end

        -- Fetch avatar URL
        local avatarUrl = "https://www.roblox.com/bust-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

        pcall(function()
            local response = request({
                Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. player.UserId .. "&size=420x420&format=Png&isCircular=false",
                Method = "GET",
            })
            local data = HttpService:JSONDecode(response.Body)
            if data and data.data and data.data[1] then
                avatarUrl = data.data[1].imageUrl
            end
        end)

        -- Send to Discord
        local success, err = pcall(function()
            request({
                Url = WEBHOOK_URL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    username = player.DisplayName .. " (@" .. player.Name .. ")",
                    avatar_url = avatarUrl,
                    embeds = {
                        {
                            title = ratingValue .. "  |  Script Feedback",
                            description = ">>> " .. ratingMessage,
                            color = starColors[ratingValue] or 16766720,
                            fields = {
                                {
                                    name = "👤 Player",
                                    value = player.DisplayName .. " (@" .. player.Name .. ")",
                                    inline = true,
                                },
                                {
                                    name = "🎮 User ID",
                                    value = tostring(player.UserId),
                                    inline = true,
                                },
                                {
                                    name = "⭐ Rating",
                                    value = ratingValue,
                                    inline = true,
                                },
                            },
                            thumbnail = {
                                url = avatarUrl,
                            },
                            footer = {
                                text = "Liquid Hub | Feedback System",
                                icon_url = avatarUrl,
                            },
                            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                        }
                    }
                })
            })
        end)

        if success then
            WindUI:Notify({ Title = "Feedback Sent!", Content = "Thank you for your feedback!", Icon = "message-circle-check", Duration = 3 })
            ratingCooldown = true
            task.delay(60, function() ratingCooldown = false end)
        else
            print("WEBHOOK ERROR: " .. tostring(err))
            WindUI:Notify({ Title = "Failed!", Content = "Something went wrong, try again.", Icon = "message-circle-off", Duration = 3 })
        end
    end,
})

local updlog = Upd:Section({
		Title = "Update Logs",
		Desc = "See the update logs",
		Icon = "scroll",
		Box = true,
		BoxBorder = true,
	})

updlog:Paragraph({
		Title = "📜 Updates Logs #1 | v1.000.00",
		Desc = "+ Added Tab (Info, Player, Server, Scripts, More Scripts, Teleport, Settings)\n+ Added Account Details\n+ Added Server Details\n+Added Character Stats\n+Added Game Details\n+Added Action Buttons\n+ Added Client Details\n+ Added Player Movement (Walkspeed, Jump Power)\n+ Added Universal Fly GUI\n+ Added ESP\n+ Added Custom FOV\n+ Added Game Scripts\n+ Added New Game Script\n+ Added Teleport to Player\n+ Added Spectate Player\n+ Added Fullbright\n+ Added Customize Theme UI",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #2 | v1.111.00",
		Desc = "+ Added Ping and FPS tag\n+ Added Executor Detector\n+ Added Infinite Jump\n+ Added Anti AFK\n+ Added Server Id\n+ Added Server Id Input\n+ Added Join Server\n+ Added Rejoin Server\n+ Added Server Hop\n+ Added Roblox User System (UI)\n+ Added Universal Infinite Yield Script\n+ Added Universal Music Player Scripts\n+ Added Icons to Section\n+ Fixed Theme\n+ Fixed Fly GUI\n+ Fixed ESP\n+ Fixed ui loading\n+ Fixed Wind UI Notifications",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #3 | v1.222.00",
		Desc = "+ Added RTX Summer Lighting\n+ Added PShade Script\n+ Added No Clip\n+ Added Executor Script\n+ Added Version Tag\n+ Script Key System Checker\n+ Organized Info Tab\n+ Fixed Discord Invite\n+ Fixed ESP\n+ Fixed Character Stats\n+ Fixed Player Movement Value\n+ Fixed Destroy GUI Button\n+ Fixed Fullbright\n+ Fixed Wind UI Notification\n+ Fixed Section Icons\n+ Fixed some bugs",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #4 | v1.222.50",
		Desc = "+ Added Universal Music Scripts\n+ Added Remote Executor\n+ Added Executor Script\n+ Added New Game Scripts\n+ Fixed No Clip Toggle\n+ Fixed Sections\n+ Fixed Icons\n+ Fixed Fly GUI 1 & 2\n+ Fixed Theme\n+ Fixed Other Bug",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #5 | v1.333.00",
		Desc = "+ Added Tabs (Troll & Teleport)\n+ Added Teleport Tool Button\n+ Added Refresh Player's List Button\n+ Added Icon in Destroy GUI Dialog\n+ Fixed Teleport Player\n+ Fixed Spectate Player\n+ Fixed Player Dropdown\n+ Fixed Custom FOV\n+ Fixed Dropdown Refresh\n+ Fixed UI Erorrs\n+ Fixed some bugs...",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #6 | v1.444.00",
		Desc = "+ Added Loader (start)\n+ Added New Game Script\n+ Added New Script Hub\n+ Added Search Bar on Dropdown\n+ Organized UI\n+ Fixed Dark Mode and Light Mode\n+ Fixed Icon Shape Tab\n+ Fixed Notification Error\n+ Fixed Infinite Jump Stucked\n+ Edited Popup Button\n+ Fixed Tag Colors\n+ Fixed some bugs",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #7 | v1.444.50",
		Desc = "+ Added Role Tag\n+ Added New Game Script\n+ Added New Script Hub\n+ Fixed some script not loading\n+ Fixed Player Dropdown\n+ Fixed Character Stats (pos XYZ)\n+ Fixed Other Details in Info\n+ Fixed some bugs",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #8 | v1.555.00",
		Desc = "+ Added Code Preview\n+ Wind Ui's HStack/VStack Supported\n+ Organized Tabs\n+ Fixed No Clip\n+ Fixed Window Size\n+ Fixed Jump Power\n+ Cancelled Gravity Function\n+ Improved Icons im Toggle\n+ Other bug has been fixed",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #9 | v1.555.10",
		Desc = "+ Added icons to some elements\n+ Added TP to Low Player Server\n+ Fixed Rejoin Button\n+ Fixed Server Hop\n+ Organized Elements in Server Tab\n+ Fixed Tag not showing\n+ Fixed Section Alignment\n+ Fixed Loader Notification\n+ Fixed Divider()\n+ Fixed other bug",
	})
updlog:Paragraph({
		Title = "📜 Updates Logs #10 | v1.555.1-fix",
		Desc = "+ Fixed Loader Error\n+ Fixed Main UI Error\n+ Fixed attempt to call a nil value Error\n+ Fixed Elements\n+ Fixed Bug",
	})

                
------- PLAYER TAB
local lpS = lp:Section({
	Title = "Player Movement",
	Desc = "Controls character's movements",
	Icon = "move",
	Opened = false,
	Box = true,
	BoxBorder = true,
})

local player = game.Players.LocalPlayer

player:SetAttribute("WalkSpeedEnabled", false)
player:SetAttribute("WalkSpeedValue", 16)

player:SetAttribute("JumpHeightEnabled", false)
player:SetAttribute("JumpHeightValue", 50)

local SpeedSlider = lpS:Slider({
    Title = "Walkspeed",
    Desc = "Set walkspeed value",
    Icon = "sport-shoe",
    Step = 1,
    Value = {
        Min = 16,
        Max = 950,
        Default = 16
    },

    Callback = function(Value)
        player:SetAttribute("WalkSpeedValue", Value)

        local hum = player.Character and player.Character:FindFirstChild("Humanoid")

        if hum and player:GetAttribute("WalkSpeedEnabled") then
            hum.WalkSpeed = Value
        end
    end
})

lpS:Toggle({
    Title = "Enable Walkspeed",
    Icon = "sport-shoe",
    Value = false,

    Callback = function(Value)
        player:SetAttribute("WalkSpeedEnabled", Value)

        local hum = player.Character and player.Character:FindFirstChild("Humanoid")

        if hum then
            hum.WalkSpeed = Value and player:GetAttribute("WalkSpeedValue") or 16
        end
    end
})

local JumpSlider = lpS:Slider({
    Title = "Jump Height",
    Desc = "Set jump height value",
    Icon = "arrow-big-up-dash",
    Step = 1,
    Value = {
        Min = 50,
        Max = 1000,
        Default = 50
    },

    Callback = function(Value)
        player:SetAttribute("JumpHeightValue", Value)

        local hum = player.Character and player.Character:FindFirstChild("Humanoid")

        if hum and player:GetAttribute("JumpHeightEnabled") then
            hum.JumpPower = Value
        end
    end
})

lpS:Toggle({
    Title = "Enable Jump Height",
    Icon = "arrow-big-up-dash",
    Value = false,

    Callback = function(Value)
        player:SetAttribute("JumpHeightEnabled", Value)

        local hum = player.Character and player.Character:FindFirstChild("Humanoid")

        if hum then
            hum.JumpPower = Value and player:GetAttribute("JumpHeightValue") or 50
        end
    end
})

lpS:Button({
    Title = "Reset Movement",
    Desc = "Reset Walkspeed & Jump Height",
    Icon = "rotate-ccw",

    Callback = function()

        player:SetAttribute("WalkSpeedEnabled", false)
        player:SetAttribute("WalkSpeedValue", 16)

        player:SetAttribute("JumpHeightEnabled", false)
        player:SetAttribute("JumpHeightValue", 50)

        local hum = player.Character and player.Character:FindFirstChild("Humanoid")

        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
        end

        SpeedSlider:Set(16)
        JumpSlider:Set(50)

        WindUI:Notify({
            Title = "Liquid Hub",
            Content = "Movement reset to default.",
            Duration = 3,
            Icon = "rotate-ccw"
        })
    end
})

player.CharacterAdded:Connect(function(char)

    local hum = char:WaitForChild("Humanoid")

    task.wait(0.1)

    hum.WalkSpeed = player:GetAttribute("WalkSpeedEnabled")
        and player:GetAttribute("WalkSpeedValue")
        or 16

    hum.JumpPower = player:GetAttribute("JumpHeightEnabled")
        and player:GetAttribute("JumpHeightValue")
        or 50

end)


local moove = lp:Section({
		Title = "Other Movement",
		Desc = "Controls additional character's movement",
		Icon = "user-search",
		Opened = false,
		Box = true,
		BoxBorder = true,
	})
-- Add mo to sa Player tab (lp) kasama ng Walkspeed/JumpPower mo

local InfiniteJumpEnabled = false

-- INFINITE JUMP TOGGLE
local infJumpToggle = moove:Toggle({
    Title = "Inf Jump",
    Desc = "Jump limitless",
	Icon = "arrow-big-up-dash",
    Value = false,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
        
        if Value then
            print("🦘 Infinite Jump ON")
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Infinite Jump Enabled!",
                Duration = 4,
                Icon = "arrow-up",
            })
        else
            print("🦘 Infinite Jump OFF")
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Infinite Jump Disabled!",
                Duration = 4,
                Icon = "arrow-down",
            })
        end
    end
})

-- INFINITE JUMP LOGIC
UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            -- Method 1: Direct jump
            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            
            -- Method 2: Velocity boost
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(0, 50, 0)
            end
        end
    end
end)


local AntiAFKEnabled = false


local connections = {}

local antiAFKToggle = moove:Toggle({
    Title = "Anti AFK",
    Desc = "Stay up 24/7",
    Value = true,
    Callback = function(Value)
        AntiAFKEnabled = Value
        
        if Value then
            print("🚀 Anti AFK STARTED")
            
            -- METHOD 1: VirtualUser (Most Compatible)
            connections.virtualUser = spawn(function()
                while AntiAFKEnabled do
                    pcall(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                    wait(55) -- 55 seconds
                end
            end)
            
            -- METHOD 2: Heartbeat (Blox Fruits/Strict games)
            connections.heartbeat = RunService.Heartbeat:Connect(function()
                if AntiAFKEnabled and player.Character then
                    local humanoid = player.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid:Move(Vector3.new(0, 0, 0.1))
                    end
                end
            end)
            
            -- METHOD 3: Keypress backup
            connections.keypress = spawn(function()
                while AntiAFKEnabled do
                    pcall(function()
                        if keypress then
                            keypress(0x57) -- W
                            wait(0.1)
                            keyrelease(0x57)
                        end
                    end)
                    wait(120)
                end
            end)
            
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Anti AFK ACTIVE",
                Duration = 3,
                Icon = "shield-check",
            })
            
        else
            -- CLEANUP
            for name, connection in pairs(connections) do
                if typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                elseif typeof(connection) == "thread" then
                    task.cancel(connection)
                end
            end
            connections = {}
            
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Anti AFK OFF",
                Duration = 2,
                Icon = "x-circle",
            })
        end
    end
})




     
    
local noclipEnabled = false
local connection

-- Function para i-set CanCollide
local function setNoClip(state)
    local character = player.Character
    if not character then return end

    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = not state
        end
    end
end

-- Toggle UI
local NoClipToggle = moove:Toggle({
    Title = "No Clip",
    Desc = "Pass through objects",
	Icon = "door-open",
    Value = false,
    Callback = function(state)
        noclipEnabled = state

        if state then
            -- Enable noclip loop
            connection = RunService.Stepped:Connect(function()
                setNoClip(true)
            end)
        else
            -- Disable noclip
            if connection then
                connection:Disconnect()
                connection = nil
            end
            setNoClip(false)
        end
    end
})

-- Handle respawn
player.CharacterAdded:Connect(function()
    task.wait(1)
    if noclipEnabled then
        setNoClip(true)
    end
end)

                        

local flys = moove:Section({
		Title = "Fly",
		Desc = "Fly movements",
		Icon = "navigation",
		Opened = true,
		Box = true,
		BoxBorder = true,
	})
local flygui = flys:Button({
		Title = "🔓 Fly GUI 1",
		Desc = "Loads a universal FLY GUI",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://github.com/MiniCapy/scripts/raw/refs/heads/main/fly%20GUI"))()
		end})

local flygui2 = flys:Button({
		Title = "🔓 Fly GUI 2",
		Desc = "Loads a universal FLY GUI",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-universal-fly-86513"))()
		end})

local Trol = lp:Section({
		Title = "Troll",
		Desc = "Prank and troll another player",
		Icon = "laugh",
		Opened = false,
		Box = true,
		BoxBorder = true,
	})


Trol:Toggle({
    Title = "Walk Fling",
    Desc = "Flings players you walk into",
    Default = false,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        
        getgenv().WalkFlingEnabled = Value
        getgenv().WalkFlingConns = getgenv().WalkFlingConns or {}
        getgenv().WalkFlingThread = getgenv().WalkFlingThread or nil
        
        local function StopFling()
            for _,conn in pairs(getgenv().WalkFlingConns) do
                if conn then conn:Disconnect() end
            end
            table.clear(getgenv().WalkFlingConns)
            
            if getgenv().WalkFlingThread then 
                task.cancel(getgenv().WalkFlingThread)
                getgenv().WalkFlingThread = nil
            end
            
            if LocalPlayer.Character then
                local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                local Root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                
                if Humanoid then
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
                    Humanoid.BreakJointsOnDeath = true
                    Humanoid:ChangeState(8)
                    Humanoid.PlatformStand = false
                end
                
                if Root then
                    Root.Velocity = Vector3.new(0, 0, 0)
                    Root.RotVelocity = Vector3.new(0, 0, 0)
                    Root.CanCollide = true
                end
            end
        end
        
        local function StartFling(char)
            local Root = char:WaitForChild("HumanoidRootPart")
            local Humanoid = char:WaitForChild("Humanoid")
            
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            Humanoid.BreakJointsOnDeath = false
            
            getgenv().WalkFlingConns.Health = RunService.Stepped:Connect(function()
                if not getgenv().WalkFlingEnabled then return end
                Humanoid.Health = 9e9
                Humanoid.MaxHealth = 9e9
            end)
            
            Root.CanCollide = false
            -- TINANGGAL KO NA YUNG Humanoid:ChangeState(11)
            -- Pwede ka na mag jump ngayon
            
            getgenv().WalkFlingThread = task.spawn(function()
                while getgenv().WalkFlingEnabled and Root and Root.Parent do
                    RunService.Heartbeat:Wait()
                    local vel = Root.Velocity
                    Root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                    RunService.RenderStepped:Wait()
                    Root.Velocity = vel
                    RunService.Stepped:Wait()
                    Root.Velocity = vel + Vector3.new(0, 0.1, 0)
                end
            end)
        end
        
        if Value then
            StopFling()
            getgenv().WalkFlingEnabled = true
            if LocalPlayer.Character then
                StartFling(LocalPlayer.Character)
            end
            getgenv().WalkFlingConns.CharAdded = LocalPlayer.CharacterAdded:Connect(StartFling)
        else
            getgenv().WalkFlingEnabled = false
            StopFling()
        end
    end
})

local Cam = lp:Section({
		Title = "Camera",
		Desc = "Controls player's camera and view",
		Icon = "camera",
		Opened = false,
		Box = true,
		BoxBorder = true,
	})


local camera = workspace.CurrentCamera

-- default FOV
local defaultFOV = camera.FieldOfView

-- state
local fovEnabled = false
local fovValue = 70

-- 🔘 TOGGLE
Cam:Toggle({
    Title = "Custom FOV",
    Desc = "Enable custom field of view",
	Icon = "eye",
    Value = false,
    Callback = function(state)
        fovEnabled = state

        if state then
            camera.FieldOfView = fovValue
        else
            camera.FieldOfView = defaultFOV
        end
    end
})

-- 🎚️ SLIDER
Cam:Slider({
    Title = "FOV",
    Desc = "Adjust field of view",
	Icon = {
			From = "eye",
			To = "scan-eye",
		},
    Value = {
        Min = 50,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        fovValue = value

        if fovEnabled then
            camera.FieldOfView = value
        end
    end
})

Cam:Button({
		Title = "🔓 Flick Camera",
		Desc = "Loads a universal Flick Camera Script",
		Callback = function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Flick-Your-Camera-223673"))()
		end
	})

-- 🔄 Handle respawn / camera reset
player.CharacterAdded:Connect(function()
    task.wait(1)
    if fovEnabled then
        camera.FieldOfView = fovValue
    else
        camera.FieldOfView = defaultFOV
    end
end)

local Section1 = lp:Section({
		Title = "Character Animation",
		Desc = "Customize character's animation",
		Icon = "person-standing",
		Opened = false,
		Box = true,
		BoxBorder = true,
	})

-- IDLE
task.spawn(function()
    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local Animate = char:WaitForChild("Animate")

    local Defaults = {
        idle1 = Animate.idle.Animation1.AnimationId,
        idle2 = Animate.idle.Animation2.AnimationId,
        walk = Animate.walk.WalkAnim.AnimationId,
        run = Animate.run.RunAnim.AnimationId,
        jump = Animate.jump.JumpAnim.AnimationId,
        fall = Animate.fall.FallAnim.AnimationId,
        climb = Animate.climb.ClimbAnim.AnimationId,
        swim = Animate.swim.Swim.AnimationId,
        swimidle = Animate.swimidle.SwimIdle.AnimationId,
    }

    local CurrentAnims = {
        idle1 = nil, idle2 = nil,
        walk = nil, run = nil,
        jump = nil, fall = nil,
        climb = nil, swim = nil,
        swimidle = nil,
    }

    local function getAnimate()
        
    local c = game.Players.LocalPlayer.Character
    if not c then return end
    local animate = c:WaitForChild("Animate")

    -- Restart Animate script para instant mag-apply
    animate.Disabled = true
    task.wait(0.1)
    animate.Disabled = false

    return animate
			end

    game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
        task.wait(1)
        local A = newChar:WaitForChild("Animate")
        if CurrentAnims.idle1 then
            A.idle.Animation1.AnimationId = CurrentAnims.idle1
            A.idle.Animation2.AnimationId = CurrentAnims.idle2
        end
        if CurrentAnims.walk then A.walk.WalkAnim.AnimationId = CurrentAnims.walk end
        if CurrentAnims.run then A.run.RunAnim.AnimationId = CurrentAnims.run end
        if CurrentAnims.jump then A.jump.JumpAnim.AnimationId = CurrentAnims.jump end
        if CurrentAnims.fall then A.fall.FallAnim.AnimationId = CurrentAnims.fall end
        if CurrentAnims.climb then A.climb.ClimbAnim.AnimationId = CurrentAnims.climb end
        if CurrentAnims.swim then A.swim.Swim.AnimationId = CurrentAnims.swim end
        if CurrentAnims.swimidle then A.swimidle.SwimIdle.AnimationId = CurrentAnims.swimidle end
    end)

    -- Animation Pack
    Section1:Dropdown({
        Title = "Animation Pack",
        Desc = "Equip all animations at once",
        Icon = "package",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf", "Cartoony", "Toy"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local packs = {
                Default = {
                    idle1 = Defaults.idle1, idle2 = Defaults.idle2,
                    walk = Defaults.walk, run = Defaults.run,
                    jump = Defaults.jump, fall = Defaults.fall,
                    climb = Defaults.climb, swim = Defaults.swim,
                    swimidle = Defaults.swimidle,
                },
                Zombie = {
                    idle1 = "rbxassetid://616158929", idle2 = "rbxassetid://616160636",
                    walk = "rbxassetid://616168032", run = "rbxassetid://616163682",
                    jump = "rbxassetid://616161997", fall = "rbxassetid://616157476",
                    climb = "rbxassetid://616156119", swim = "rbxassetid://616165109",
                    swimidle = "rbxassetid://616166655",
                },
                Ninja = {
                    idle1 = "rbxassetid://656117400", idle2 = "rbxassetid://656118341",
                    walk = "rbxassetid://656121766", run = "rbxassetid://656118852",
                    jump = "rbxassetid://656117878", fall = "rbxassetid://656115606",
                    climb = "rbxassetid://656114359", swim = "rbxassetid://656119721",
                    swimidle = "rbxassetid://656121397",
                },
                Robot = {
                    idle1 = "rbxassetid://616088211", idle2 = "rbxassetid://616089559",
                    walk = "rbxassetid://616095330", run = "rbxassetid://616091570",
                    jump = "rbxassetid://616090535", fall = "rbxassetid://616087089",
                    climb = "rbxassetid://616086039", swim = "rbxassetid://616092998",
                    swimidle = "rbxassetid://616094091",
                },
                Vampire = {
                    idle1 = "rbxassetid://1083445855", idle2 = "rbxassetid://1083450166",
                    walk = "rbxassetid://1083473930", run = "rbxassetid://1083462077",
                    jump = "rbxassetid://1083455352", fall = "rbxassetid://1083443587",
                    climb = "rbxassetid://1083439238", swim = "rbxassetid://1083464683",
                    swimidle = "rbxassetid://1083467779",
                },
                Werewolf = {
                    idle1 = "rbxassetid://1083195517", idle2 = "rbxassetid://1083214717",
                    walk = "rbxassetid://1083178339", run = "rbxassetid://1083216690",
                    jump = "rbxassetid://1083218792", fall = "rbxassetid://1083189019",
                    climb = "rbxassetid://1083182000", swim = "rbxassetid://1083222527",
                    swimidle = "rbxassetid://1083225406",
                },
				Cartoony = {
					idle1 = "rbxassetid://742637544", idle2 = "rbxassetid://742638445",
                    walk = "rbxassetid://742640026", run = "rbxassetid://742638842",
                    jump = "rbxassetid://742637942", fall = "rbxassetid://742637151",
                    climb = "rbxassetid://742636889", swim = "rbxassetid://742639220",
                    swimidle = "rbxassetid://742639812",
				},
			    Toy = {
                    idle1 = "rbxassetid://782841498", idle2 = "rbxassetid://782845736",
                    walk = "rbxassetid://782843345", run = "rbxassetid://782842708",
                    jump = "rbxassetid://782847020", fall = "rbxassetid://782846423",
                    climb = "rbxassetid://782843869", swim = "rbxassetid://782844582",
                    swimidle = "rbxassetid://782845186",
               },
            }
            local pack = packs[Value]
            if not pack then return end
            A.idle.Animation1.AnimationId = pack.idle1
            A.idle.Animation2.AnimationId = pack.idle2
            A.walk.WalkAnim.AnimationId = pack.walk
            A.run.RunAnim.AnimationId = pack.run
            A.jump.JumpAnim.AnimationId = pack.jump
            A.fall.FallAnim.AnimationId = pack.fall
            A.climb.ClimbAnim.AnimationId = pack.climb
            A.swim.Swim.AnimationId = pack.swim
            A.swimidle.SwimIdle.AnimationId = pack.swimidle
            if Value ~= "Default" then
                CurrentAnims.idle1 = pack.idle1
                CurrentAnims.idle2 = pack.idle2
                CurrentAnims.walk = pack.walk
                CurrentAnims.run = pack.run
                CurrentAnims.jump = pack.jump
                CurrentAnims.fall = pack.fall
                CurrentAnims.climb = pack.climb
                CurrentAnims.swim = pack.swim
                CurrentAnims.swimidle = pack.swimidle
            else
                CurrentAnims = {idle1=nil,idle2=nil,walk=nil,run=nil,jump=nil,fall=nil,climb=nil,swim=nil,swimidle=nil}
            end
            WindUI:Notify({
                Title = "Animation Pack",
                Content = Value == "Default" and "Default animations restored!" or Value .. " pack equipped!",
                Icon = Value == "Default" and "rotate-ccw" or "package",
                Duration = 3,
            })
        end,
    })

    -- IDLE
    Section1:Dropdown({
        Title = "Idle Animation",
        Desc = "Change idle animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = {Defaults.idle1, Defaults.idle2},
                Zombie = {"rbxassetid://616158929", "rbxassetid://616160636"},
                Ninja = {"rbxassetid://656117400", "rbxassetid://656118341"},
                Robot = {"rbxassetid://616088211", "rbxassetid://616089559"},
                Vampire = {"rbxassetid://1083445855", "rbxassetid://1083450166"},
                Werewolf = {"rbxassetid://1083195517", "rbxassetid://1083214717"},
            }
            local selected = ids[Value]
            A.idle.Animation1.AnimationId = selected[1]
            A.idle.Animation2.AnimationId = selected[2]
            if Value ~= "Default" then
                CurrentAnims.idle1 = selected[1]
                CurrentAnims.idle2 = selected[2]
            else
                CurrentAnims.idle1 = nil
                CurrentAnims.idle2 = nil
            end
        end,
    })

    -- WALK
    Section1:Dropdown({
        Title = "Walk Animation",
        Desc = "Change walk animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.walk,
                Zombie = "rbxassetid://616168032",
                Ninja = "rbxassetid://656121766",
                Robot = "rbxassetid://616095330",
                Vampire = "rbxassetid://1083473930",
                Werewolf = "rbxassetid://1083178339",
            }
            A.walk.WalkAnim.AnimationId = ids[Value]
            CurrentAnims.walk = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- RUN
    Section1:Dropdown({
        Title = "Run Animation",
        Desc = "Change run animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.run,
                Zombie = "rbxassetid://616163682",
                Ninja = "rbxassetid://656118852",
                Robot = "rbxassetid://616091570",
                Vampire = "rbxassetid://1083462077",
                Werewolf = "rbxassetid://1083216690",
            }
            A.run.RunAnim.AnimationId = ids[Value]
            CurrentAnims.run = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- JUMP
    Section1:Dropdown({
        Title = "Jump Animation",
        Desc = "Change jump animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.jump,
                Zombie = "rbxassetid://616161997",
                Ninja = "rbxassetid://656117878",
                Robot = "rbxassetid://616090535",
                Vampire = "rbxassetid://1083455352",
                Werewolf = "rbxassetid://1083218792",
            }
            A.jump.JumpAnim.AnimationId = ids[Value]
            CurrentAnims.jump = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- FALL
    Section1:Dropdown({
        Title = "Fall Animation",
        Desc = "Change fall animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.fall,
                Zombie = "rbxassetid://616157476",
                Ninja = "rbxassetid://656115606",
                Robot = "rbxassetid://616087089",
                Vampire = "rbxassetid://1083443587",
                Werewolf = "rbxassetid://1083189019",
            }
            A.fall.FallAnim.AnimationId = ids[Value]
            CurrentAnims.fall = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- CLIMB
    Section1:Dropdown({
        Title = "Climb Animation",
        Desc = "Change climb animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.climb,
                Zombie = "rbxassetid://616156119",
                Ninja = "rbxassetid://656114359",
                Robot = "rbxassetid://616086039",
                Vampire = "rbxassetid://1083439238",
                Werewolf = "rbxassetid://1083182000",
            }
            A.climb.ClimbAnim.AnimationId = ids[Value]
            CurrentAnims.climb = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- SWIM
    Section1:Dropdown({
        Title = "Swim Animation",
        Desc = "Change swim animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.swim,
                Zombie = "rbxassetid://616165109",
                Ninja = "rbxassetid://656119721",
                Robot = "rbxassetid://616092998",
                Vampire = "rbxassetid://1083464683",
                Werewolf = "rbxassetid://1083222527",
            }
            A.swim.Swim.AnimationId = ids[Value]
            CurrentAnims.swim = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- SWIM IDLE
    Section1:Dropdown({
        Title = "Swim Idle Animation",
        Desc = "Change swim idle animation",
        Values = {"Default", "Zombie", "Ninja", "Robot", "Vampire", "Werewolf"},
        Value = "Default",
        Multi = false,
        SearchBarEnabled = true,
        Callback = function(Value)
            local A = getAnimate()
            if not A then return end
            local ids = {
                Default = Defaults.swimidle,
                Zombie = "rbxassetid://616166655",
                Ninja = "rbxassetid://656121397",
                Robot = "rbxassetid://616094091",
                Vampire = "rbxassetid://1083467779",
                Werewolf = "rbxassetid://1083225406",
            }
            A.swimidle.SwimIdle.AnimationId = ids[Value]
            CurrentAnims.swimidle = Value ~= "Default" and ids[Value] or nil
        end,
    })

    -- Reset Button
    Section1:Button({
        Title = "Reset Animations",
        Desc = "Restore original avatar animations",
        Icon = "rotate-ccw",
        Callback = function()
            local A = getAnimate()
            if not A then return end
            A.idle.Animation1.AnimationId = Defaults.idle1
            A.idle.Animation2.AnimationId = Defaults.idle2
            A.walk.WalkAnim.AnimationId = Defaults.walk
            A.run.RunAnim.AnimationId = Defaults.run
            A.jump.JumpAnim.AnimationId = Defaults.jump
            A.fall.FallAnim.AnimationId = Defaults.fall
            A.climb.ClimbAnim.AnimationId = Defaults.climb
            A.swim.Swim.AnimationId = Defaults.swim
            A.swimidle.SwimIdle.AnimationId = Defaults.swimidle
            CurrentAnims = {idle1=nil,idle2=nil,walk=nil,run=nil,jump=nil,fall=nil,climb=nil,swim=nil,swimidle=nil}
            WindUI:Notify({
                Title = "Animations Reset",
                Content = "Original avatar animations restored!",
                Duration = 3,
                Icon = "rotate-ccw"
            })
        end,
    })

end)
                                                
--[[


local animPacks = {
    ["Astronaut"] = {
        idle = {a1 = "891621366", a2 = "891633237"},
        walk = "891636393", run = "891636393",
        jump = "891627522", fall = "891617961",
        climb = "891609353", swim = "891639666",
        swimidle = "891663592",
    },
    ["Bubbly"] = {
        idle = {a1 = "910004836", a2 = "910009958"},
        walk = "910034870", run = "910025107",
        jump = "910016857", fall = "910001910",
        climb = "909997997", swim = "910028158",
        swimidle = "910030921",
    },
    ["Cartoony"] = {
        idle = {a1 = "742637544", a2 = "742638445"},
        walk = "742640026", run = "742638842",
        jump = "742637942", fall = "742637151",
        climb = "742636889", swim = "742639220",
        swimidle = "742639812",
    },
    ["Elder"] = {
        idle = {a1 = "845397899", a2 = "845400520"},
        walk = "845403856", run = "845386501",
        jump = "845398858", fall = "845396048",
        climb = "845392038", swim = "845401742",
        swimidle = "845403127",
    },
    ["Knight"] = {
        idle = {a1 = "657595757", a2 = "657568135"},
        walk = "657552124", run = "657564596",
        jump = "658409194", fall = "657600338",
        climb = "658360781", swim = "657560551",
        swimidle = "657557095",
    },
    ["Levitation"] = {
        idle = {a1 = "616006778", a2 = "616008087"},
        walk = "616013216", run = "616010382",
        jump = "616008936", fall = "616005863",
        climb = "616003713", swim = "616011509",
        swimidle = "616012453",
    },
    ["Mage"] = {
        idle = {a1 = "707742142", a2 = "707855907"},
        walk = "707897309", run = "707861613",
        jump = "707853694", fall = "707829716",
        climb = "707826056", swim = "707876443",
        swimidle = "707894699",
    },
    ["Ninja"] = {
        idle = {a1 = "656117400", a2 = "656118341"},
        walk = "656121766", run = "656118852",
        jump = "656117878", fall = "656115606",
        climb = "656114359", swim = "656119721",
        swimidle = "656121397",
    },
    ["Pirate"] = {
        idle = {a1 = "750781874", a2 = "750782770"},
        walk = "750785693", run = "750783738",
        jump = "750782230", fall = "750780242",
        climb = "750779899", swim = "750784579",
        swimidle = "750785176",
    },
    ["Robot"] = {
        idle = {a1 = "616088211", a2 = "616089559"},
        walk = "616095330", run = "616091570",
        jump = "616090535", fall = "616087089",
        climb = "616086039", swim = "616092998",
        swimidle = "616094091",
    },
    ["Rthro"] = {
        idle = {a1 = "2510197257", a2 = "2510196951"},
        walk = "2510202577", run = "2510198475",
        jump = "2510197830", fall = "2510195892",
        climb = "2510192778", swim = "2510199791",
        swimidle = "2510201162",
    },
    ["Stylish"] = {
        idle = {a1 = "616136790", a2 = "616138447"},
        walk = "616146177", run = "616140816",
        jump = "616139451", fall = "616134815",
        climb = "616133594", swim = "616143378",
        swimidle = "616144772",
    },
    ["Superhero"] = {
        idle = {a1 = "616111295", a2 = "616113536"},
        walk = "616122287", run = "616117076",
        jump = "616115533", fall = "616108001",
        climb = "616104706", swim = "616119360",
        swimidle = "616120861",
    },

    ["Vampire"] = {
        idle = {a1 = "1083445855", a2 = "1083450166"},
        walk = "1083473930", run = "1083462077",
        jump = "1083455352", fall = "1083443587",
        climb = "1083439238", swim = "1083464683",
        swimidle = "1083467779",
    },
    ["Werewolf"] = {
        idle = {a1 = "1083195517", a2 = "1083214717"},
        walk = "1083178339", run = "1083216690",
        jump = "1083218792", fall = "1083189019",
        climb = "1083182000", swim = "1083222527",
        swimidle = "1083225406",
    },
    ["Zombie"] = {
        idle = {a1 = "616158929", a2 = "616160636"},
        walk = "616168032", run = "616163682",
        jump = "616161997", fall = "616157476",
        climb = "616156119", swim = "616165109",
        swimidle = "616166655",
    },
}

local packNames = {
    "Default", "Astronaut", "Bubbly", "Cartoony", "Elder",
    "Knight", "Levitation", "Mage", "Ninja", "Pirate",
    "Robot", "Rthro", "Stylish", "Superhero", "Toy",
    "Vampire", "Werewolf", "Zombie"
}

local function initAnims()
    local char = player.Character or player.CharacterAdded:Wait()
    local animateScript = char:WaitForChild("Animate")
    originalAnims = {
        idle = {
            a1 = animateScript.idle.Animation1.AnimationId,
            a2 = animateScript.idle.Animation2.AnimationId,
        },
        walk = animateScript.walk.WalkAnim.AnimationId,
        run = animateScript.run.RunAnim.AnimationId,
        jump = animateScript.jump.JumpAnim.AnimationId,
        fall = animateScript.fall.FallAnim.AnimationId,
        climb = animateScript.climb.ClimbAnim.AnimationId,
        swim = animateScript.swim.Swim.AnimationId,
        swimidle = animateScript.swimidle.SwimIdle.AnimationId,
    }
end

initAnims()

local function setAnim(animType, id)
    local currentChar = player.Character
    if not currentChar then return end
    local animate = currentChar:FindFirstChild("Animate")
    if not animate then return end
    local humanoid = currentChar:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")

    if animType == "idle" then
        animate.idle.Animation1.AnimationId = "rbxassetid://" .. id.a1
        animate.idle.Animation2.AnimationId = "rbxassetid://" .. id.a2
    elseif animType == "walk" then
        animate.walk.WalkAnim.AnimationId = "rbxassetid://" .. id
    elseif animType == "run" then
        animate.run.RunAnim.AnimationId = "rbxassetid://" .. id
    elseif animType == "jump" then
        animate.jump.JumpAnim.AnimationId = "rbxassetid://" .. id
    elseif animType == "fall" then
        animate.fall.FallAnim.AnimationId = "rbxassetid://" .. id
    elseif animType == "climb" then
        animate.climb.ClimbAnim.AnimationId = "rbxassetid://" .. id
    elseif animType == "swim" then
        animate.swim.Swim.AnimationId = "rbxassetid://" .. id
    elseif animType == "swimidle" then
        animate.swimidle.SwimIdle.AnimationId = "rbxassetid://" .. id
    end

    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end
    end
end

local function resetAnims()
    local currentChar = player.Character
    if not currentChar then return end
    local animate = currentChar:FindFirstChild("Animate")
    if not animate then return end
    animate.idle.Animation1.AnimationId = originalAnims.idle.a1
    animate.idle.Animation2.AnimationId = originalAnims.idle.a2
    animate.walk.WalkAnim.AnimationId = originalAnims.walk
    animate.run.RunAnim.AnimationId = originalAnims.run
    animate.jump.JumpAnim.AnimationId = originalAnims.jump
    animate.fall.FallAnim.AnimationId = originalAnims.fall
    animate.climb.ClimbAnim.AnimationId = originalAnims.climb
    animate.swim.Swim.AnimationId = originalAnims.swim
    animate.swimidle.SwimIdle.AnimationId = originalAnims.swimidle
    local humanoid = currentChar:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end
    end
end

-- Animation Pack
YourSection:Dropdown({
    Title = "Animation Pack",
    Desc = "Equip all animations at once",
    Icon = "package",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            resetAnims()
            WindUI:Notify({ Title = "Animation Pack", Content = "Default animations restored!", Icon = "rotate-ccw", Duration = 3 })
            return
        end
        local pack = animPacks[value]
        if not pack then return end
        setAnim("idle", pack.idle)
        setAnim("walk", pack.walk)
        setAnim("run", pack.run)
        setAnim("jump", pack.jump)
        setAnim("fall", pack.fall)
        setAnim("climb", pack.climb)
        setAnim("swim", pack.swim)
        setAnim("swimidle", pack.swimidle)
        WindUI:Notify({ Title = "Animation Pack", Content = value .. " pack equipped!", Icon = "package", Duration = 3 })
    end,
})

-- Idle
YourSection:Dropdown({
    Title = "Idle Animation",
    Desc = "Select idle animation",
    Icon = "person-standing",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then
                animate.idle.Animation1.AnimationId = originalAnims.idle.a1
                animate.idle.Animation2.AnimationId = originalAnims.idle.a2
            end
            return
        end
        setAnim("idle", animPacks[value].idle)
    end,
})

-- Walk
YourSection:Dropdown({
    Title = "Walk Animation",
    Desc = "Select walk animation",
    Icon = "footprints",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.walk.WalkAnim.AnimationId = originalAnims.walk end
            return
        end
        setAnim("walk", animPacks[value].walk)
    end,
})

-- Run
YourSection:Dropdown({
    Title = "Run Animation",
    Desc = "Select run animation",
    Icon = "zap",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.run.RunAnim.AnimationId = originalAnims.run end
            return
        end
        setAnim("run", animPacks[value].run)
    end,
})

-- Jump
YourSection:Dropdown({
    Title = "Jump Animation",
    Desc = "Select jump animation",
    Icon = "arrow-up",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.jump.JumpAnim.AnimationId = originalAnims.jump end
            return
        end
        setAnim("jump", animPacks[value].jump)
    end,
})

-- Fall
YourSection:Dropdown({
    Title = "Fall Animation",
    Desc = "Select fall animation",
    Icon = "arrow-down",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.fall.FallAnim.AnimationId = originalAnims.fall end
            return
        end
        setAnim("fall", animPacks[value].fall)
    end,
})

-- Climb
YourSection:Dropdown({
    Title = "Climb Animation",
    Desc = "Select climb animation",
    Icon = "move-up",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.climb.ClimbAnim.AnimationId = originalAnims.climb end
            return
        end
        setAnim("climb", animPacks[value].climb)
    end,
})

-- Swim
YourSection:Dropdown({
    Title = "Swim Animation",
    Desc = "Select swim animation",
    Icon = "waves",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.swim.Swim.AnimationId = originalAnims.swim end
            return
        end
        setAnim("swim", animPacks[value].swim)
    end,
})

-- Swim Idle
YourSection:Dropdown({
    Title = "Swim Idle Animation",
    Desc = "Select swim idle animation",
    Icon = "waves",
    Values = packNames,
    Callback = function(value)
        if value == "Default" then
            local animate = player.Character and player.Character:FindFirstChild("Animate")
            if animate then animate.swimidle.SwimIdle.AnimationId = originalAnims.swimidle end
            return
        end
        setAnim("swimidle", animPacks[value].swimidle)
    end,
})

-- Reset Button
YourSection:Button({
    Title = "Reset Animations",
    Desc = "Reset all animations to original",
    Icon = "rotate-ccw",
    Callback = function()
        resetAnims()
        WindUI:Notify({
            Title = "Animations Reset",
            Content = "All animations reverted to original!",
            Icon = "rotate-ccw",
            Duration = 3,
        })
    end,
})
]]

local ESPbro = lp:Section({
		Title = "ESP",
		Desc = "Renders player and object highlights visible through obstacles",
		Icon = "brush",
		Opened = false,
		Box = true,
		BoxBorder = true,
	})

-- Add sa Player tab (lp)


local LocalPlayer = Players.LocalPlayer

local RainbowESPEnabled = false
local espConnections = {}
local highlightConnections = {}

local rainbowToggle = ESPbro:Toggle({
    Title = "ESP [RAINBOW]",
    Desc = "Rainbow name tags + highlights",
	Icon = "eye",
    Value = false,
    Callback = function(Value)
        RainbowESPEnabled = Value
        
        if Value then
            -- ENABLE ESP + HIGHLIGHTS
            local function createRainbowESP(player)
                if player == LocalPlayer then return end
                
                local function setupESP(character)
                    local head = character:WaitForChild("Head", 5)
                    if not head then return end
                    
                    -- Clean previous ESP
                    local oldESP = head:FindFirstChild("RainbowESP")
                    if oldESP then oldESP:Destroy() end
                    
                    -- BillboardGui
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "RainbowESP"
                    billboard.Adornee = head
                    billboard.Size = UDim2.new(4, 0, 1.5, 0)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = head
                    
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextScaled = true
                    textLabel.Text = player.Name
                    textLabel.Font = Enum.Font.GothamBold
                    textLabel.TextStrokeTransparency = 0
                    textLabel.TextStrokeColor3 = Color3.new(0,0,0)
                    textLabel.Parent = billboard
                    
                    -- Rainbow loop
                    local espConn
                    espConn = RunService.Heartbeat:Connect(function()
                        if not RainbowESPEnabled or not billboard.Parent then
                            espConn:Disconnect()
                            return
                        end
                        local hue = tick() % 5 / 5
                        textLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
                    end)
                    
                    table.insert(espConnections, espConn)
                end
                
                if player.Character then
                    setupESP(player.Character)
                end
                player.CharacterAdded:Connect(setupESP)
            end
            
            local function applyRainbowHighlight(character)
                if character:FindFirstChildOfClass("Highlight") then return end
                
                local highlight = Instance.new("Highlight")
                highlight.Parent = character
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                
                local highlightConn
                highlightConn = RunService.Heartbeat:Connect(function()
                    if not RainbowESPEnabled or not highlight.Parent then
                        highlightConn:Disconnect()
                        return
                    end
                    local hue = tick() % 5 / 5
                    highlight.FillColor = Color3.fromHSV(hue, 1, 1)
                    highlight.OutlineColor = Color3.fromHSV(hue, 0.5, 1)
                end)
                
                table.insert(highlightConnections, highlightConn)
            end
            
            -- Apply to all players
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    if player.Character then
                        createRainbowESP(player)
                        applyRainbowHighlight(player.Character)
                    end
                    player.CharacterAdded:Connect(function(char)
                        createRainbowESP(player)
                        applyRainbowHighlight(char)
                    end)
                end
            end
            
            -- New players
            Players.PlayerAdded:Connect(function(player)
                if player ~= LocalPlayer then
                    player.CharacterAdded:Connect(function(char)
                        createRainbowESP(player)
                        applyRainbowHighlight(char)
                    end)
                end
            end)
            
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "🌈 Rainbow ESP + Highlights ON",
                Duration = 3,
                Icon = "rainbow",
            })
            
        else
            -- CLEANUP
            for _, conn in pairs(espConnections) do
                if conn then conn:Disconnect() end
            end
            for _, conn in pairs(highlightConnections) do
                if conn then conn:Disconnect() end end
            
            espConnections = {}
            highlightConnections = {}
            
            -- Remove all ESP/Highlights
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local esp = head:FindFirstChild("RainbowESP")
                        if esp then esp:Destroy() end
                    end
                    
                    for _, obj in pairs(player.Character:GetChildren()) do
                        if obj:IsA("Highlight") then
                            obj:Destroy()
                        end
                    end
                end
            end
            
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "🌈 Rainbow ESP OFF",
                Duration = 2,
                Icon = "eye-off",
            })
        end
    end
})
------- SERVER TAB
local serverr = Server:HStack()

local LeftS = serverr:VStack()
local RightS = serverr:VStack()

--[[local statuss = Server:Section({ 
    Title = "Game Status",
	Icon = "scroll-text",
	Opened = true,
})
]]

local T = LeftS:Paragraph({
    Title = "⏳ Game Time",
    Desc = "",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
    local Hour = math.floor(GameTime / (60^2)) % 24
    local Minute = math.floor(GameTime / (60^1)) % 60
    local Second = math.floor(GameTime / (60^0)) % 60
    T:SetDesc(Hour.." Hour (h) "..Minute.." Minute (m) "..Second.." Second (s) ")
end
spawn(function()
    while true do
        UpdateTime()
        wait(1)
    end
end)

--[[local svv = Server:Section({ 
    Title = "Server Status",
	Icon = "scroll-text",
	Opened = true,
})
]]
Server:Divider()



local lastCopyTime = 0
local copyCooldown = 2
local id = LeftS:Paragraph({
    Title = "Server ID",
    Desc = game.JobId ~= "" and game.JobId or "Server ID not available.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    Buttons = {
        {
            Icon = "link",
            Title = "Copy Server ID",
            Callback = function()
				if tick() - lastCopyTime >= copyCooldown then
            lastCopyTime = tick()
            setclipboard(tostring(game.JobId))
					end
				end,
        }
    }
    
})

print("Server Id Collected")
print("Server Id: " .. game.JobId)


local id2 = RightS:Input({
    Title = "Server Id",
    Desc = "Enter Server Id",
    Value = "",
    --InputIcon = "bird",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter ID...",
    Callback = function(Value) 
			getgenv().Job = Value
        print("text entered: ")
    end
})
local lastTeleportTime = 0
local teleportCooldown = 5
local joinn = RightS:Button({
    Title = "Join Server",
    Desc = "Join to the server id input.",
    Locked = false,
    Callback = function()
        if tick() - lastTeleportTime >= teleportCooldown then
            lastTeleportTime = tick()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, getgenv().Job, game.Players.LocalPlayer)        
		end
    end
})

RightS:Button({
    Title = "Rejoin Server",
    Desc = "Reconnect to current server",
    Callback = function()
        local Success, Error = pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")

            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Rejoining server...",
                Duration = 2
            })

            TeleportService:TeleportToPlaceInstance(
                game.PlaceId,
                game.JobId,
                Players.LocalPlayer
            )
        end)

        if not Success then
            WindUI:Notify({
                Title = "Error",
                Content = tostring(Error),
                Duration = 2
            })
        end
    end
})

function Hop()
    WindUI:Notify({Title = "Hopping...", Content = "Finding servers...", Duration = 2})
    
    -- Get first page only (FAST)
    local servers = game:GetService("HttpService"):JSONDecode(
        game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=50")
    ).data
    
    for _, server in ipairs(servers) do
        if server.playing < server.maxPlayers * 0.8 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
            return
        end
    end
    
    -- Fallback
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end

local Hop = RightS:Button({
    Title = "Server Hop",
    Desc = "",
    Locked = false,
    Callback = function()
        Hop()
    end
})

RightS:Button({
    Title = "Join Low Player Server",
    Desc = "Teleport to the smallest public server",
    Callback = function()
        
        local PlaceId = game.PlaceId
        local CurrentJobId = game.JobId

        local Servers = {}
        local Cursor = ""

        WindUI:Notify({
            Title = "Liquid Hub",
            Content = "Searching for server...",
            Duration = 3
        })

        local Success, Error = pcall(function()
            repeat
                local URL = string.format(
                    "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100%s",
                    PlaceId,
                    Cursor ~= "" and "&cursor=" .. Cursor or ""
                )

                local Response = game:HttpGet(URL)
                local Data = HttpService:JSONDecode(Response)

                for _, Server in ipairs(Data.data) do
                    if Server.playing < Server.maxPlayers
                    and Server.id ~= CurrentJobId then
                        table.insert(Servers, Server)
                    end
                end

                Cursor = Data.nextPageCursor or ""
            until Cursor == ""

            table.sort(Servers, function(a, b)
                return a.playing < b.playing
            end)

            if #Servers > 0 then
                local TargetServer = Servers[1]

                WindUI:Notify({
                    Title = "Liquid Hub",
                    Content = "Joining lowest player server...",
                    Duration = 3
                })

                TeleportService:TeleportToPlaceInstance(
                    PlaceId,
                    TargetServer.id,
                    Players.LocalPlayer
                )
            else
                WindUI:Notify({
                    Title = "Liquid Hub",
                    Content = "No server found.",
                    Duration = 3
                })
            end
        end)

        if not Success then
            WindUI:Notify({
                Title = "Error",
                Content = tostring(Error),
                Duration = 3
            })
        end
    end
})
	
------ Scripts Tab
local Scr = Script:Section({ 
    Title = "Game Scripts",
	Icon = "gamepad-2",
	Opened = true,
})

local Game = Scr:Paragraph({
    Title = "🗝️ KEY SYSTEM STATUS",
    Desc = "🔐 - The script has a key system.\n\n🔓 - The script system has no key system.\n\n❓ - No info of key system found.",
    Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})



-- Assume Server is your Fluent UI server object managing the UI
--[[ local Server =  your Fluent UI Server object here ]]

-- Function to get the current game name from PlaceId
local function getCurrentGameName()
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if success and info then
        return info.Name
    else
        return "Unknown Game"
    end
end

local gameName = getCurrentGameName()

local Game = Scr:Paragraph({
    Title = "Game you're in:",
    Desc = gameName ~= "" and gameName or "The game cannot be identified.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})

--local bfgroup = Script:Group({})
Script:Divider()
if BF1 or BF2 or BF3 then
	local bf = Script:Section({ 
    Title = "[🍎] Blox Fruits",
	Opened = true,
	Box = true,
	BoxBorder = true,
})
	
    local Redz = bf:Button({
    Title = "🔓 Redz Hub",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
                WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
    end
})

	local astrall = bf:Button({
			Title = "🔓 Astral Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
local azuree = bf:Button({
    Title = "🔓 Feather Hub",
    Desc = "",
    Locked = false,
    Callback = function()   
				
loadstring(game:HttpGet("https://gistpad.com/raw/loader-775"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})
local idkhub1 = bf:Button({
			Title = "🔓 Lunaris Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6aa463bf1351e5896ac04a44c07f78b983a2efc32738c543ac198b73d94cc946/download"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})
	local idkhub1 = bf:Button({
			Title = "❓ Astra Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/enes14451445-dev/roblox-scripts/main/astrahub.bloxfruit.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})

	local idkhub2 = bf:Button({
			Title = "❓ RO Hub",
			Desc = "",
			Locked = false,
			Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RO-HUB-CODEX/RO-HUB/refs/heads/main/bloxfruits.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})
	
	local relz = bf:Button({
    Title = "🔐 Relz Hub",
    Desc = "",
    Locked = false,
    Callback = function()   
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Bliqe/Upload/refs/heads/main/Games/BF/Relz.lua"))()		
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})
	
	local hohoo = bf:Button({
    Title = "🔐 HoHo Hub",
    Desc = "",
    Locked = false,
    Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
               WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})

	local qntmonyx = bf:Button({
		Title = "🔓 Quantum ONYX",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Trustmenotcondom/QTONYX/refs/heads/main/QuantumOnyx.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
	local script222 = bf:Button({
		Title = "🔓 Nat Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/bf.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
	local cokka = bf:Button({
		Title = "🔐 Cokka Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
	local forgee = bf:Button({
			Title = "🔐 Forge Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d5ed1fbd4301b1d18d75153c5b47181d.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
	local idkkkbro = bf:Button({
			Title = "🔐 Zyphrax Hub",
			Desc = "",
			Locked = false, 
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/BlackNode17/Zyphrax-Hub/refs/heads/main/Gateway"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
					})
			end})
	
else
	local bfx = Script:Section({
			Title = "[🍎] Blox Fruits",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
    local blxfrt = bfx:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Blox Fruits game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
end



if GAG then
	local gage = Script:Section({ 
    Title = "[🥕] Grow a Garden",
	Opened = true,
	Box = true,
	BoxBorder = true,
})
	
    local gagapex = gage:Button({
	Title = "🔓 Apex OT",
	Desc = "",
	Locked = false,
        Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo31/KaiXApex/refs/heads/main/ApexOT.lua"))()
			end})
	
    local idk = gage:Button({
    Title = "🔓 No Hub",
    Desc = "",
    Locked = true,
    Callback = function()

            end
        })
	
	local ronix = gage:Button({
		Title = "🔐 Ronix Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
							})
					end})
	local forgehubbgag = gage:Button({
			Title = "🔐 Forge Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d5ed1fbd4301b1d18d75153c5b47181d.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})

else
	local gages = Script:Section({
			Title = "[🥕] Grow a Garden",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
    local gagg = gages:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Grow a Garden game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
end


if Brookhaven then
	local BH = Script:Section({
	Title = "[🏡] Brookhaven RP!",
	Opened = true,
	Box = true,
	BoxBorder = true,
	})
	local apex = BH:Button({
		Title = "🔓 APEX OT",
		Desc = "",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo31/KaiXApex/refs/heads/main/ApexOT.lua"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
	local nexusbh = BH:Button({
			Title = "🔓 Nexus Hub",
			Desc = "",
			Locked = false,
			Callback = function()
loadstring(game:HttpGet('https://nexus-script.vercel.app/Brookhaven.lua'))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})

	local redbbh = BH:Button({
			Title = "🔐 Red Black Hub",
			Desc = "",
			Locked = false,
			Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/Original.Lua"))() 

			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})


			
else
	local BHbro = Script:Section({
			Title = "[🏡] Brookhaven RP!",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
	local broook = BHbro:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Brookhaven RP game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
end
	

if GH then
	local Gar = Script:Section({
	Title = "[🌱] Garden Horizon",
	Opened = true,
	Box = true,
	BoxBorder = true,
	})
	
	local winddhub = Gar:Button({
			Title = "🔓 Wind Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet('https://raw.githubusercontent.com/Maanaaaa/WindHub/refs/heads/main/MainScript.luau'))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
					})
					end})
	local forgegh = Gar:Button({
			Title = "🔐 Forge Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d5ed1fbd4301b1d18d75153c5b47181d.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})

	local flowhub = Gar:Button({
			Title = "🔐 Flow",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://rawscripts.net/raw/BOTANIST-Garden-Horizons-Auto-Plant-Auto-Sell-Auto-harvest-and-mutations-Full-afk-127060"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
else
	local Garden = Script:Section({
			Title = "[🌱] Garden Horizon",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
	local ghn = Garden:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Garden Horizon game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
end

--local rt3group = Script:Group({})
if RT3 then
local rt3 = Script:Section({ 
    Title = "[👨‍🍳] Restaurant Tycoon 3",
	Opened = true,
	Box = true,
	BoxBorder = true,
})

local rt3hub1 = rt3:Button({
    Title = "🔓 Samuraa1 Hub",
    Desc = "",
    Locked = false,
    Callback = function()
 loadstring(game:HttpGet('https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/RT3.lua'))()
           WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
        })

local rt3hub2 = rt3:Button({
	Title = "🔓 Sniper Hub",
	Desc = "",
	Locked = false,
	Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/pubmain/sniper-bin/refs/heads/main/Restaurant%20Tycoon%203.luau"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end
		})

local rt3hub3 = rt3:Button({
		Title = "🔐 Beecon Hub",
		Desc = "",
		Locked = false,
		Callback = function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
					})
			end})

local rt3hub4 = rt3:Button({
		Title = "🔐 Seisen Hub",
		Desc = "",
		Locked = false, 
		Callback = function()
			loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/8ac2e97282ac0718aeeb3bb3856a2821d71dc9e57553690ab508ebdb0d1569da/download"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
							end})

elseif RT2 then
	local rt2 = Script:Section({
		Title = "[👨‍🍳] Restaurant Tycoon 2",
		Opened = true,
		Box = true,
	    BoxBorder = true,
})
local rt2hub1 = rt2:Button({
		Title = "❓ Miwazen",
		Desc = "",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://restaurant.liverzmods.workers.dev"))();
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
							end})
else
	local rtggg = Script:Section({
		Title = "[👨‍🍳] Restaurant Tycoon",
		Opened = false,
		Box = true,
		BoxBorder = true,
})
	
local rtg = rtggg:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in any Restaurant Tycoon game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})	

        
        
end -- real else end



if SailorPiece then
	local spp = Script:Section({
		Title = "[⛵] Sailor Piece",
		Opened = true,
		Box = true,
	    BoxBorder = true,
})
	local ATG = spp:Button({
		Title = "🔐 ATG Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/c6df1a32acc80543801abbdcbcb18819.lua"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})
	local VAVA = spp:Button({
		Title = "🔓 VAVA Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Vavadragonss/VavaHubb/refs/heads/main/v1.lua"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})
	local HOHOSP = spp:Button({
			Title = "🔐 HoHo Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})
	local Nicuse = spp:Button({
		Title = "🔐 Nicuse",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://gist.githubusercontent.com/Nicuse101/cbfabe84baf69caee758ed4677f6e825/raw/31a245b32ed5502ffb9db18c730082bdfa7d1ce6/sailor%2520piece%2520loader"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
		end})
				
	local alch = spp:Button({
		Title = "🔐 Alchemy Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet('https://getalchemy.net/r'))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})
	local ZXhub = spp:Button({
		Title = "🔐 ZXC Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/4b11c259bd6c83ee90ee87880e7cc7a7d3ed4f0f3845cd150bea27d6b8bde6cc/download"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})

	local swy = spp:Button({
		Title = "🔐 SWY Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/da18c7b3db7c1d82e01e3ac8b611af2186cf94aa973a2d48bb2302f2afc2fbac/download"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})

	local hubbb = spp:Button({
		Title = "🔐 Ziaa Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/ef529e68ff9a101094ee35813edcda8c2d8d323f33a4f3bff40899c9ddfdb778/download"))()
			WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
			end})
	

else
	local spph = Script:Section({
			Title = "[⛵] Sailor Piece",
			Opened = false, 
			Box = true,
	        BoxBorder = true,
		})
	local silor = spph:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Sailor Piece game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
end

	
if los then
	local LOSpeed = Script:Section({
			Title = "[🏃‍♂️] Legend of Speed",
		    Opened = true,
			Box = true,
	        BoxBorder = true,
		})
	
	local speeeeed = LOSpeed:Paragraph({
    Title = "Tips:",
    Desc = "We do recommend to change your walkspeed in Player tab.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})

else
	local Legends = Script:Section({
			Title = "[🏃‍♂️] Legend of Speed",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
	local speedddd = Legends:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Legend of Speed game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
end



if Kick then
	local kickLBb = Script:Section({
		Title = "[🌟] Kick a Lucky Block",
		Opened = true,
		Box = true,
	    BoxBorder = true,
})
	
	local Kick1 = kickLBb:Button({
			Title = "🔐 Rey Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://pastebin.com/raw/zbKAtUEn"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 6, -- 3 seconds
                Icon = "bell",
									})
									end})
	local Kick2 = kickLBb:Button({
		Title = "🔐 Luminis Hub",
		Desc = "",
	    Locked = false,
	    Callback = function()
				loadstring(game:HttpGet("https://luminis.fun/loader.luau"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
									})
									end})
else
	local kickph = Script:Section({
			Title = "[🌟] Kick a Lucky Block",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
	local kickkakak = kickph:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Kick a Lucky Block game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end							

if Rvs then
	local rivals = Script:Section({
		Title = "[🔫] Rivals",
		Opened = true,
		Box = true,
	    BoxBorder = true,
	})
	
	local forgerivals = rivals:Button({
			Title = "🔐 Forge Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d5ed1fbd4301b1d18d75153c5b47181d.lua"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})
else
	local rivalph = Script:Section({
			Title = "[🔫] Rivals",
			Opened = false,
			Box = true,
	        BoxBorder = true,
		})
	local rvbro = rivalph:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Rivals game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	



if SAB then
	local SABsection = Script:Section({
		Title = "[🤖] Steal a Brainrot",
		Opened = true,
		Box = true,
	    BoxBorder = true,
	})
	local SABhub1 = SABsection:Button({
		Title = "🔓 Palku Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				loadstring(game:HttpGet("https://codeberg.org/hubs/sab/raw/branch/main/palkuhub"))()
				
			end})
	local SABhubidk = SABsection:Button({
			Title = "🔐 HoHo Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
				
			end})
	local SABhub2 = SABsection:Button({
		Title = "🔐 Ather Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				--DISCORD please join: https://discord.gg/x4ux7pUVJu
--script_key = "Add key here to auto verify"
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
			
			end})

	local SABhub3 = SABsection:Button({
		Title = "🔐 Space Hub",
		Desc = "",
		Locked = false,
		Callback = function()
				-- getgenv().GameName = "Steal A Brainrot" -- if u want to play copyes of original game
loadstring(game:HttpGet('https://raw.githubusercontent.com/ago106/SpaceHub/refs/heads/main/loader.lua'))()
				
			end})

else
	local StealBr = Script:Section({
			Title = "[🤖] Steal a Brainrot",
			Opened = false,
			Box = true,
	BoxBorder = true,
		})
	local sabpa = StealBr:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Steal a Brainrot game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	
if PSX then
	local psxsection = Script:Section({
			Title = "[🐾] Pet Simulator X!",
			Opened = true,
			Box = true,
	BoxBorder = true,
		})
	local psxhub1 = psxsection:Button({
			Title = "🔐 Extreme",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet("https://xtrm.dev/api/loader"))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})

elseif PS99 then
	local ps99section = Script:Section({
			Title = "[🐱] Pet Simulator 99!",
			Opened = true,
			Box = true,
	BoxBorder = true,
		})
	local ps99hub = ps99section:Button({
			Title = "🔐 Zap Hub",
			Desc = "",
			Locked = false,
			Callback = function()
				loadstring(game:HttpGet('https://zaphub.xyz/Exec'))()
				WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Script Executed!",
                Duration = 5, -- 3 seconds
                Icon = "bell",
})
			end})


elseif PG then
	local pgsection = Script:Section({
			Title = "[👾] Pet's Go!",
			Opened = true,
			Box = true,
	BoxBorder = true,
		})

else
	local pssection = Script:Section({
			Title = "[🐕] Pet Simulators",
			Opened = false,
			Box = true,
	BoxBorder = true,
		})
	local pss = pssection:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in any Pet Simulators game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	



if AM then
	local Adoptt = Script:Section({
		Title = "[🐰] Adopt Me!",
		Opened = true,
		Box = true,
	BoxBorder = true,
	})
	local AdoptHub1 = Adoptt:Button({
			Title = "HAHAHAH",
			Desc = "",
			Locked = true,
			Callback = function()

			end})

else
	local adopm = Script:Section({
			Title = "[🐰] Adopt Me!",
			Opened = false,
			Box = true,
	BoxBorder = true,
		})
	local adme = adopm:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Adopt Me game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	

if Nights then
	local NForest = Script:Section({
			Title = "[🌳] 99 Nights in the Forest",
			Opened = true,
			Box = true,
	BoxBorder = true,
		})
else
	local NForest2 = Script:Section({
			Title = "[🌳] 99 Nights in the Forest",
			Opened = false,
			Box = true,
	BoxBorder = true,
		})

	local ninetyye = NForest2:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in 99 Nights in the Forest game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	

if MS then
local Meme = Script:Section({
		Title = "[😂] Meme Sea]",
		Opened = true,
		Box = true,
	BoxBorder = true,
		})

else
local Meme1 = Script:Section({
		Title = "[😂] Meme Sea",
		Opened = false,
			Box = true,
	BoxBorder = true,
		})
	
local memee = Meme1:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Meme Sea game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	

if MM2 then
	local MyM2 = Script:Section({
			Title = "[🗡️] Murder Mystery 2",
			Opened = true,
			Box = true,
	BoxBorder = true,
		})

MyM2:Button({
			Title = "🔓 Vex Hub",
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/INCAVO/Vex-Hub-Mm2/refs/heads/main/Vex%20Hub%20MM2"))()
				WindUI:Notify({
						Title = "Liquid Hub",
						Content = "Script executed successfully!",
						Icon = "check",
						Duration = 3,
					})
			end
		})
else
	local Mur2 = Script:Section({
			Title = "[🗡️] Murder Mystery 2",
			Opened = false,
			Box = true,
	BoxBorder = true,
		})

	local mmmm = Mur2:Paragraph({
    Title = "NOTICE:",
    Desc = "You're not in Murder Mystery 2 game.",
    --Color = "Red",
    --Image = "",
    --ImageSize = 30,
    --Thumbnail = "",
    --ThumbnailSize you 80,
    Locked = false,
    --[[Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
    ]]
})
	end	
	


local musics = More:Section({
		Title = "Universal Music Player",
		Icon = "music", --lucide
		Opened = true,
		Box = true,
	    BoxBorder = true,
	})

local GroupStack = musics:HStack()

local LeftGS = GroupStack:VStack()
local RightGS = GroupStack:VStack()


-- Create Sound instance
local Music = Instance.new("Sound")
Music.Parent = SoundService
Music.Volume = 0.5
Music.Looped = false

-- Music ID Input
LeftGS:Input({
    Title = "Music ID",
    Desc = "Enter Roblox Music ID",
    Icon = "music",
    Placeholder = "e.g. 1234567890",
    Callback = function(value)
        local id = tonumber(value)
        if id then
            Music.SoundId = "rbxassetid://" .. id
            if Music.IsPlaying then
                Music:Stop()
                Music:Play()
            end
        end
    end,
})

-- Play Music Toggle
LeftGS:Toggle({
    Title = "Play Music",
    Desc = "Toggle music on/off",
    Icon = "play",
    Value = false,
    Callback = function(state)
        if state then
            Music:Play()
        else
            Music:Stop()
        end
    end,
})

-- Loop Music Toggle
LeftGS:Toggle({
    Title = "Loop Music",
    Desc = "Toggle music loop",
    Icon = "repeat",
    Value = false,
    Callback = function(state)
        Music.Looped = state
    end,
})

-- Volume Slider
LeftGS:Slider({
    Title = "Volume",
    Desc = "Adjust music volume",
    Icons = { 
			From = "volume",
			To = "volume-2",
		},
    Value = {
        Min = 0,
        Max = 100,
        Default = 50,
    },
    Step = 1,
    Callback = function(value)
        Music.Volume = value / 100
    end,
})

-- Playback Speed Dropdown
LeftGS:Dropdown({
    Title = "Playback Speed",
    Desc = "Adjust music playback speed",
    Icon = "activity",
	Values = {
        "0.5x",
        "0.75x",
        "1x (Default)",
        "2x",
        "3x",
        "4x",
        "5x",
        "6x",
        "7x",
        "8x",
        "9x",
        "10x",
    },
    Value = "1x (Default)",
    
    Callback = function(value)
        local speeds = {
            ["0.5x"] = 0.50,
            ["0.75x"] = 0.75,
            ["1x (Default)"] = 1,
            ["2x"] = 2,
            ["3x"] = 3,
            ["4x"] = 4,
            ["5x"] = 5,
            ["6x"] = 6,
            ["7x"] = 7,
            ["8x"] = 8,
            ["9x"] = 9,
            ["10x"] = 10,
        }
        Music.PlaybackSpeed = speeds[value]
    end,
})
local spotifymp = RightGS:Button({
		Title = "🔓 Ares Spotify Music",
		Desc = "Loads a universal music script.",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spotify-Music-Player-Universal-207570"))()
		end})
local YTMusicMp = RightGS:Button({
		Title = "🔓 YouTube Music Player",
		Desc = "Loads a universal music script.",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet(('https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/Youtube%20Music%20Player/YoutubeMusicPlayer.lua'),true))()
		end})

local fe = More:Section({
		Title = "FE Scripts",
        Desc = "Explore FE-based utilities, social tools, and effects.",
		Icon = "person-standing",
		Opened = false,
		Box = true,
	    BoxBorder = true,
})

local festack = fe:HStack()

local LeftFE = festack:VStack()
local RightFE = festack:VStack()

local AdminFE = LeftFE:Section({
		Title = "Dev Tools",
        TextXAlignment = "Center",
        Opened = true
	})
local iy = AdminFE:Button({
	Title = "🔓 Infinite Yield",
	Desc = "",
	Locked = false,
	Callback = function()
			loadstring(game:HttpGet('https://cdn.robloxscripts.gg/public/furky/furky-infinite-yield-roblox-admin-script-source.lua'))()
		end})
local dex = AdminFE:Button({
		Title = "🔓 Dex",
		Desc = "",
		Locked = false,
		Callback = function()
			local Dialog = Window:Dialog({
    Icon = "bolt", -- lucide icon or "rbxassetid://". optional
    Title = "Liquid Hub | Dex",
    IconThemed = true, -- use theme colors for icon. optional
    Content = "There are 2 version of Dex Explorer, which version would you like to use?",
    Buttons = {
        {
            Title = "Dex",
            
            Callback = function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/LorekeeperZinnia/Dex/refs/heads/master/main.lua"))()
                print("Loaded Dex (non ++)")
            end
        },
        {
            Title = "Dex++",
            
            Callback = function()
						loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
                print("Loaded Dex++")
            end
        }
    }
})
					end
	})

local EmotesFE = RightFE:Section({
		Title = "Emotes ",
        TextXAlignment = "Center",
        Opened = true
	})

EmotesFE:Button({
		Title = "🔓 Emote GUI",
		Desc = "Loads a universal Emote Script",
		Callback = function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-Emotes-GUI-Open-Source-229171"))()
		end
	})
EmotesFE:Button({
		Title = "🔓 AFEM Max",
		Desc = "Loads a universal Emote Script",
		Callback = function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-Max-Open-Alpha-50210"))()
		end
	})

local universal = More:Section({
		Title = "Universal Scripts",
		Desc = "",
		Icon = "globe",
		Opened = true,
		Box = true,
		BoxBorder = true,
	})

universal:Button({
		Title = "🔐 Rey Hub",
		Desc = "",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://pastebin.com/raw/zbKAtUEn"))()
		end 
	})

local exe = More:Section({
		Title = "Execute Script",
		Desc = "Execute a loadstring script inside our script",
		Icon = "monitor-cog",
		Opened = true,
		Box = true,
	BoxBorder = true,
	})

local scriptInput = ""

local Input = exe:Input({
    Title = "Script Executor",
    Desc = "Paste loadstring script",
    Value = "",
    Type = "Textarea",
    Placeholder = 'loadstring(game:HttpGet("URL"))()',
    Callback = function(input)
        scriptInput = input
    end
})

local Button = exe:Button({
    Title = "Execute Script",
    Desc = "Run the input script",
    Callback = function()

        if not scriptInput or scriptInput == "" then
            WindUI:Notify({
                Title = "Error",
                Content = "No script entered",
                Duration = 3
            })
            return
        end

        -- basic check (optional pero recommended)
        if not string.find(scriptInput, "loadstring") then
            WindUI:Notify({
                Title = "Error",
                Content = "Invalid script (must use loadstring)",
                Duration = 3
            })
            return
        end

        --  execute nwnnwnw
        local success, err = pcall(function()
            loadstring(scriptInput)()
        end)

        if success then
            WindUI:Notify({
                Title = "Success",
                Content = "Script executed",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Error",
                Content = "Execution failed",
                Duration = 3
            })
            warn(err)
        end
    end
})

local rf = More:Section({
		Title = "Remote Executor",
		Desc = "Run codes inside our script.",
		Icon = "chevrons-left-right-ellipsis",
		Opened = true,
		Box = true,
	BoxBorder = true,
	})
--  Code Preview
local CodePreview = rf:Code({
    Title = "Code Preview",
    Code = [[print("Waiting for input...")]]
})


local CodeToExecute = "" 
local FireCount = 1
local FireDelay = 0.1
local IsLooping = false

-- Code Input
rf:Input({
    Title = "Code Input",
	Desc = "Enter your code function",
    Placeholder = "...",
    Callback = function(text)
        CodeToExecute = text
        CodePreview:SetCode(text) 
    end
})

-- Fire Count Input or just run count, whatever it is
rf:Input({
    Title = "Run Count",
	Desc = "",
    Placeholder = "Default: 1",
    Callback = function(text)
        FireCount = tonumber(text) or 1
    end
})

-- Fire Delay Input 
rf:Input({
    Title = "Run Delay",
	Desc = "Delay between running the code (seconds)",
    Placeholder = "Default: 0.1",
    Callback = function(text)
        FireDelay = tonumber(text) or 0.1
    end
})

local rfgroup = rf:HStack()


--- Execution Logic with Notifications ---
local function FireTheCode()
    if CodeToExecute == "" or CodeToExecute == nil then
        WindUI:Notify({
            Title = "Liquid Hub",
            Content = "Code input is empty!",
            Duration = 2
        })
        return
    end

    local func, err = loadstring(CodeToExecute)
    if func then
        func()
    else
        WindUI:Notify({
            Title = "Syntax Error",
            Content = "Check your code for mistakes.",
            Duration = 3
        })
        warn("Error: " .. err)
    end
end

-- 4. Action Buttons

-- Run Code

rfgroup:Button({
    Title = "Run Code",
	Desc = "Run the code ONCE",
	Icon = "play",
    Callback = function()
        FireTheCode()
        WindUI:Notify({
            Title = "Liquid Hub",
            Content = "Code runned...",
			Icon = "file-code",
            Duration = 2
        })
    end
})

-- Run Multiple Code
rfgroup:Button({
    Title = "Run Multiple Code",
	Desc = "Run the code based on Run Count Input",
		Icon = "play",
    Callback = function()
        WindUI:Notify({
            Title = "Liquid Hub",
            Content = "Executing code " .. FireCount .. " times...",
            Duration = 2
        })
        
        for i = 1, FireCount do
            FireTheCode()
            task.wait(FireDelay)
        end
    end
})
-- Loop Run/Execute
rf:Toggle({
    Title = "Loop Run",
	Desc = "Continuously run the code with Run Delay interval",
	Icon = "repeat-2",
    Callback = function(state)
        IsLooping = state
        
        if state then
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Loop Execution: ENABLED",
                Duration = 2
            })
            
            task.spawn(function()
                while IsLooping do
                    FireTheCode()
                    task.wait(FireDelay)
                end
            end)
        else
            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Loop Execution: DISABLED",
                Duration = 2
            })
        end
    end
})
------------ TROLL TAB


----------- TELEPORT TAB
local tpsection = Teleport:Section({
		Title = "Teleport",
		Icon = "locate",
		Opened = true,
		Box = true,
		BoxBorder = true,
	})





local mouse = player:GetMouse()

-- 🧰 Function para gumawa ng tool
local function giveTeleportTool()
    -- remove old tool (optional)
    if player.Backpack:FindFirstChild("Teleport Tool") then
        player.Backpack["Teleport Tool"]:Destroy()
    end

    local tool = Instance.new("Tool")
    tool.Name = "Teleport Tool"
    tool.RequiresHandle = false
    tool.CanBeDropped = false

    tool.Activated:Connect(function()
        local character = player.Character
        if not character then return end

        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local target = mouse.Hit.Position
        root.CFrame = CFrame.new(target + Vector3.new(0, 3, 0))
    end)

    tool.Parent = player.Backpack
end

-- 🔘 Wind UI Button
tpsection:Button({
    Title = "Get Teleport Tool",
    Desc = "Click to receive teleport tool",
	Icon = "wand",
    Callback = function()
        giveTeleportTool()
    end
})


--[[local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local selectedPlayer = nil
local playerMap = {}
local tpEnabled = false
local followConnection

-- 🔁 Get player list (formatted)
local function getPlayerList()
    local list = {}
    playerMap = {}

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            local display = string.format("%s (@%s)", p.DisplayName, p.Name)
            table.insert(list, display)

            -- mapping para gumana teleport
            playerMap[display] = p
        end
    end

    return list
end

-- 📌 DROPDOWN
local PlayerDropdown = tpsection:Dropdown({
    Title = "Select Player",
    Values = getPlayerList(),
    Callback = function(value)
        selectedPlayer = playerMap[value]
    end
})

-- 🔘 TOGGLE (follow teleport)
tpsection:Toggle({
    Title = "Teleport to Player",
    Desc = "Follow selected player",
    Value = false,
    Callback = function(state)
        tpEnabled = state

        if state then
            followConnection = RunService.RenderStepped:Connect(function()
                if selectedPlayer and selectedPlayer.Character and player.Character then
                    local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local myRoot = player.Character:FindFirstChild("HumanoidRootPart")

                    if targetRoot and myRoot then
                        myRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
                    end
                end
            end)
        else
            if followConnection then
                followConnection:Disconnect()
                followConnection = nil
            end
        end
    end
})

-- 🔄 REFRESH BUTTON
tpsection:Button({
    Title = "Refresh Player List",
    Desc = "Update players",
    Callback = function()
        local newList = getPlayerList()
        PlayerDropdown:SetValues(newList)
    end
})

-- 🔁 Auto refresh kapag may pumasok/umalis
Players.PlayerAdded:Connect(function()
    PlayerDropdown:SetValues(getPlayerList())
end)

Players.PlayerRemoving:Connect(function()
    PlayerDropdown:SetValues(getPlayerList())
end)
]]
local PlayerParagraph = tpsection:Paragraph({
	Title = "...",
	Desc = "...",
	Image = Players:GetUserThumbnailAsync(1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420),
	ImageSize = 50,
	--Color = Color3.fromHex("#30ff6a"),
})

local camera = workspace.CurrentCamera

local SelectedPlayer = nil
local PlayersTable = {}


local function RefreshPlayersTable()
	PlayersTable = {}

	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player then
			table.insert(PlayersTable, {
				Title = p.DisplayName,
				Desc = "@" .. p.Name,
				_User = p,
				_UserId = p.UserId,
				Icon = Players:GetUserThumbnailAsync(
					p.UserId,
					Enum.ThumbnailType.HeadShot,
					Enum.ThumbnailSize.Size420x420
				),
			})
		end
	end

	return PlayersTable
end

local Dropdown = tpsection:Dropdown({
	Title = "Select Player",
	SearchBarEnabled = true,
	Values = {},
	Callback = function(selected)
		if not selected then return end

		SelectedPlayer = selected._User
		--PlayerParagraph:SetTitle(selectedplayer.Title)
		--PlayerParagraph:SetDesc(selectedplayer._Name)
		--PlayerParagraph:SetImage(selectedplayer.Icon)
	end
})

-- initial load
Dropdown:Refresh(RefreshPlayersTable())

tpsection:Button({
	Title = "Update Player List",
	Icon = "refresh-ccw",
	Callback = function()
		Dropdown:Refresh(RefreshPlayersTable())

		WindUI:Notify({
			Title = "Liquid Hub | Success",
			Content = "Player list updated",
			Icon = "circle-check-big",
			Duration = 3
		})
	end
})

Players.PlayerAdded:Connect(function()
	task.wait(0.5)
	Dropdown:Refresh(RefreshPlayersTable())
end)

Players.PlayerRemoving:Connect(function()
	task.wait(0.5)
	Dropdown:Refresh(RefreshPlayersTable())
end)

-------------------------------------------------
-- 🔘 TELEPORT TO PLAYER
-------------------------------------------------
local tpConnection

local tpplayer = tpsection:Toggle({
	Title = "Teleport to Player",
	Icon = "user",
	Value = false,
	Callback = function(state)
		if state then
			if not SelectedPlayer then
				WindUI:Notify({
					Title = "Error",
					Content = "Select a player first",
					Duration = 3
				})
				return
			end

			tpConnection = RunService.RenderStepped:Connect(function()
				if SelectedPlayer and SelectedPlayer.Character and player.Character then
					local target = SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
					local myRoot = player.Character:FindFirstChild("HumanoidRootPart")

					if target and myRoot then
						myRoot.CFrame = target.CFrame + Vector3.new(0, 3, 0)
					end
				end
			end)

			--[[WindUI:Notify({
				Title = "Success",
				Content = "Teleport Enabled",
				Duration = 3
			})]]

		else
			if tpConnection then
				tpConnection:Disconnect()
				tpConnection = nil
				tpplayer:Set(false)
			end

			--[[:Notify({
				Title = "Success",
				Content = "Teleport Disabled",
				Duration = 3
			})]]
		end
	end
})

local specConnection

tpsection:Toggle({
	Title = "Spectate Player",
	Icon = "eye",
	Value = false,
	Callback = function(state)
		if state then
			if not SelectedPlayer then
				WindUI:Notify({
					Title = "Error",
					Content = "Select a player first",
					Duration = 3
				})
				return
			end

			specConnection = RunService.RenderStepped:Connect(function()
				if SelectedPlayer and SelectedPlayer.Character then
					local humanoid = SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
					if humanoid then
						camera.CameraSubject = humanoid
					end
				end
			end)

			--[[WindUI:Notify({
				Title = "Success",
				Content = "Spectate Enabled",
				Duration = 3
			})]]

		else
			if specConnection then
				specConnection:Disconnect()
				specConnection = nil
			end

			if player.Character then
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					camera.CameraSubject = humanoid
				end
			end

			--[[WindUI:Notify({
				Title = "Success",
				Content = "Spectate Disabled",
				Duration = 3
			})]]
		end
	end
})
--[[
local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Following = false
local TargetPlayer = nil
local FollowConnection = nil
local Highlight = nil

local function RemoveTarget()
    if FollowConnection then
        FollowConnection:Disconnect()
        FollowConnection = nil
    end

    if Highlight then
        Highlight:Destroy()
        Highlight = nil
    end

    TargetPlayer = nil

    local Character = LocalPlayer.Character
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid:MoveTo(Character.HumanoidRootPart.Position)
    end
end

local function CreateHighlight(Character)
    if Highlight then
        Highlight:Destroy()
    end

    Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 0.5
    Highlight.OutlineTransparency = 0
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Parent = Character
end

local function FollowTarget()
    if FollowConnection then
        FollowConnection:Disconnect()
    end

    FollowConnection = RunService.Heartbeat:Connect(function()
        if not Following then
            return
        end

        if not TargetPlayer
        or not TargetPlayer.Character
        or not TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return
        end

        local Character = LocalPlayer.Character
        if not Character
        or not Character:FindFirstChild("Humanoid")
        or not Character:FindFirstChild("HumanoidRootPart") then
            return
        end

        local Humanoid = Character:FindFirstChild("Humanoid")
        local Root = Character:FindFirstChild("HumanoidRootPart")

        local TargetRoot = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")

        local Distance = (Root.Position - TargetRoot.Position).Magnitude

        if Distance > 5 then
            Humanoid:MoveTo(TargetRoot.Position)
        end
    end)
end

tpsection:Toggle({
    Title = "Click To Follow Player",
    Desc = "Click a player to follow/unfollow",
	Icon = "move-right",
    Value = false,
    Callback = function(Value)
        Following = Value

        if not Value then
            RemoveTarget()

            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Follow disabled.",
                Duration = 2
            })

            return
        end

        WindUI:Notify({
            Title = "Liquid Hub",
            Content = "Click a player to follow.",
            Duration = 3
        })

        Mouse.Button1Down:Connect(function()
            if not Following then
                return
            end

            local Target = Mouse.Target
            if not Target then
                return
            end

            local Character = Target:FindFirstAncestorOfClass("Model")
            if not Character then
                return
            end

            local Player = Players:GetPlayerFromCharacter(Character)
            if not Player or Player == LocalPlayer then
                return
            end

            if TargetPlayer == Player then
                RemoveTarget()

                WindUI:Notify({
                    Title = "Liquid Hub",
                    Content = "Unfollowed target.",
                    Duration = 2
                })

                return
            end

            TargetPlayer = Player

            CreateHighlight(Character)
            FollowTarget()

            WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Now following: " .. Player.Name,
                Duration = 2
            })
        end)
    end
})
]]
--[[local tpbro = Teleport:Section({
		Title = "TP Misc",
		Icon = "archive",
		Opened = false,
	})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local LastDeathPosition = nil

-------------------------------------------------
-- 💀 SAVE DEATH POSITION
-------------------------------------------------
local function setupCharacter(char)
	local humanoid = char:WaitForChild("Humanoid")
	local root = char:WaitForChild("HumanoidRootPart")

	humanoid.Died:Connect(function()
		LastDeathPosition = root.Position

		WindUI:Notify({
			Title = "Death Saved",
			Content = string.format(
				"X: %.1f | Y: %.1f | Z: %.1f",
				LastDeathPosition.X,
				LastDeathPosition.Y,
				LastDeathPosition.Z
			),
			Duration = 2
		})
	end)
end

-------------------------------------------------
-- 🔄 CHARACTER LOAD
-------------------------------------------------
if LocalPlayer.Character then
	setupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setupCharacter)

-------------------------------------------------
-- 📍 TELEPORT BUTTON
-------------------------------------------------
tpbro:Button({
	Title = "Teleport to Last Death",
	Desc = "Teleport to your last death position",
	Callback = function()

		if not LastDeathPosition then
			WindUI:Notify({
				Title = "Teleport Failed",
				Content = "No death record found",
				Icon = "map-pin-off",
				Duration = 3
			})
			return
		end

		local char = LocalPlayer.Character
		if not char then return end

		local root = char:FindFirstChild("HumanoidRootPart")
		if not root then return end

		root.CFrame = CFrame.new(LastDeathPosition + Vector3.new(0, 3, 0))

		WindUI:Notify({
			Title = "Teleport Success",
			Content = string.format(
				"X: %.1f | Y: %.1f | Z: %.1f",
				LastDeathPosition.X,
				LastDeathPosition.Y,
				LastDeathPosition.Z
			),
			Duration = 5
		})
	end
})
]]

----------- SETTINGS TAB
local light = Settings:Section({
		Title = "Lighting",
        Desc = "Customize lighting and light effect.",
		Icon = "lightbulb",
		Opened = true,
		Box = true,
		BoxBorder = true,
	})



local original = {
	Ambient = Lighting.Ambient,
	ColorShift_Bottom = Lighting.ColorShift_Bottom,
	ColorShift_Top = Lighting.ColorShift_Top
}

local connection


local function applyFullbright()
	Lighting.Ambient = Color3.new(1, 1, 1)
	Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
	Lighting.ColorShift_Top = Color3.new(1, 1, 1)
end


light:Toggle({
	Title = "Fullbright",
	Icon = "sun",
	Value = false,
	Callback = function(state)

		if state then
			applyFullbright()

			connection = Lighting.LightingChanged:Connect(applyFullbright)

			WindUI:Notify({
				Title = "Success",
				Content = "Fullbright Enabled",
				Icon = "sun",
				Duration = 3
			})

		else
			--  disconnect loop
			if connection then
				connection:Disconnect()
				connection = nil
			end

			--  restore original
			Lighting.Ambient = original.Ambient
			Lighting.ColorShift_Bottom = original.ColorShift_Bottom
			Lighting.ColorShift_Top = original.ColorShift_Top

			WindUI:Notify({
				Title = "Success",
				Content = "Fullbright Disabled",
				Icon = "sun-dim",
				Duration = 3
			})
		end
	end
})

local effects = {}
local vignetteGui = nil

local lightingToggle = light:Toggle({
    Title = "RTX Summer Lighting [BETA]",
    Desc = "Enabling this could cause serious lag on some device.",
	Icon = "sparkles",
    Value = false,
    Callback = function(Value)
        if Value then
            -- CREATE ALL EFFECTS
            for i, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then
                    v:Destroy()
                end
            end
            
            -- Effects
            local Bloom = Instance.new("BloomEffect", Lighting)
            local Blur = Instance.new("BlurEffect", Lighting)
            local ColorCor = Instance.new("ColorCorrectionEffect", Lighting)
            local SunRays = Instance.new("SunRaysEffect", Lighting)
            local Sky = Instance.new("Sky", Lighting)
            local Atm = Instance.new("Atmosphere", Lighting)
            
            effects = {Bloom, Blur, ColorCor, SunRays, Sky, Atm}
            
            -- VIGNETTE
            vignetteGui = Instance.new("ScreenGui", StarterGui)
            vignetteGui.IgnoreGuiInset = true
            local ShadowFrame = Instance.new("ImageLabel", vignetteGui)
            ShadowFrame.AnchorPoint = Vector2.new(0.5,1)
            ShadowFrame.Position = UDim2.new(0.5,0,1,0)
            ShadowFrame.Size = UDim2.new(1,0,1.05,0)
            ShadowFrame.BackgroundTransparency = 1
            ShadowFrame.Image = "rbxassetid://4576475446"
            ShadowFrame.ImageTransparency = 0.3
            ShadowFrame.ZIndex = 10
            
            -- Apply settings (your exact values)
            Bloom.Intensity = 0.3; Bloom.Size = 10; Bloom.Threshold = 0.8
            Blur.Size = 5
            ColorCor.Brightness = 0.1; ColorCor.Contrast = 0.5; ColorCor.Saturation = -0.3; ColorCor.TintColor = Color3.fromRGB(255, 235, 203)
            SunRays.Intensity = 0.075; SunRays.Spread = 0.727
            Sky.SkyboxBk = "http://www.roblox.com/asset/?id=151165214"
            Sky.SkyboxDn = "http://www.roblox.com/asset/?id=151165197"
            Sky.SkyboxFt = "http://www.roblox.com/asset/?id=151165224"
            Sky.SkyboxLf = "http://www.roblox.com/asset/?id=151165191"
            Sky.SkyboxRt = "http://www.roblox.com/asset/?id=151165206"
            Sky.SkyboxUp = "http://www.roblox.com/asset/?id=151165227"
            Sky.SunAngularSize = 10
            Lighting.Ambient = Color3.fromRGB(2,2,2); Lighting.Brightness = 2.25
            Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0); Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
            Lighting.EnvironmentDiffuseScale = 0.2; Lighting.EnvironmentSpecularScale = 0.2
            Lighting.GlobalShadows = true; Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
            Lighting.ShadowSoftness = 0.2; Lighting.ClockTime = 17
            Lighting.GeographicLatitude = 45; Lighting.ExposureCompensation = 0.5
            Atm.Density = 0.364; Atm.Offset = 0.556; Atm.Color = Color3.fromRGB(199, 175, 166)
            Atm.Decay = Color3.fromRGB(44, 39, 33); Atm.Glare = 0.36; Atm.Haze = 1.72
            
            WindUI:Notify({Title = "🌅", Content = "Lighting ON", Duration = 2})
            
        else
            -- 🔥 COMPLETE ROBLOX RESET
            for _, obj in pairs(Lighting:GetChildren()) do
                if obj:IsA("PostEffect") or obj:IsA("Sky") or obj:IsA("Atmosphere") then
                    obj:Destroy()
                end
            end
            
            if vignetteGui then
                vignetteGui:Destroy()
                vignetteGui = nil
            end
            
            effects = {}
            
            -- FULL DEFAULT RESET
            Lighting:ClearAllChildren()
            Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            Lighting.Brightness = 1
            Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
            Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
            Lighting.EnvironmentDiffuseScale = 1
            Lighting.EnvironmentSpecularScale = 1
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            Lighting.ShadowSoftness = 1
            Lighting.ClockTime = 14
            Lighting.GeographicLatitude = 0
            Lighting.ExposureCompensation = 0
            
            WindUI:Notify({Title = "✅", Content = "Lighting FULLY Reset", Duration = 2})
        end
    end
})

light:Button({
		Title = "PShade Custom Lighting",
		Desc = "Loads PShader Lighting script",
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoomain-art/random123/refs/heads/main/shader.lua"))()

		end})
local antisystem = Settings:Section({
        Title = "Protection System",
        Desc = "Prevents harm",
        Icon = "shield",
        Opened = false,
        Box = true,
        BoxBorder = true,
})


 
local UI = Settings:Section({
		Title = "UI",
		Icon = "hammer",
		Opened = true,
		Box = true,
		
	})

local UI67 = UI:Section({
        Title = "Elements",
        Desc = "Manage UI's elements",
        Icon = "component",
        Opened = false,
        Box = true,
        BoxBorder = true,
})



UI67:Paragraph({
    Title = "TAG IDENTIFIER",
    Desc = "⏰ - Time/Date Tag\n📶 - Ping/FPS Tag\n📜 - Script Version Tag",
})

UI67:Toggle({
    Title = "⏰ | 24-Hour Format",
    Value = true,
    Callback = function(state)
        is24Hour = state
    end,
})

local UI2 = UI:Section({
		Title = "Theme Manager",
		Desc = "Customize your UI theme",
		Icon = "brush",
		Opened = false,
		Box = true, 
		BoxBorder = true,
	})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local canchangetheme = true
local canchangedropdown = true



local themeDropdown = UI2:Dropdown({
    Title = "Select Theme",
    Values = themes,
    Flag = "themeDropdown",
    SearchBarEnabled = true,
    MenuWidth = 280,
    Callback = function(theme)
        canchangedropdown = false
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "Theme Applied",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
        canchangedropdown = true
    end
})

local Toggle111 = UI2:Toggle({
	Title = "Window Transparency",
	Desc = "Make window transparent.",
	Icon = "blend",
	Value = Window.Transparent,
	Callback = function(v)
		Window:ToggleTransparency(v)

			WindUI:Notify({
				Title = "Liquid Hub | UI",
				Content = v and "Window Transparency Enabled" or "Window Transparency Disabled",
				Icon = "app-window",
				Duration = 2
				})
	end,
})

local UI3 = UI:Section({
		Title = "User",
        Desc = "Manage your Roblox User in the UI",
		Icon = "user",
		Opened = false,
		Box = true,
		BoxBorder = true,
	})



--local usergroup = UI3:HStack()

UI3:Toggle({
    Title = "Roblox User System",
	Desc = "Enables the user system in the UI",
	Icon = "user",
    Value = true,
    Callback = function(state)

        if state then
            Window.User:Enable()
				
        else
            Window.User:Disable()
				
        end
    end
})

UI3:Toggle({
    Title = "Anonymous User",
	Desc = "Hide user identity",
	Icon = "hat-glasses",
    Value = false,
    Callback = function(state)
        Window.User:SetAnonymous(state)
    end
})
UI:Button({
		Title = "Destroy Window UI",
		Color = Color3.fromHex("#ff4830"),
		Justify = "Center",
		Icon = "shredder",
		IconAlign = "Left",
		Callback = function()
			local Dialogg = Window:Dialog({
    --Icon = "rbxassetid://92919014193893",
	Icon = "unplug",
    Title = "Liquid Hub | Destroy UI",
    Content = "Are you sure you want to destroy the ui?",
    Buttons = {
        {
            Title = "Confirm",
			Icon = "check",
            Callback = function()
             Window:Destroy()
				game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Liquid Hub | UI",
    Text = "UI destroyed",
	Icon = "rbxassetid://92919014193893",									
    Duration = 5
})
            end,
        },
        {
            Title = "Cancel",
			Icon = "x",
            Callback = function()
                print("Window Destroy Cancelled!")
            end,
        },
    },
})														
		end,
	})

print("Loaded every function of the script...")

print("Executor Detected: " .. executorName)
print("Thank you for using our script, for more updates, kindly join to our discord community.")

