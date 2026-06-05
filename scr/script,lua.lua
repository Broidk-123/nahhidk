-- Liquid Hub | Murder Mystery 2 WindUI Migration

if not game:IsLoaded() then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Liquid Hub",
		Text = "Waiting for the game to finish loading!",
		Duration = 5
	})
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local PathfindingService = game:GetService("PathfindingService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local player = Players.LocalPlayer

local function getGuiParent()
	if gethui then
		local ok, hui = pcall(gethui)
		if ok and hui then
			return hui
		end
	end

	local ok, coreGui = pcall(function()
		return game:GetService("CoreGui")
	end)

	if ok and coreGui then
		return coreGui
	end

	return LocalPlayer:WaitForChild("PlayerGui")
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:Popup({
    Title = "Welcome, ".. player.Name.. "!",
    Icon = "rbxassetid://109069296276521",
    Content = "Hello! Thanks for using our script! Join to our discord server!",
    Buttons = {
        {
            Title = "Get Started",
            Icon = "arrow-right",
			Variant = "Primary",
            Callback = function() 
	
WindUI:Notify({
                Title = "Liquid Hub • Loaded!",
                Content = "Murder Mystery 2 script loaded.",
                Duration = 12, -- 3 seconds
                Icon = "rbxassetid://109069296276521",
})

WindUI:Notify({
                Title = "Liquid Hub",
                Content = "Explore the features of the script, enjoy!",
                Duration = 10, -- 3 seconds
                Icon = "rbxassetid://109069296276521",
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
pcall(function()
	WindUI:AddTheme({
		Name = "Liquid",
		Accent = Color3.fromRGB(14, 165, 233),
		Background = Color3.fromRGB(8, 13, 18),
		Outline = Color3.fromRGB(94, 234, 212),
		Text = Color3.fromRGB(241, 245, 249),
		Placeholder = Color3.fromRGB(125, 151, 171),
		Button = Color3.fromRGB(18, 31, 42),
		Icon = Color3.fromRGB(125, 211, 252)
	})
end)

local Window = WindUI:CreateWindow({
	Title = "Liquid Hub | MM2",
	Icon = "rbxassetid://109069296276521",
	Author = "by Liquid Management",
	Folder = "LiquidHub",
	Size = UDim2.fromOffset(620, 500),
	MinSize = Vector2.new(560, 360),
	MaxSize = Vector2.new(900, 620),
	ToggleKey = Enum.KeyCode.RightShift,
	Transparent = true,
	Theme = "Liquid",
	Resizable = true,
	SideBarWidth = 190,
	HideSearchBar = false,
	ScrollBarEnabled = true,
	OpenButton = {
		Title = "Open UI",
		Enabled = true,
		Draggable = true,
		
		CornerRadius = UDim.new(1, 0),
		StrokeThickness = 2,
		Color =	ColorSequence.new(
            Color3.fromHex("#063063"), -- Dark navy
			Color3.fromHex("#38BDF8")  -- Sky blue
    ),
	}
})

pcall(function()
	Window:Tag({
		Title = "MM2",
		Icon = "badge-check",
		Color = Color3.fromRGB(14, 165, 233),
		Border = true
	})
end)

pcall(function()
	Window:Tag({
		Title = "v1.0.0",
		Icon = "git-branch",
		Color = Color3.fromRGB(20, 184, 166),
		Border = true
	})
end)

local function notify(message, color, icon)
	local iconName = icon or "info"
	if iconName == "x" then
		iconName = "circle-x"
	end

	WindUI:Notify({
		Title = "Liquid Hub",
		Content = tostring(message),
		Desc = tostring(message),
		Duration = 5,
		Icon = iconName
	})
end

local activeDialog
local activeDialogEvent

local function openDialog(title, description, buttons)
	if activeDialog then
		pcall(function()
			activeDialog:Close()
		end)
	end

	if activeDialogEvent then
		activeDialogEvent:Destroy()
	end

	activeDialogEvent = Instance.new("BindableEvent")

	local dialogButtons = {}
	for _, buttonTitle in ipairs(buttons or {}) do
		table.insert(dialogButtons, {
			Title = tostring(buttonTitle),
			Callback = function()
				if activeDialogEvent then
					activeDialogEvent:Fire(tostring(buttonTitle))
				end
			end
		})
	end

	activeDialog = Window:Dialog({
		Title = title or "Liquid Hub",
		Content = description or "",
		Icon = "message-square",
		Buttons = dialogButtons
	})

	activeDialog:Show()
end

local function waitForDialog()
	if not activeDialogEvent then
		return nil
	end

	return activeDialogEvent.Event:Wait()
end

local function closeDialog()
	if activeDialog then
		pcall(function()
			activeDialog:Close()
		end)
	end

	if activeDialogEvent then
		activeDialogEvent:Destroy()
	end

	activeDialog = nil
	activeDialogEvent = nil
end

local fu = {
	notification = notify,
	dialog = openDialog,
	waitfordialog = waitForDialog,
	closedialog = closeDialog
}

local ESPIndicator = {}
ESPIndicator.__index = ESPIndicator
ESPIndicator.Groups = {}
ESPIndicator.TargetIndex = {}
ESPIndicator.Defaults = {
	AccentColor = Color3.new(1, 1, 0),
	HighlightFillTransparency = 0.7,
	HighlightOutlineTransparency = 0,
	HighlightDepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
	ArrowShow = false,
	ArrowEdgePadding = 50,
	ArrowMinDistance = 0,
	ArrowSize = UDim2.new(0, 30, 0, 30),
	ArrowImage = "rbxassetid://97136202386756",
	ArrowShowDistanceText = true,
	ArrowDistanceFont = Enum.Font.Montserrat,
	ArrowDistanceTextSize = 18,
	ShowLabel = false,
	LabelText = "Target",
	LabelMaxDistance = 99999,
	LabelOffset = Vector3.new(0, 2, 0)
}

local function targetPosition(target)
	if not target then
		return nil
	end

	if target:IsA("Model") then
		local ok, pivot = pcall(function()
			return target:GetPivot()
		end)

		if ok and pivot then
			return pivot.Position
		end

		if target.PrimaryPart then
			return target.PrimaryPart.Position
		end
	elseif target:IsA("BasePart") then
		return target.Position
	end

	return nil
end

function ESPIndicator.new(options)
	local self = setmetatable({}, ESPIndicator)
	self.Settings = {}

	for key, value in pairs(ESPIndicator.Defaults) do
		self.Settings[key] = options and options[key] ~= nil and options[key] or value
	end

	self.Settings.Parent = options and options.Parent or getGuiParent()
	self.ScreenGui = Instance.new("ScreenGui")
	self.ScreenGui.Name = "LiquidHub_ESPIndicators"
	self.ScreenGui.IgnoreGuiInset = true
	self.ScreenGui.ResetOnSpawn = false
	self.ScreenGui.Parent = self.Settings.Parent

	self.ArrowTemplate = Instance.new("ImageLabel")
	self.ArrowTemplate.Name = "ArrowTemplate"
	self.ArrowTemplate.Size = self.Settings.ArrowSize
	self.ArrowTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
	self.ArrowTemplate.BackgroundTransparency = 1
	self.ArrowTemplate.Image = self.Settings.ArrowImage
	self.ArrowTemplate.ImageColor3 = self.Settings.AccentColor
	self.ArrowTemplate.Visible = false
	self.ArrowTemplate.Parent = self.ScreenGui

	local scaler = Instance.new("UIScale")
	scaler.Name = "Scaler"
	scaler.Scale = 0
	scaler.Parent = self.ArrowTemplate

	self.Indicators = {}
	self._updateConn = RunService.RenderStepped:Connect(function()
		self:_update()
	end)

	self._cleanupConn = RunService.Heartbeat:Connect(function()
		self:_cleanupOrphanedArrows()
		self:_cleanupOrphanedHighlights()
		self:_cleanupOrphanedLabels()
	end)

	return self
end

function ESPIndicator:AddGroup(groupName)
	local group = ESPIndicator.Groups[groupName]
	if not group then
		group = {
			enabled = true,
			properties = {},
			targets = {}
		}
		ESPIndicator.Groups[groupName] = group
	end

	return group
end

function ESPIndicator:GetGroup(groupName)
	return ESPIndicator.Groups[groupName]
end

function ESPIndicator:RemoveGroup(groupName)
	local group = ESPIndicator.Groups[groupName]
	if not group then
		return false
	end

	local targets = table.clone(group.targets)
	for _, target in ipairs(targets) do
		local targetGroups = ESPIndicator.TargetIndex[target]
		if targetGroups then
			for index, indexedGroupName in ipairs(targetGroups) do
				if indexedGroupName == groupName then
					table.remove(targetGroups, index)
					break
				end
			end

			if #targetGroups == 0 then
				ESPIndicator.TargetIndex[target] = nil
			end
		end

		if not ESPIndicator.TargetIndex[target] then
			self:Remove(target)
		end
	end

	ESPIndicator.Groups[groupName] = nil
	return true
end

function ESPIndicator:ClearAllGroups()
	for groupName in pairs(ESPIndicator.Groups) do
		self:RemoveGroup(groupName)
	end
end

function ESPIndicator:ToggleGroup(groupName, enabled)
	local group = ESPIndicator.Groups[groupName]
	if not group then
		return nil
	end

	group.enabled = enabled ~= nil and enabled or not group.enabled

	for _, target in ipairs(group.targets) do
		local indicator = self.Indicators[target]
		if indicator then
			if indicator.Highlight then
				indicator.Highlight.Enabled = group.enabled
			end

			if indicator.Arrow then
				indicator.Arrow.Visible = group.enabled and (indicator.Options.ArrowShow or self.Settings.ArrowShow)
			end

			if indicator.Label then
				indicator.Label.Enabled = group.enabled
			end
		end
	end

	return group.enabled
end

function ESPIndicator:SetGroupProperty(groupName, propertyName, value)
	local group = self:AddGroup(groupName)
	group.properties[propertyName] = value

	for _, target in ipairs(group.targets) do
		local indicator = self.Indicators[target]
		if indicator and propertyName == "AccentColor" then
			if indicator.Highlight then
				indicator.Highlight.FillColor = value
				indicator.Highlight.OutlineColor = value
			end

			if indicator.Arrow then
				indicator.Arrow.ImageColor3 = value
			end

			if indicator.DistanceLabel then
				indicator.DistanceLabel.TextColor3 = value
			end

			if indicator.Label and indicator.Label:FindFirstChild("TextLabel") then
				indicator.Label.TextLabel.TextColor3 = value
			end
		end
	end
end

function ESPIndicator:Add(target, options)
	assert(target, "ESPIndicator:Add requires a non-nil target")

	if self.Indicators[target] then
		self:Remove(target)
	end

	options = options or {}

	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight_" .. HttpService:GenerateGUID(false)
	highlight.Adornee = target
	highlight.FillTransparency = options.HighlightFillTransparency or self.Settings.HighlightFillTransparency
	highlight.FillColor = options.AccentColor or self.Settings.AccentColor
	highlight.OutlineColor = options.AccentColor or self.Settings.AccentColor
	highlight.OutlineTransparency = options.HighlightOutlineTransparency or self.Settings.HighlightOutlineTransparency
	highlight.DepthMode = options.HighlightDepthMode or self.Settings.HighlightDepthMode
	highlight.Parent = self.ScreenGui

	local arrow
	local arrowScaler
	local distanceLabel

	if options.ArrowShow or self.Settings.ArrowShow then
		arrow = self.ArrowTemplate:Clone()
		arrow.Name = "Arrow_" .. HttpService:GenerateGUID(false)
		arrow.ImageColor3 = options.AccentColor or self.Settings.AccentColor
		arrow.Visible = true
		arrow.Parent = self.ScreenGui

		arrowScaler = arrow:FindFirstChild("Scaler")

		if options.ArrowShowDistanceText or self.Settings.ArrowShowDistanceText then
			distanceLabel = Instance.new("TextLabel")
			distanceLabel.Name = "DistanceLabel"
			distanceLabel.AnchorPoint = Vector2.new(0.5, 0)
			distanceLabel.BackgroundTransparency = 1
			distanceLabel.Font = options.ArrowDistanceFont or self.Settings.ArrowDistanceFont
			distanceLabel.TextSize = options.ArrowDistanceTextSize or self.Settings.ArrowDistanceTextSize
			distanceLabel.TextColor3 = options.AccentColor or self.Settings.AccentColor
			distanceLabel.Parent = arrow
		end
	end

	local label
	if options.ShowLabel or self.Settings.ShowLabel then
		label = Instance.new("BillboardGui")
		label.Name = "Label_" .. HttpService:GenerateGUID(false)
		label.AlwaysOnTop = true
		label.MaxDistance = self.Settings.LabelMaxDistance
		label.Size = UDim2.new(0, 70, 0, 70)
		label.StudsOffset = self.Settings.LabelOffset
		label.Adornee = target
		label.Parent = self.ScreenGui

		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "TextLabel"
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextScaled = true
		textLabel.TextWrapped = true
		textLabel.TextSize = 14
		textLabel.TextColor3 = options.AccentColor or self.Settings.AccentColor
		textLabel.Text = options.LabelText or self.Settings.LabelText
		textLabel.Parent = label
		Instance.new("UIStroke", textLabel)
	end

	self.Indicators[target] = {
		Highlight = highlight,
		Arrow = arrow,
		Scaler = arrowScaler,
		DistanceLabel = distanceLabel,
		Label = label,
		Options = options
	}

	local groupName = options.GroupName or self.Settings.GroupName
	if groupName then
		self:AddToGroup(target, groupName)
	end
end

function ESPIndicator:Remove(target)
	local indicator = self.Indicators[target]
	if not indicator then
		return
	end

	if indicator.Highlight then
		indicator.Highlight.Adornee = nil
		indicator.Highlight:Destroy()
	end

	if indicator.Arrow then
		indicator.Arrow:Destroy()
	end

	if indicator.Label then
		indicator.Label:Destroy()
	end

	local targetGroups = ESPIndicator.TargetIndex[target]
	if targetGroups then
		for _, groupName in ipairs(targetGroups) do
			local group = ESPIndicator.Groups[groupName]
			if group then
				for index, groupedTarget in ipairs(group.targets) do
					if groupedTarget == target then
						table.remove(group.targets, index)
						break
					end
				end
			end
		end
		ESPIndicator.TargetIndex[target] = nil
	end

	self.Indicators[target] = nil
end

function ESPIndicator:AddToGroup(target, groupName)
	local group = self:AddGroup(groupName)

	if not table.find(group.targets, target) then
		table.insert(group.targets, target)
	end

	local targetGroups = ESPIndicator.TargetIndex[target]
	if not targetGroups then
		targetGroups = {}
		ESPIndicator.TargetIndex[target] = targetGroups
	end

	if not table.find(targetGroups, groupName) then
		table.insert(targetGroups, groupName)
	end

	for propertyName, value in pairs(group.properties) do
		self:SetGroupProperty(groupName, propertyName, value)
	end

	if not group.enabled then
		local indicator = self.Indicators[target]
		if indicator and indicator.Highlight then
			indicator.Highlight.Enabled = false
		end
	end

	return true
end

function ESPIndicator:RemoveFromGroup(target, groupName)
	local group = ESPIndicator.Groups[groupName]
	if not group then
		return false
	end

	for index, groupedTarget in ipairs(group.targets) do
		if groupedTarget == target then
			table.remove(group.targets, index)
			break
		end
	end

	local targetGroups = ESPIndicator.TargetIndex[target]
	if targetGroups then
		for index, indexedGroupName in ipairs(targetGroups) do
			if indexedGroupName == groupName then
				table.remove(targetGroups, index)
				break
			end
		end

		if #targetGroups == 0 then
			ESPIndicator.TargetIndex[target] = nil
		end
	end

	return true
end

function ESPIndicator:GetGroupTargets(groupName)
	local group = ESPIndicator.Groups[groupName]
	return group and group.targets or {}
end

function ESPIndicator:GetTargetGroups(target)
	return ESPIndicator.TargetIndex[target] or {}
end

function ESPIndicator:_allHighlights()
	local highlights = {}
	for _, indicator in pairs(self.Indicators) do
		if indicator.Highlight then
			table.insert(highlights, indicator.Highlight)
		end
	end
	return highlights
end

function ESPIndicator:_allArrows()
	local arrows = {}
	for _, indicator in pairs(self.Indicators) do
		if indicator.Arrow then
			table.insert(arrows, indicator.Arrow)
		end
	end
	return arrows
end

function ESPIndicator:_allLabels()
	local labels = {}
	for _, indicator in pairs(self.Indicators) do
		if indicator.Label then
			table.insert(labels, indicator.Label)
		end
	end
	return labels
end

function ESPIndicator:_cleanupOrphanedHighlights()
	for _, child in ipairs(self.ScreenGui:GetChildren()) do
		if child:IsA("Highlight") and not table.find(self:_allHighlights(), child) then
			child.Adornee = nil
			child:Destroy()
		end
	end
end

function ESPIndicator:_cleanupOrphanedArrows()
	for _, child in ipairs(self.ScreenGui:GetChildren()) do
		if child:IsA("ImageLabel") and child.Name:match("^Arrow_") and not table.find(self:_allArrows(), child) then
			child:Destroy()
		end
	end
end

function ESPIndicator:_cleanupOrphanedLabels()
	for _, child in ipairs(self.ScreenGui:GetChildren()) do
		if child:IsA("BillboardGui") and child.Name:match("^Label_") and not table.find(self:_allLabels(), child) then
			child.Adornee = nil
			child:Destroy()
		end
	end
end

function ESPIndicator:_update()
	local camera = Workspace.CurrentCamera
	if not camera then
		return
	end

	local viewportSize = camera.ViewportSize
	local width = viewportSize.X
	local height = viewportSize.Y

	for target, indicator in pairs(self.Indicators) do
		if not target or not target.Parent then
			self:Remove(target)
			continue
		end

		local arrow = indicator.Arrow
		local scaler = indicator.Scaler
		if not arrow then
			continue
		end

		local position = targetPosition(target)
		if not position then
			continue
		end

		local viewportPoint, onScreen = camera:WorldToViewportPoint(position)
		local distance = (camera.CFrame.Position - position).Magnitude
		local minDistance = indicator.Options.ArrowMinDistance or self.Settings.ArrowMinDistance
		local edgePadding = indicator.Options.ArrowEdgePadding or self.Settings.ArrowEdgePadding

		if onScreen and distance > minDistance then
			TweenService:Create(scaler, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Scale = 0
			}):Play()
		else
			TweenService:Create(scaler, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()

			local clampedX = math.clamp(viewportPoint.X, edgePadding, width - edgePadding)
			local clampedY = math.clamp(viewportPoint.Y, edgePadding, height - edgePadding)

			if clampedX == viewportPoint.X and clampedY == viewportPoint.Y and onScreen then
				TweenService:Create(scaler, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Scale = 0
				}):Play()
			else
				local objectSpace = camera.CFrame:VectorToObjectSpace(position - camera.CFrame.Position)
				local direction = Vector2.new(objectSpace.X, objectSpace.Y).Unit
				local usableWidth = width - edgePadding * 2
				local usableHeight = height - edgePadding * 2
				local borderVector

				if math.abs(direction.Y) > usableHeight / 2 then
					borderVector = direction * math.abs((usableHeight / 2) / direction.Y)
				else
					borderVector = direction * math.abs((usableWidth / 2) / direction.X)
				end

				local x = width / 2 + borderVector.X
				local y = height / 2 - borderVector.Y
				local rotation = math.atan2(direction.X, direction.Y)

				TweenService:Create(arrow, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Position = UDim2.fromOffset(x, y),
					Rotation = math.deg(rotation)
				}):Play()
			end

			if indicator.DistanceLabel then
				indicator.DistanceLabel.Text = string.format("%dm", math.round(distance))
				local arrowSize = (indicator.Options.ArrowSize and indicator.Options.ArrowSize.Y.Offset or self.Settings.ArrowSize.Y.Offset) + 16
				indicator.DistanceLabel.Position = UDim2.new(0.5, 0, 0, arrowSize)
			end
		end
	end
end

function ESPIndicator:Destroy()
	if self._updateConn then
		self._updateConn:Disconnect()
	end

	if self._cleanupConn then
		self._cleanupConn:Disconnect()
	end

	self:ClearAllGroups()

	for _, indicator in pairs(self.Indicators) do
		if indicator.Highlight then
			indicator.Highlight:Destroy()
		end
		if indicator.Arrow then
			indicator.Arrow:Destroy()
		end
		if indicator.Label then
			indicator.Label:Destroy()
		end
	end

	self.ScreenGui:Destroy()
	self.Indicators = {}
	ESPIndicator.Groups = {}
	ESPIndicator.TargetIndex = {}
end

local espcontainer = ESPIndicator.new({
	ArrowEdgePadding = 50,
	ArrowShowDistanceText = false
})

local playerESP = false
local sheriffAimbot = false
local coinAutoCollect = false
local autoShooting = false
local shootOffset = 2.8
local offsetToPingMult = 1
local predictionAIEngine = false
local predictionOngoing = false
local predictionCooldown = false
local gunDropESP = false
local trapDetection = false
local autoGetDroppedGun = false
local simulateKnifeThrow = false
local spawnAtPlayer = false
local loopThrow = false
local hideMeEsp = false
local ignoreknifethrow = false
local instakillshoot = false
local playerData = {}
local claimedCoins = {}
local playerToExamineIsSpamJumping = false
local onTesting = game.GameId == 119460199

local function findMurderer()
	for _, player in ipairs(Players:GetPlayers()) do
		if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife") then
			return player
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Knife") then
			return player
		end
	end

	for playerName, data in pairs(playerData or {}) do
		if data.Role == "Murderer" then
			local player = Players:FindFirstChild(playerName)
			if player then
				return player
			end
		end
	end

	return nil
end

local function findSheriff()
	for _, player in ipairs(Players:GetPlayers()) do
		if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Gun") then
			return player
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Gun") then
			return player
		end
	end

	for playerName, data in pairs(playerData or {}) do
		if data.Role == "Sheriff" then
			local player = Players:FindFirstChild(playerName)
			if player then
				return player
			end
		end
	end

	return nil
end

local function findSheriffThatsNotMe()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Gun") then
			return player
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Gun") then
			return player
		end
	end

	for playerName, data in pairs(playerData or {}) do
		if data.Role == "Sheriff" then
			local player = Players:FindFirstChild(playerName)
			if player and player ~= LocalPlayer then
				return player
			end
		end
	end

	return nil
end

local function getMap()
	for _, object in ipairs(Workspace:GetChildren()) do
		if object:FindFirstChild("CoinContainer") and object:FindFirstChild("Spawns") then
			return object
		end
	end

	return nil
end

local function reloadESP()
	if not playerESP then
		return
	end

	espcontainer:RemoveGroup("players")

	for _, player in ipairs(Players:GetPlayers()) do
		if player == LocalPlayer and hideMeEsp then
			continue
		end

		if player.Character then
			local character = player.Character

			task.spawn(function()
				if player == findMurderer() then
					espcontainer:Add(character, {
						AccentColor = Color3.new(1, 0, 0.0156863),
						ArrowShow = true,
						ArrowMinDistance = 999999,
						ArrowSize = UDim2.new(0, 40, 0, 40),
						LabelText = "Murderer",
						ShowLabel = true,
						GroupName = "players"
					})
				elseif player == findSheriff() then
					espcontainer:Add(character, {
						AccentColor = Color3.new(0, 0.6, 1),
						ArrowShow = false,
						ShowLabel = false,
						GroupName = "players"
					})
				else
					espcontainer:Add(character, {
						AccentColor = Color3.new(0, 1, 0.0313725),
						ArrowShow = false,
						ShowLabel = false,
						GroupName = "players"
					})
				end
			end)
		end
	end
end

if not ReplicatedStorage:WaitForChild("Remotes", 5) then
	fu.dialog("Not MM2", "Looks like this game isn't MM2. Do you want to load the module anyway?", {
		"Load",
		"No"
	})

	if fu.waitfordialog() == "No" then
		fu.closedialog()
		fu.notification("MM2 will not be loaded until you rejoin.", Color3.fromRGB(255, 0, 0), "x")
		return
	end

	fu.closedialog()
else
	ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("PlayerDataChanged", 5).OnClientEvent:Connect(function(data)
		playerData = data

		if playerESP then
			reloadESP()
		end
	end)
end

local function findNearestPlayer()
	local nearestPlayer = nil
	local shortestDistance = math.huge
	local localCharacter = LocalPlayer.Character
	local localRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

	if not localRootPart then
		return nil
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local otherRootPart = player.Character:FindFirstChild("HumanoidRootPart")
			if otherRootPart then
				local distance = (localRootPart.Position - otherRootPart.Position).Magnitude
				if distance < shortestDistance then
					shortestDistance = distance
					nearestPlayer = player
				end
			end
		end
	end

	return nearestPlayer
end

local function miniFling(playerToFling)
	if not playerToFling or not playerToFling.Character then
		fu.notification("No valid character of said target player. May have died.")
		return
	end

	local playersService = game:GetService("Players")
	local localPlayer = playersService.LocalPlayer
	local flingActive = false

	getgenv().FPDH = getgenv().FPDH or Workspace.FallenPartsDestroyHeight

	local function runFling(targetPlayer)
		local localCharacter = localPlayer.Character
		local localHumanoid = localCharacter and localCharacter:FindFirstChildOfClass("Humanoid")
		local localRootPart = localHumanoid and localHumanoid.RootPart
		local targetCharacter = targetPlayer.Character

		if not targetCharacter then
			fu.notification("No valid character of said target player. May have died.")
			return
		end

		local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
		local targetRootPart = targetHumanoid and targetHumanoid.RootPart
		local targetHead = targetCharacter:FindFirstChild("Head")
		local targetAccessory = targetCharacter:FindFirstChildOfClass("Accessory")
		local targetHandle = targetAccessory and targetAccessory:FindFirstChild("Handle")

		if not localCharacter or not localHumanoid or not localRootPart then
			fu.notification("No valid character of said target player. May have died.")
			return
		end

		if localRootPart.Velocity.Magnitude < 50 then
			getgenv().OldPos = localRootPart.CFrame
		end

		if targetHead and targetHead.Velocity.Magnitude > 500 then
			fu.dialog("Player flung", "Player is already flung. Fling again?", {
				"Fling again",
				"No"
			})
			if fu.waitfordialog() == "No" then
				return fu.closedialog()
			end
			fu.closedialog()
		elseif not targetHead and targetHandle and targetHandle.Velocity.Magnitude > 500 then
			fu.dialog("Player flung", "Player is already flung. Fling again?", {
				"Fling again",
				"No"
			})
			if fu.waitfordialog() == "No" then
				return fu.closedialog()
			end
			fu.closedialog()
		end

		if targetHead then
			Workspace.CurrentCamera.CameraSubject = targetHead
		elseif targetHandle then
			Workspace.CurrentCamera.CameraSubject = targetHandle
		elseif targetHumanoid and targetRootPart then
			Workspace.CurrentCamera.CameraSubject = targetHumanoid
		end

		if not targetCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local function setFlingPosition(part, offset, angle)
			localRootPart.CFrame = CFrame.new(part.Position) * offset * angle
			localCharacter:SetPrimaryPartCFrame(CFrame.new(part.Position) * offset * angle)
			localRootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
			localRootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
		end

		local function flingPart(part)
			local timeout = 2
			local start = tick()
			local angle = 0

			repeat
				if localRootPart and targetHumanoid then
					if part.Velocity.Magnitude < 50 then
						angle += 100
						setFlingPosition(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(2.25, 1.5, -2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(-2.25, -1.5, 2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
						task.wait()
					else
						setFlingPosition(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, -targetHumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, 1.5, targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, -targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, 1.5, targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
						task.wait()
						setFlingPosition(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
					end
				else
					break
				end
			until part.Velocity.Magnitude > 500
				or part.Parent ~= targetPlayer.Character
				or targetPlayer.Parent ~= playersService
				or targetPlayer.Character ~= targetCharacter
				or targetHumanoid.Sit
				or localHumanoid.Health <= 0
				or tick() > start + timeout
		end

		Workspace.FallenPartsDestroyHeight = 0 / 0

		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Name = "EpixVel"
		bodyVelocity.Parent = localRootPart
		bodyVelocity.Velocity = Vector3.new(9e8, 9e8, 9e8)
		bodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

		localHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

		if targetRootPart and targetHead then
			if (targetRootPart.CFrame.p - targetHead.CFrame.p).Magnitude > 5 then
				flingPart(targetHead)
			else
				flingPart(targetRootPart)
			end
		elseif targetRootPart then
			flingPart(targetRootPart)
		elseif targetHead then
			flingPart(targetHead)
		elseif targetHandle then
			flingPart(targetHandle)
		else
			fu.notification("Can't find a proper part of target player to fling.")
		end

		bodyVelocity:Destroy()
		localHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		Workspace.CurrentCamera.CameraSubject = localHumanoid

		repeat
			localRootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
			localCharacter:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
			localHumanoid:ChangeState("GettingUp")

			table.foreach(localCharacter:GetChildren(), function(_, child)
				if child:IsA("BasePart") then
					child.Velocity = Vector3.new()
					child.RotVelocity = Vector3.new()
				end
			end)

			task.wait()
		until (localRootPart.Position - getgenv().OldPos.p).Magnitude < 25

		Workspace.FallenPartsDestroyHeight = getgenv().FPDH
	end

	runFling(playerToFling)
end

Workspace.ChildAdded:Connect(function(child)
	if child == getMap() and playerESP then
		fu.notification("Map has loaded, waiting for roles...")

		repeat
			task.wait(1)
		until findMurderer()

		fu.notification("Player ESP reloaded.")
		reloadESP()
	end
end)

Workspace.ChildRemoved:Connect(function(child)
	if playerESP and child:FindFirstChild("CoinContainer") and child:FindFirstChild("Spawns") then
		fu.notification("Game ended, removing Player ESPs.")
		playerData = {}
		espcontainer:ClearAllGroups()
	end
end)

Workspace.DescendantAdded:Connect(function(child)
	if trapDetection and child.Name == "Trap" and (child.Parent:IsA("Folder") or child.Parent:IsA("Model")) then
		child.Transparency = 0
		espcontainer:Add(child, {
			AccentColor = Color3.new(1, 0, 0.0156863),
			ArrowShow = false,
			ShowLabel = true,
			LabelText = "Trap",
			GroupName = "trap"
		})

		fu.notification("Murderer has placed a trap!")
	end

	if gunDropESP and child.Name == "GunDrop" then
		espcontainer:Add(child, {
			AccentColor = Color3.new(0.952941, 1, 0.0745098),
			ArrowShow = true,
			ArrowMinDistance = 999999,
			ArrowSize = UDim2.new(0, 40, 0, 40),
			LabelText = "Dropped gun!",
			ShowLabel = true,
			GroupName = "gun"
		})

		fu.notification("Gun has been dropped! Find a yellow highlight.")

		if autoGetDroppedGun then
			fu.notification("Auto get dropped gun - Cooling down...")
			task.wait(1)

			local map = getMap()
			if not map or not map:FindFirstChild("GunDrop") then
				fu.notification("No dropped gun to be teleported to.")
				return
			end

			local previousPosition = LocalPlayer.Character:GetPivot()
			LocalPlayer.Character:MoveTo(map:FindFirstChild("GunDrop").Position)
			LocalPlayer.Backpack.ChildAdded:Wait()
			LocalPlayer.Character:PivotTo(previousPosition)
		end
	end
end)

Workspace.DescendantRemoving:Connect(function(child)
	if gunDropESP and child.Name == "GunDrop" then
		espcontainer:RemoveGroup("gun")
		fu.notification("Someone has took the dropped gun.")
		task.wait(1)

		local sheriff = findSheriff()
		if sheriff then
			fu.notification("The hero is " .. sheriff.DisplayName .. ".")
		end

		reloadESP()
	end
end)

local function getClosestModelToPlayer(player, models)
	local closestModel = nil
	local closestDistance = math.huge
	local character = player.Character
	local rootPart = character and character:FindFirstChild("HumanoidRootPart")

	if not rootPart then
		return nil
	end

	for _, model in ipairs(models) do
		local modelPosition = model:GetPivot().Position
		local distance = (modelPosition - rootPart.Position).Magnitude
		if distance < closestDistance then
			closestDistance = distance
			closestModel = model
		end
	end

	local returningResult = {
		closestModel,
		closestDistance
	}

	setmetatable(returningResult, {
		__tostring = function()
			return tostring(closestModel)
		end,
		__index = function(_, key)
			return closestModel and closestModel[key]
		end
	})

	return returningResult
end

task.spawn(function()
	while task.wait(0.1) do
		if not coinAutoCollect then
			continue
		end

		local map = getMap()
		local character = LocalPlayer.Character
		local rootPart = character and character:FindFirstChild("HumanoidRootPart")

		if map and rootPart and map:FindFirstChild("CoinContainer") and #map:FindFirstChild("CoinContainer"):GetChildren() > 1 then
			local closestCoin = getClosestModelToPlayer(LocalPlayer, map:FindFirstChild("CoinContainer"):GetChildren())
			if closestCoin and closestCoin[1] then
				local distance = (rootPart.Position - closestCoin:GetPivot().Position).Magnitude
				local toClosestCoin = TweenService:Create(rootPart, TweenInfo.new(distance * 0.05, Enum.EasingStyle.Linear), {
					CFrame = closestCoin:GetPivot()
				})
				toClosestCoin:Play()
				toClosestCoin.Completed:Wait()
				task.wait(0.1)
				closestCoin:Destroy()
				claimedCoins[closestCoin] = true
			end
		end
	end
end)

local function getPredictedPosition(player, selectedShootOffset)
	local usingBasicPred = not predictionAIEngine
	if predictionOngoing then
		fu.notification("Cancelling AI prediction, using basic prediction.")
		usingBasicPred = true
	end

	local originalPlayer = player
	if typeof(player) == "Instance" and player:IsA("Player") then
		if not player.Character then
			fu.notification("No murderer to predict position.")
			return Vector3.new(0, 0, 0), "No murderer to predict position."
		end

		player = player.Character
	end

	local playerHRP = player:FindFirstChild("UpperTorso") or player:FindFirstChild("HumanoidRootPart")
	local playerHumanoid = player:FindFirstChild("Humanoid")
	if not playerHRP or not playerHumanoid then
		return Vector3.new(0, 0, 0), "Could not find the player's HumanoidRootPart."
	end

	local playerPosition = playerHRP.Position
	local predictionFunction = getgenv().YARHMNetwork_predictPos or (getgenv().YARHMNetwork and getgenv().YARHMNetwork.predictPos)

	if predictionAIEngine and not usingBasicPred and not predictionCooldown and predictionFunction then
		local localTorso = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("UpperTorso") or LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
		if localTorso and (playerPosition - localTorso.Position).Magnitude > 20 then
			fu.notification("Calculating trajectory...")
			predictionCooldown = true
			predictionOngoing = true

			local predictedPosition = predictionFunction(originalPlayer)
			predictionOngoing = false

			task.spawn(function()
				task.wait(5)
				predictionCooldown = false
			end)

			return predictedPosition
		else
			fu.notification("Murderer is too close for trajectory prediction. Reverting to basic prediction.")
		end
	elseif predictionAIEngine and not predictionFunction then
		fu.notification("YARHM AI Engine is not available. Reverting to basic prediction.")
	end

	local velocity = playerHRP.AssemblyLinearVelocity
	local playerMoveDirection = playerHumanoid.MoveDirection
	local predictedPosition = playerHRP.Position + ((velocity * Vector3.new(0.75, 0.5, 0.75))) * (selectedShootOffset / 15) + playerMoveDirection * selectedShootOffset
	predictedPosition = predictedPosition * (((LocalPlayer:GetNetworkPing() * 1000) * ((offsetToPingMult - 1) * 0.01)) + 1)

	return predictedPosition
end

task.spawn(function()
	while task.wait(1) do
		if findSheriff() == LocalPlayer and autoShooting then
			fu.notification("Auto-shooting started.")
			repeat
				task.wait(0.1)

				local murderer = findMurderer()
				if not murderer then
					fu.notification("No murderer.")
					continue
				end

				local murdererPosition = murderer.Character.HumanoidRootPart.Position
				local characterRootPart = LocalPlayer.Character.HumanoidRootPart
				local rayDirection = murdererPosition - characterRootPart.Position

				local raycastParams = RaycastParams.new()
				raycastParams.FilterType = Enum.RaycastFilterType.Exclude
				raycastParams.FilterDescendantsInstances = {
					LocalPlayer.Character
				}

				local hit = Workspace:Raycast(characterRootPart.Position, rayDirection, raycastParams)
				if not hit or hit.Instance.Parent == murderer.Character then
					fu.notification("Auto-shooting!")

					if not LocalPlayer.Character:FindFirstChild("Gun") then
						if LocalPlayer.Backpack:FindFirstChild("Gun") then
							LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(LocalPlayer.Backpack:FindFirstChild("Gun"))
						else
							fu.notification("You don't have the gun..?")
							return
						end
					end

					local murdererHRP = murderer.Character:FindFirstChild("HumanoidRootPart")
					if not murdererHRP then
						fu.notification("Could not find the murderer's HumanoidRootPart.")
						return
					end

					local predictedPosition = getPredictedPosition(murderer, shootOffset)
					local args = {
						[1] = 1,
						[2] = predictedPosition,
						[3] = "AH2"
					}

					LocalPlayer.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(unpack(args))
				end
			until findSheriff() ~= LocalPlayer or not autoShooting
		end
	end
end)

local function setPlayerESP(state)
	playerESP = state

	if not state then
		espcontainer:RemoveGroup("players")
		return
	end

	if not findMurderer() or not findSheriff() then
		fu.notification("No roles yet. Waiting for roles...")
		repeat
			task.wait(1)
		until not playerESP or findSheriff() or findMurderer()
	end

	if playerESP then
		reloadESP()
	end
end

local function setDroppedGunESP(state)
	gunDropESP = state

	if not state then
		espcontainer:RemoveGroup("gun")
		return
	end

	local map = getMap()
	if not map then
		return
	end

	local gunDrop = map:FindFirstChild("GunDrop")
	if gunDrop then
		espcontainer:Add(gunDrop, {
			AccentColor = Color3.new(0.952941, 1, 0.0745098),
			ArrowShow = true,
			ArrowMinDistance = 999999,
			ArrowSize = UDim2.new(0, 40, 0, 40),
			LabelText = "Dropped gun!",
			ShowLabel = true,
			GroupName = "gun"
		})
		fu.notification("Gun has been dropped! Find a yellow highlight.")
	end
end

local function setTrapESP(state)
	trapDetection = state

	if not state then
		espcontainer:RemoveGroup("trap")
		return
	end

	for _, descendant in ipairs(Workspace:GetDescendants()) do
		if descendant.Name == "Trap" and (descendant.Parent:IsA("Folder") or descendant.Parent:IsA("Model")) then
			descendant.Transparency = 0
			espcontainer:Add(descendant, {
				AccentColor = Color3.new(1, 0, 0),
				ArrowShow = false,
				ShowLabel = true,
				LabelText = "Trap",
				GroupName = "trap"
			})
		end
	end
end

local function shootMurderer()
	if findSheriff() ~= LocalPlayer then
		fu.notification("You're not sheriff/hero.")
		return
	end

	local murderer = findMurderer() or findSheriffThatsNotMe()
	if not murderer then
		fu.notification("No murderer (or sheriff) to shoot.")
		return
	end

	if not LocalPlayer.Character:FindFirstChild("Gun") then
		local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
		if LocalPlayer.Backpack:FindFirstChild("Gun") then
			humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Gun"))
		else
			fu.notification("You don't have the gun..?")
			return
		end
	end

	local murdererHRP = murderer.Character:FindFirstChild("HumanoidRootPart")
	if not murdererHRP then
		fu.notification("Could not find the murderer's HumanoidRootPart.")
		return
	end

	local predictedPosition = getPredictedPosition(murderer, shootOffset)
	local args

	if instakillshoot then
		args = {
			CFrame.new(murdererHRP.Position + Vector3.new(0, 1, 0)),
			CFrame.new(murdererHRP.Position)
		}
	else
		args = {
			CFrame.new(LocalPlayer.Character.RightHand.Position),
			CFrame.new(predictedPosition)
		}
	end

	LocalPlayer.Character:WaitForChild("Gun"):WaitForChild("Shoot"):FireServer(unpack(args))
end

local function knifeThrow(silent)
	if findMurderer() ~= LocalPlayer then
		if silent then
			return
		end

		fu.notification("You're not murderer.")
		return
	end

	if not LocalPlayer.Character:FindFirstChild("Knife") then
		local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
		if LocalPlayer.Backpack:FindFirstChild("Knife") then
			humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
		else
			if silent then
				return
			end

			fu.notification("You don't have the knife..?")
			return
		end
	end

	local nearestPlayer = findNearestPlayer()
	if not nearestPlayer or not nearestPlayer.Character then
		if silent then
			return
		end

		fu.notification("Can't find a player!?")
		return
	end

	local nearestHRP = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not nearestHRP then
		if silent then
			return
		end

		fu.notification("Can't find the player's pivot.")
		return
	end

	local argsThrowRemote = {
		CFrame.new(LocalPlayer.Character.RightHand.Position),
		CFrame.new(getPredictedPosition(nearestPlayer, shootOffset + 1))
	}

	if spawnAtPlayer then
		argsThrowRemote[1] = CFrame.new(nearestHRP.Position + (nearestHRP.CFrame.LookVector * 5))
	end

	LocalPlayer.Character:WaitForChild("Knife"):WaitForChild("Events"):WaitForChild("KnifeThrown"):FireServer(unpack(argsThrowRemote))
end

task.spawn(function()
	while task.wait(1.5) do
		if loopThrow then
			knifeThrow(true)
		end
	end
end)

local function delayedShootMurderer()
	if findSheriff() ~= LocalPlayer then
		fu.notification("You're not sheriff/hero.")
		return
	end

	local murderer = findMurderer() or findSheriffThatsNotMe()
	if not murderer then
		fu.notification("No murderer (or sheriff) to shoot.")
		return
	end

	if not LocalPlayer.Character:FindFirstChild("Gun") then
		local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
		if LocalPlayer.Backpack:FindFirstChild("Gun") then
			humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Gun"))
		else
			fu.notification("You don't have the gun..?")
			return
		end
	end

	local murdererHRP = murderer.Character:FindFirstChild("HumanoidRootPart")
	if not murdererHRP then
		fu.notification("Could not find the murderer's HumanoidRootPart.")
		return
	end

	fu.notification("Waiting for murderer to be in view...")

	RunService.Stepped:Connect(function()
		local origin = LocalPlayer.Character.HumanoidRootPart.Position
		local direction = (Vector3.new(murdererHRP.Position.X, origin.Y, murdererHRP.Position.Z) - origin).Unit * 1000
		local params = RaycastParams.new()
		local raycastResult = Workspace:Raycast(origin, direction, params)

		if raycastResult and raycastResult.Instance == murdererHRP then
			local predictedPosition = getPredictedPosition(murderer, shootOffset)
			local args = {
				[1] = 1,
				[2] = predictedPosition,
				[3] = "AH2"
			}

			LocalPlayer.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(unpack(args))
		end
	end)
end

local function setShootOffsetFromInput(text)
	if not tonumber(text) then
		fu.notification("Not a valid number.")
		return
	end

	local value = tonumber(text)
	if value > 5 then
		fu.notification("An offset with a multiplier of 5 might not at all shoot the murderer!")
	end

	if value < 0 then
		fu.notification("An offset with a negative multiplier will make a shot BEHIND the murderer's walk direction.")
	end

	shootOffset = value
	fu.notification("Offset has been set.")
end

local function setPingMultiplierFromInput(text)
	if not tonumber(text) then
		fu.notification("Not a valid number.")
		return
	end

	local value = tonumber(text)
	if value > 5 then
		fu.notification("An offset with a multiplier of 5 might not at all shoot the murderer!")
	end

	if value < 0 then
		fu.notification("An offset with a negative multiplier will make a shot BEHIND the murderer's walk direction.")
	end

	offsetToPingMult = value
	fu.notification("Offset has been set.")
end

local function secondsToMinutes(seconds)
	if seconds == -1 or seconds == nil then
		return ""
	end

	local minutes = math.floor(seconds / 60)
	local remainingSeconds = seconds % 60
	return string.format("%dm %ds", minutes, remainingSeconds)
end

local timertask = nil
local timertext = nil

local function setRoundTimer(state)
	if state then
		if timertext then
			timertext:Destroy()
		end

		timertext = Instance.new("TextLabel")
		timertext.Name = "LiquidHub_RoundTimer"
		timertext.Parent = getGuiParent()
		timertext.BackgroundTransparency = 1
		timertext.TextColor3 = Color3.fromRGB(255, 255, 255)
		timertext.TextScaled = true
		timertext.AnchorPoint = Vector2.new(0.5, 0.5)
		timertext.Position = UDim2.fromScale(0.5, 0.15)
		timertext.Size = UDim2.fromOffset(200, 35)
		timertext.Font = Enum.Font.Montserrat

		timertask = task.spawn(function()
			while task.wait(0.5) do
				local timerPart = Workspace:FindFirstChild("RoundTimerPart")
				local timeLeft = timerPart and timerPart:GetAttribute("Time") or -1
				timertext.Text = secondsToMinutes(timeLeft)
			end
		end)
	else
		if timertext then
			timertext:Destroy()
			timertext = nil
		end

		if timertask then
			task.cancel(timertask)
			timertask = nil
		end
	end
end

local function sendRolesToChat()
	local textChannels = TextChatService:WaitForChild("TextChannels"):GetChildren()
	for _, textChannel in ipairs(textChannels) do
		if textChannel.Name == "RBXSystem" then
			continue
		end

		local murderer = findMurderer()
		local sheriff = findSheriff()
		local murdererName = murderer and murderer.Name or "-"
		local sheriffName = sheriff and sheriff.Name or "-"

		local message = string.format([[Murderer: %s |
Sheriff: %s ]], murdererName, sheriffName)

		textChannel:SendAsync(message)
	end
end

local function teleportToLobby()
	local lobby = Workspace:FindFirstChild("Lobby")
	if lobby and lobby:FindFirstChild("Spawns") then
		local spawnLocation = lobby.Spawns:FindFirstChildWhichIsA("SpawnLocation")
		if spawnLocation then
			LocalPlayer.Character:MoveTo(spawnLocation.Position)
		end
	end
end

local function teleportToMap()
	local map = getMap()
	if not map then
		fu.notification("No map to teleport to.")
		return
	end

	local spawnsFolder = map:FindFirstChild("Spawns")
	if spawnsFolder then
		local spawns = spawnsFolder:GetChildren()
		local randomSpawn = spawns[math.random(1, #spawns)]
		LocalPlayer.Character:MoveTo(randomSpawn.Position)
	else
		fu.notification("No map to teleport to.")
	end
end

local function flingSheriff()
	if not findSheriff() then
		fu.notification("No sheriff/hero to fling.")
		return
	end

	miniFling(findSheriff())
end

local function flingMurderer()
	if not findMurderer() then
		fu.notification("No murderer to fling.")
		return
	end

	miniFling(findMurderer())
end

local function copyMurdererUsername()
	if not findMurderer() then
		fu.notification("No murderer to copy.")
		return
	end

	if setclipboard then
		setclipboard(findMurderer().Name)
	end

	fu.notification("Copied to clipboard.")
end

local function copySheriffUsername()
	if not findSheriff() then
		fu.notification("No sheriff/hero to copy.")
		return
	end

	if setclipboard then
		setclipboard(findSheriff().Name)
	end

	fu.notification("Copied to clipboard.")
end

local function teleportToDroppedGun()
	local map = getMap()
	if not map or not map:FindFirstChild("GunDrop") then
		fu.notification("No dropped gun to be teleported to.")
		return
	end

	local previousPosition = LocalPlayer.Character:GetPivot()
	LocalPlayer.Character:PivotTo(map:FindFirstChild("GunDrop"):GetPivot())
	LocalPlayer.Backpack.ChildAdded:Wait()
	LocalPlayer.Character:PivotTo(previousPosition)
end

Workspace.ChildAdded:Connect(function(child)
	if child.Name == "ThrowingKnife" and ignoreknifethrow then
		child:Destroy()
	end
end)

local function godMode()
	local camera = Workspace.CurrentCamera
	local position = camera.CFrame
	local character = LocalPlayer.Character
	local humanoid = character and character.FindFirstChildWhichIsA(character, "Humanoid")

	if not character or not humanoid then
		fu.notification("No character!")
		return
	end

	local newHumanoid = humanoid.Clone(humanoid)
	newHumanoid.Parent = character
	LocalPlayer.Character = nil
	newHumanoid.SetStateEnabled(newHumanoid, 15, false)
	newHumanoid.SetStateEnabled(newHumanoid, 1, false)
	newHumanoid.SetStateEnabled(newHumanoid, 0, false)
	newHumanoid.BreakJointsOnDeath = true
	humanoid.Destroy(humanoid)
	LocalPlayer.Character = character
	camera.CameraSubject = newHumanoid
	camera.CFrame = wait() and position
	newHumanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

	local animateScript = character.FindFirstChild(character, "Animate")
	if animateScript then
		animateScript.Disabled = true
		wait()
		animateScript.Disabled = false
	end

	newHumanoid.Health = newHumanoid.MaxHealth
end

local function killClosestPlayerAsMurderer()
	if findMurderer() ~= LocalPlayer then
		fu.notification("You're not murderer.")
		return
	end

	if not LocalPlayer.Character:FindFirstChild("Knife") then
		if LocalPlayer.Backpack:FindFirstChild("Knife") then
			LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
		else
			fu.notification("You don't have the knife..?")
			return
		end
	end

	local nearestPlayer = findNearestPlayer()
	if not nearestPlayer or not nearestPlayer.Character then
		fu.notification("Can't find a player!?")
		return
	end

	local nearestHRP = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not nearestHRP then
		fu.notification("Can't find the player's pivot.")
		return
	end

	if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		fu.notification("You're not a valid character.")
		return
	end

	if not simulateKnifeThrow then
		nearestHRP.Anchored = true
		nearestHRP.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame + LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 2
		task.wait(0.1)

		local args = {
			[1] = "Slash"
		}

		LocalPlayer.Character.Knife.Stab:FireServer(unpack(args))
		return
	end

	local localKnife = LocalPlayer.Character:FindFirstChild("Knife")
	if not localKnife then
		return
	end

	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = {
		LocalPlayer.Character
	}

	local rayResult = Workspace:Raycast(localKnife:GetPivot().Position, (nearestHRP.Position - LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Unit * 350, raycastParams)
	local toThrow = nearestHRP.Position
	local args = {
		[1] = localKnife:GetPivot(),
		[2] = toThrow
	}

	LocalPlayer.Character.Knife.Throw:FireServer(unpack(args))
end

local killAuraCon = nil

local function setMurdererKillAura(state)
	if state then
		if killAuraCon then
			killAuraCon:Disconnect()
		end

		killAuraCon = RunService.Heartbeat:Connect(function()
			local localCharacter = LocalPlayer.Character
			local localRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
			if not localRootPart or not localCharacter:FindFirstChild("Knife") then
				return
			end

			for _, player in ipairs(Players:GetPlayers()) do
				if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
					local hrp = player.Character:FindFirstChild("HumanoidRootPart")
					if (hrp.Position - localRootPart.Position).Magnitude < 7 then
						hrp.Anchored = true
						hrp.CFrame = localRootPart.CFrame + localRootPart.CFrame.LookVector * 2
						task.wait(0.1)

						local args = {
							[1] = "Slash"
						}

						LocalPlayer.Character.Knife.Stab:FireServer(unpack(args))
						return
					end
				end
			end
		end)
	else
		if killAuraCon then
			killAuraCon:Disconnect()
			killAuraCon = nil
		end
	end
end

local function killEveryoneAsMurderer()
	if findMurderer() ~= LocalPlayer then
		fu.notification("You're not murderer.")
		return
	end

	if not LocalPlayer.Character:FindFirstChild("Knife") then
		if LocalPlayer.Backpack:FindFirstChild("Knife") then
			LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
		else
			fu.notification("You don't have the knife..?")
			return
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
			player.Character:FindFirstChild("HumanoidRootPart").Anchored = true
			player.Character:FindFirstChild("HumanoidRootPart").CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame + LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
		end
	end

	local args = {
		[1] = "Slash"
	}

	LocalPlayer.Character.Knife.Stab:FireServer(unpack(args))
end

local function holdEveryoneHostage()
	if findMurderer() ~= LocalPlayer then
		fu.notification("You're not murderer. This'll only be useful if you're the murderer.")
		return
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
			player.Character:FindFirstChild("HumanoidRootPart").Anchored = true
			player.Character:FindFirstChild("HumanoidRootPart").CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame + LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 5
		end
	end

	fu.notification("Placed every single player in a single point. Kill everyone at once once you decide to.")
end

local Tabs = {
	Info = Window:Tab({
		Title = "Dashboard",
		Icon = "info",
		ShowTabTitle = true,
	}),
	Main = Window:Tab({
		Title = "Main",
		Icon = "house",
		ShowTabTitle = true,
	}),
	ESP = Window:Tab({
		Title = "ESP",
		Icon = "eye",
		ShowTabTitle = true,
	}),
	Sheriff = Window:Tab({
		Title = "Sheriff",
		Icon = "crosshair"
	}),
	Murderer = Window:Tab({
		Title = "Murderer",
		Icon = "knife"
	}),
	Player = Window:Tab({
		Title = "Player",
		Icon = "user",
		ShowTabTitle = true,
	}),
	Utility = Window:Tab({
		Title = "Utility",
		Icon = "wrench",
		ShowTabTitle = true,
	}),
	Settings = Window:Tab({
		Title = "Settings",
		Icon = "settings",
		ShowTabTitle = true,
	})
}



local infostack = Tabs.Info:HStack()





local username = player.Name
local displayName = player.DisplayName
local userId = player.UserId

-- Avatar Image
local userImage = string.format(
    "https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png",
    userId
)

local userParagraph = infostack:Paragraph({
    Title = displayName, -- 🔥
    Desc = "@" .. username, -- 🔥 
    Image = userImage,
    ImageSize = 67,
    
})

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

local gameParagraph = infostack:Paragraph({
    Title = gameName, -- 🔥 Game Name sa Title
    Desc = "@" .. creatorName, -- 🔥 Creator username
    Image = gameImage,
    ImageSize = 70,
    Locked = false,
})

Tabs.Main:Divider()
local statusSection = Tabs.Main:Section({
	Title = "Status",
	Opened = true
})

local statusParagraph = statusSection:Paragraph({
	Title = "Status",
	Desc = "Loading status..."
})

local function updateStatus()
	local murderer = findMurderer()
	local sheriff = findSheriff()
	local map = getMap()

	local role = "Innocent"
	if murderer == LocalPlayer then
		role = "Murderer"
	elseif sheriff == LocalPlayer then
		role = "Sheriff/Hero"
	end

	statusParagraph:SetDesc(string.format(
		"State: Loaded\nRole: %s\nMurderer: %s\nSheriff/Hero: %s\nMap: %s\nPing: %d ms",
		role,
		murderer and murderer.Name or "-",
		sheriff and sheriff.Name or "-",
		map and map.Name or "-",
		math.round(LocalPlayer:GetNetworkPing() * 1000)
	))
end

task.spawn(function()
	while task.wait(2) do
		pcall(updateStatus)
	end
end)

local playerEspSection = Tabs.ESP:Section({
	Title = "Player ESP",
	Opened = true
})

playerEspSection:Toggle({
	Title = "Player ESP",
	Desc = "Highlights murderer, sheriff, and players.",
	Icon = "users",
	Type = "Checkbox",
	Value = false,
	Flag = "PlayerESP",
	Callback = setPlayerESP
})

playerEspSection:Toggle({
	Title = "Hide Own ESP",
	Desc = "Removes your own character from Player ESP.",
	Icon = "eye-off",
	Type = "Checkbox",
	Value = false,
	Flag = "HideOwnESP",
	Callback = function(state)
		hideMeEsp = state
		reloadESP()
	end
})

local worldEspSection = Tabs.ESP:Section({
	Title = "World ESP",
	Opened = true
})

worldEspSection:Toggle({
	Title = "Dropped Gun ESP",
	Desc = "Highlights dropped gun with a yellow marker.",
	Icon = "badge-alert",
	Type = "Checkbox",
	Value = false,
	Flag = "DroppedGunESP",
	Callback = setDroppedGunESP
})

worldEspSection:Toggle({
	Title = "Trap ESP",
	Desc = "Highlights murderer traps.",
	Icon = "triangle-alert",
	Type = "Checkbox",
	Value = false,
	Flag = "TrapESP",
	Callback = setTrapESP
})

local timerSection = Tabs.ESP:Section({
	Title = "Round Timer",
	Opened = true
})

timerSection:Toggle({
	Title = "Round Timer",
	Desc = "Shows the current MM2 round timer on screen.",
	Icon = "clock",
	Type = "Checkbox",
	Value = false,
	Flag = "RoundTimer",
	Callback = setRoundTimer
})

local sheriffActionsSection = Tabs.Sheriff:Section({
	Title = "Sheriff Actions",
	Opened = true
})

sheriffActionsSection:Button({
	Title = "Shoot Murderer",
	Desc = "Shoots the murderer or non-local sheriff target.",
	Icon = "crosshair",
	Callback = shootMurderer
})

sheriffActionsSection:Button({
	Title = "Delayed Shoot Murderer",
	Desc = "Waits until the murderer is in view, then fires.",
	Icon = "timer",
	Callback = delayedShootMurderer
})

sheriffActionsSection:Toggle({
	Title = "Instakill Murderer",
	Desc = "Changes sheriff shot CFrames for instant-kill shooting.",
	Icon = "zap",
	Type = "Checkbox",
	Value = false,
	Flag = "InstakillMurderer",
	Callback = function(state)
		instakillshoot = state
	end
})

local predictionSection = Tabs.Sheriff:Section({
	Title = "Prediction",
	Opened = true
})

predictionSection:Slider({
	Title = "Shoot Position Offset",
	Desc = "Prediction offset for gun shots and knife throws.",
	Step = 0.1,
	Value = {
		Min = -5,
		Max = 10,
		Default = shootOffset
	},
	Flag = "ShootPositionOffsetSlider",
	Callback = function(value)
		shootOffset = tonumber(value) or shootOffset
	end
})

predictionSection:Input({
	Title = "Set Shoot Position Offset",
	Desc = "Exact numeric offset. Recommended is 2.8.",
	Value = tostring(shootOffset),
	Placeholder = "2.8",
	Type = "Input",
	Flag = "ShootPositionOffsetInput",
	Callback = setShootOffsetFromInput
})

predictionSection:Slider({
	Title = "Offset To Ping Multiplier",
	Desc = "Scales prediction by latency. Default is 1.",
	Step = 0.1,
	Value = {
		Min = -5,
		Max = 10,
		Default = offsetToPingMult
	},
	Flag = "OffsetToPingMultiplierSlider",
	Callback = function(value)
		offsetToPingMult = tonumber(value) or offsetToPingMult
	end
})

predictionSection:Input({
	Title = "Set Offset To Ping Multiplier",
	Desc = "Exact numeric ping multiplier.",
	Value = tostring(offsetToPingMult),
	Placeholder = "1",
	Type = "Input",
	Flag = "OffsetToPingMultiplierInput",
	Callback = setPingMultiplierFromInput
})

predictionSection:Toggle({
	Title = "Use AI Prediction Engine",
	Desc = "Uses YARHM prediction when the engine is available.",
	Icon = "brain",
	Type = "Checkbox",
	Value = false,
	Flag = "UseAIPredictionEngine",
	Callback = function(state)
		predictionAIEngine = state
	end
})

predictionSection:Paragraph({
	Title = "Prediction Notes",
	Desc = "Shoot offset re-aims gun and knife throws to predicted positions.\nOffset-to-ping multiplier dynamically adjusts prediction with latency."
})

local murdererThrowSection = Tabs.Murderer:Section({
	Title = "Knife Throw",
	Opened = true
})

murdererThrowSection:Button({
	Title = "Knife Throw Closest Player",
	Desc = "Throws the knife at the nearest player.",
	Icon = "send",
	Callback = function()
		knifeThrow(false)
	end
})

murdererThrowSection:Toggle({
	Title = "Auto Knife Throw",
	Desc = "Repeats closest-player knife throws.",
	Icon = "repeat",
	Type = "Checkbox",
	Value = false,
	Flag = "AutoKnifeThrow",
	Callback = function(state)
		loopThrow = state
	end
})

murdererThrowSection:Toggle({
	Title = "Spawn Knife Throw Near Player",
	Desc = "Starts knife throws near the nearest player.",
	Icon = "locate-fixed",
	Type = "Checkbox",
	Value = false,
	Flag = "SpawnKnifeThrowNearPlayer",
	Callback = function(state)
		spawnAtPlayer = state
	end
})

local murdererKillSection = Tabs.Murderer:Section({
	Title = "Murderer",
	Opened = true
})

murdererKillSection:Button({
	Title = "Kill Closest Player",
	Desc = "Moves the nearest player into slash range.",
	Icon = "swords",
	Callback = killClosestPlayerAsMurderer
})

murdererKillSection:Toggle({
	Title = "Murderer Kill Aura",
	Desc = "Slashes nearby players within range.",
	Icon = "activity",
	Type = "Checkbox",
	Value = false,
	Flag = "MurdererKillAura",
	Callback = setMurdererKillAura
})

murdererKillSection:Button({
	Title = "Kill Everyone",
	Desc = "Groups all players in slash range and attacks.",
	Icon = "skull",
	Callback = killEveryoneAsMurderer
})

local murdererFunSection = Tabs.Murderer:Section({
	Title = "Fun",
	Opened = true
})

murdererFunSection:Button({
	Title = "Hold Everyone Hostage",
	Desc = "Places everyone together near you.",
	Icon = "users-round",
	Callback = holdEveryoneHostage
})

local playerMovementSection = Tabs.Player:Section({
	Title = "Movement",
	Opened = true
})

playerMovementSection:Button({
	Title = "Teleport To Dropped Gun",
	Desc = "Teleports to the dropped gun and returns.",
	Icon = "badge-alert",
	Callback = teleportToDroppedGun
})

playerMovementSection:Button({
	Title = "Teleport To Lobby",
	Desc = "Moves to the lobby spawn.",
	Icon = "home",
	Callback = teleportToLobby
})

playerMovementSection:Button({
	Title = "Teleport To Map",
	Desc = "Moves to a random map spawn.",
	Icon = "map",
	Callback = teleportToMap
})

local playerDefenseSection = Tabs.Player:Section({
	Title = "Defense",
	Opened = true
})

playerDefenseSection:Toggle({
	Title = "Automatically Get Gun On Drop",
	Desc = "Automatically picks up the gun when it drops.",
	Icon = "magnet",
	Type = "Checkbox",
	Value = false,
	Flag = "AutomaticallyGetGunOnDrop",
	Callback = function(state)
		autoGetDroppedGun = state
	end
})

playerDefenseSection:Toggle({
	Title = "Ignore Knife Throws",
	Desc = "Destroys local ThrowingKnife instances.",
	Icon = "shield",
	Type = "Checkbox",
	Value = false,
	Flag = "IgnoreKnifeThrows",
	Callback = function(state)
		ignoreknifethrow = state
	end
})

playerDefenseSection:Button({
	Title = "God Mode",
	Desc = "EdgeIY-style humanoid replacement.",
	Icon = "heart-pulse",
	Callback = godMode
})

local utilityRolesSection = Tabs.Utility:Section({
	Title = "Roles",
	Opened = true
})

utilityRolesSection:Button({
	Title = "Copy Sheriff Username",
	Desc = "Copies the sheriff or hero username.",
	Icon = "copy",
	Callback = copySheriffUsername
})

utilityRolesSection:Button({
	Title = "Copy Murderer Username",
	Desc = "Copies the murderer username.",
	Icon = "copy",
	Callback = copyMurdererUsername
})

utilityRolesSection:Button({
	Title = "Send Sheriff And Murderer Names Into Chat",
	Desc = "Posts current role names to chat.",
	Icon = "message-circle",
	Callback = sendRolesToChat
})

local utilityFlingSection = Tabs.Utility:Section({
	Title = "Fling",
	Opened = true
})

utilityFlingSection:Button({
	Title = "Fling Sheriff",
	Desc = "Runs mini fling against the sheriff or hero.",
	Icon = "move-3d",
	Callback = flingSheriff
})

utilityFlingSection:Button({
	Title = "Fling Murderer",
	Desc = "Runs mini fling against the murderer.",
	Icon = "move-3d",
	Callback = flingMurderer
})

local settingsUiSection = Tabs.Settings:Section({
	Title = "UI Toggle Keybind",
	Opened = true
})

settingsUiSection:Keybind({
	Title = "UI Toggle Keybind",
	Desc = "Changes the key used to open and close Liquid Hub.",
	Value = "RightShift",
	Flag = "UIToggleKeybind",
	Callback = function(value)
		local keyCode = Enum.KeyCode[value]
		if keyCode then
			Window:SetToggleKey(keyCode)
			fu.notification("UI toggle keybind set to " .. value .. ".")
		end
	end
})

local settingsThemeSection = Tabs.Settings:Section({
	Title = "Theme Settings",
	Opened = true
})

local themeValues = {
	"Liquid",
	"Dark",
	"Light"
}

pcall(function()
	if WindUI.GetThemes then
		local themes = WindUI:GetThemes()
		if type(themes) == "table" then
			for key, value in pairs(themes) do
				local themeName = type(value) == "table" and (value.Name or value.Title) or value
				if type(themeName) == "string" and not table.find(themeValues, themeName) then
					table.insert(themeValues, themeName)
				elseif type(key) == "string" and not table.find(themeValues, key) then
					table.insert(themeValues, key)
				end
			end
		end
	end
end)

settingsThemeSection:Dropdown({
	Title = "Theme Settings",
	Desc = "Select a WindUI theme.",
	Values = themeValues,
	Value = "Liquid",
	Flag = "ThemeSettings",
	Callback = function(option)
		local themeName = option
		if type(option) == "table" then
			themeName = option.Title or option.Name or option[1]
		end

		if type(themeName) == "string" then
			local ok = pcall(function()
				WindUI:SetTheme(themeName)
			end)

			if ok then
				fu.notification("Theme set to " .. themeName .. ".")
			end
		end
	end
})

local settingsConfigSection = Tabs.Settings:Section({
	Title = "Config",
	Opened = true
})

local ConfigManager = Window.ConfigManager
local ConfigName = "default"
local ConfigDropdown

settingsConfigSection:Input({
	Title = "Config Name",
	Desc = "Name used by Save Config and Load Config.",
	Value = ConfigName,
	Placeholder = "default",
	Type = "Input",
	Flag = "ConfigNameInput",
	Callback = function(value)
		if value and value ~= "" then
			ConfigName = value
		end
	end
})

local function getAllConfigs()
	if not ConfigManager or not ConfigManager.AllConfigs then
		return {}
	end

	local ok, configs = pcall(function()
		return ConfigManager:AllConfigs()
	end)

	return ok and configs or {}
end

ConfigDropdown = settingsConfigSection:Dropdown({
	Title = "Existing Configs",
	Desc = "Select a saved config name.",
	Values = getAllConfigs(),
	Value = nil,
	Callback = function(value)
		if type(value) == "string" and value ~= "" then
			ConfigName = value
		elseif type(value) == "table" and value.Title then
			ConfigName = value.Title
		end
	end
})

local function getConfigObject()
	if not ConfigManager then
		return nil
	end

	local ok, config = pcall(function()
		if ConfigManager.Config then
			return ConfigManager:Config(ConfigName)
		end

		return ConfigManager:CreateConfig(ConfigName)
	end)

	if ok then
		Window.CurrentConfig = config
		return config
	end

	return nil
end

settingsConfigSection:Button({
	Title = "Save Config",
	Desc = "Saves WindUI element states.",
	Icon = "save",
	Callback = function()
		local config = getConfigObject()
		if not config then
			fu.notification("Config manager is unavailable.")
			return
		end

		local ok, result = pcall(function()
			return config:Save()
		end)

		if ok and result ~= false then
			fu.notification("Config '" .. ConfigName .. "' saved.")
			if ConfigDropdown then
				pcall(function()
					ConfigDropdown:Refresh(getAllConfigs())
				end)
			end
		else
			fu.notification("Config could not be saved.")
		end
	end
})

settingsConfigSection:Button({
	Title = "Load Config",
	Desc = "Loads WindUI element states.",
	Icon = "folder-open",
	Callback = function()
		local config = getConfigObject()
		if not config then
			fu.notification("Config manager is unavailable.")
			return
		end

		local ok, result = pcall(function()
			return config:Load()
		end)

		if ok and result ~= false then
			fu.notification("Config '" .. ConfigName .. "' loaded.")
		else
			fu.notification("Config could not be loaded.")
		end
	end
})

Tabs.Main:Select()
pcall(updateStatus)

fu.notification("Liquid Hub loaded.")
