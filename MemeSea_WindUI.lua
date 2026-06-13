local _version = "1.6.64-fix"
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"
))()

repeat task.wait() until game:IsLoaded()

local Players             = game:GetService("Players")
local ReplicatedStorage   = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser         = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

local OtherEvent  = ReplicatedStorage:WaitForChild("OtherEvent")
local MainEvents  = OtherEvent:WaitForChild("MainEvents")
local MiscEvents  = OtherEvent:WaitForChild("MiscEvents")
local QuestEvents = OtherEvent:WaitForChild("QuestEvents")

local function getGuiParent()
    return (gethui and gethui()) or game:GetService("CoreGui")
end

local Window = WindUI:CreateWindow({
    Title       = "Meme Sea",
    Icon        = "sword",
    Author      = "by candyhub",
    Acrylic     = true,
    Theme       = "Dark",
    NewElements = true,
    ToggleKey   = Enum.KeyCode.RightAlt,
    OpenButton  = { Enabled = false },
    Topbar      = { Style = "Mac" },
})

local Tabs = {
    AutoFarm  = Window:Tab({ Title = "Auto Farm",      Icon = "swords"      }),
    Stats     = Window:Tab({ Title = "Stats",          Icon = "bar-chart-2" }),
    Shop      = Window:Tab({ Title = "Shop",           Icon = "shopping-bag"}),
    FarmSpec  = Window:Tab({ Title = "Farm Specified", Icon = "crosshair"   }),
    AutoRaid  = Window:Tab({ Title = "Auto Raid",      Icon = "shield"      }),
    Settings  = Window:Tab({ Title = "Settings",       Icon = "settings"    }),
}

local SEC = {
    AutoFarm  = Tabs.AutoFarm:Section({ Title = "Auto Farm",          Icon = "swords",      Box = true, BoxBorder = true, Opened = true }),
    Stats     = Tabs.Stats:Section({    Title = "Stats",              Icon = "bar-chart-2", Box = true, BoxBorder = true, Opened = true }),
    Shop      = Tabs.Shop:Section({     Title = "Buy / Redeem",       Icon = "tag",         Box = true, BoxBorder = true, Opened = true }),
    FarmBoss  = Tabs.FarmSpec:Section({ Title = "Auto Farm Boss",     Icon = "skull",       Box = true, BoxBorder = true, Opened = true }),
    FarmSpec  = Tabs.FarmSpec:Section({ Title = "Auto Farm Specified",Icon = "crosshair",   Box = true, BoxBorder = true, Opened = true }),
    AutoRaid  = Tabs.AutoRaid:Section({ Title = "Auto Raid",          Icon = "shield",      Box = true, BoxBorder = true, Opened = true }),
    Settings  = Tabs.Settings:Section({ Title = "Settings",           Icon = "settings",    Box = true, BoxBorder = true, Opened = true }),
}

_G.candyhub = {
    autofloppa    = false,
    tokill        = "Floppa",
    questmode     = true,
    quest         = "Floppa Quest 1",
    autos         = true,
    allowbosses   = true,
    devtest       = true,
    platform      = true,
    buyfruitmode  = "Money",
    stats_s       = {},
    boss          = false,
    weapon        = "Combat",
    memebeast     = false,
    autoboss      = false,
    tokill_level  = 1,
    tokill_bosses = {},
    evilnoob      = false,
    amount        = 1,
    autoraid      = false,
    monsters      = {},
    autokillspec  = false,
    tokill_monster = "Red Sus",
}

local function getNil()
    return LocalPlayer.Character:FindFirstChildOfClass("Tool")
end

local function Press(key)
    VirtualInputManager:SendKeyEvent(true,  key, false, nil)
    task.wait()
    VirtualInputManager:SendKeyEvent(false, key, false, nil)
end

local function click()
    if not LocalPlayer.Character:FindFirstChild(_G.candyhub.weapon) then
        local inBackpack = LocalPlayer.Backpack:FindFirstChild(_G.candyhub.weapon)
        if inBackpack then inBackpack.Parent = LocalPlayer.Character end
    end
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(10000, 10000), workspace.Camera.CFrame)
end

local function CheckQuest()
    local questGui = LocalPlayer.PlayerGui:FindFirstChild("QuestGui")
    if not questGui then return end
    local holder = questGui:FindFirstChild("Holder")
    if not holder then return end
    local slot = holder:FindFirstChild("QuestSlot1")
    if slot then return slot.Visible end
end

local function SureQuest(target)
    local slot = LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1
    if slot.QuestGiver.Text ~= target then
        QuestEvents:WaitForChild("Quest"):FireServer("Abandon_Quest", { QuestSlot = "QuestSlot1" })
    end
end

local function GetLevel()
    return LocalPlayer.PlayerData.Level.Value
end

local function Lives()
    local char = LocalPlayer.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    return hrp ~= nil and hum ~= nil and hum.Health >= 1
end

local function StoreEquippedFruit()
    if Lives() then
        MainEvents:WaitForChild("Modules"):FireServer(
            "Eatable_Power",
            { Action = "Store", Tool = getNil() }
        )
    end
end

local function UseAura()
    if not Lives() then return end
    local auraFolder = LocalPlayer.Character:FindFirstChild("AuraColor_Folder")
    if auraFolder and not auraFolder:FindFirstChild("LeftHand_AuraColor") then
        MainEvents:WaitForChild("Ability"):InvokeServer("Aura")
    end
end

local function AreaCheck(level)
    local locs = workspace.Location.SpawnLocations
    local function tp(name) LocalPlayer.Character.HumanoidRootPart.CFrame = locs[name].CFrame end
    local npcs = workspace.NPCs.SetSpawn_Npc

    if     level >= 2200 and not npcs:FindFirstChild("SetSpawn9")  and Lives() and _G.candyhub.autofloppa then tp("MrBeast Island")
    elseif level >= 2100 and not npcs:FindFirstChild("SetSpawn9")  and Lives() and _G.candyhub.autofloppa then tp("MrBeast Island")
    elseif level >= 1900 and not npcs:FindFirstChild("SetSpawn8")  and Lives() and _G.candyhub.autofloppa then tp("Pvp Arena")
    elseif level >= 1700 and not npcs:FindFirstChild("SetSpawn10") and Lives() and _G.candyhub.autofloppa then tp("Forgotten Island")
    elseif level >= 1450 and not npcs:FindFirstChild("SetSpawn7")  and Lives() and _G.candyhub.autofloppa then tp("Sus Island")
    elseif level >= 1200 and not npcs:FindFirstChild("SetSpawn6")  and Lives() and _G.candyhub.autofloppa then tp("Moai Island")
    elseif level >= 1150 and not npcs:FindFirstChild("SetSpawn7")  and Lives() and _G.candyhub.autofloppa then tp("Sus Island")
    elseif level >= 950  and not npcs:FindFirstChild("SetSpawn5")  and Lives() and _G.candyhub.autofloppa then tp("Pumpkin Island")
    elseif level >= 750  and not npcs:FindFirstChild("SetSpawn4")  and Lives() and _G.candyhub.autofloppa then tp("Sand Island")
    elseif level >= 600  and not npcs:FindFirstChild("SetSpawn3")  and Lives() and _G.candyhub.autofloppa then tp("Gorilla Island")
    elseif level >= 300  and not npcs:FindFirstChild("SetSpawn2")  and Lives() and _G.candyhub.autofloppa then tp("Snow Island")
    elseif level >= 1    and not npcs:FindFirstChild("SetSpawn1")  and Lives() and _G.candyhub.autofloppa then tp("Floppa Island")
    end
end

local function UseQuest(proximity)
    local exec = identifyexecutor and identifyexecutor() or ""
    if exec == "Solara" or exec == "Xeno" then
        fireproximityprompt(proximity, 5)
    else
        Press("E")
    end
end

local function GetQuest(npc)
    local u = "Floppa Quest "
    local map = {
        ["Floppa"]="1",["Golden Floppa"]="2",["Big Floppa"]="3",["Doge"]="4",
        ["Cheems"]="5",["Walter Dog"]="6",["Staring Fish"]="7",["Hamster"]="8",
        ["Snow Tree"]="9",["The Rock"]="10",["Banana Cat"]="11",["Sus Face"]="12",
        ["Egg Dog"]="13",["Popcat"]="14",["Gorilla King"]="15",["Smiling Cat"]="16",
        ["Killerfish"]="17",["Bingus"]="18",["Obamid"]="19",["Floppy"]="20",
        ["Creepy Head"]="21",["Scary Skull"]="22",["Pink Absorber"]="24",
        ["Troll Face"]="25",["Uncanny Cat"]="26",["Quandale Dingle"]="27",
        ["Moai"]="28",["Evil Noob"]="29",["Red Sus"]="30",["Sus Duck"]="31",
        ["Lord Sus"]="32",["Sigma Man"]="33",["Dancing Cat"]="34",
        ["Toothless Dragon"]="35",["Manly Nugget"]="36",["Huh Cat"]="37",
        ["Mystical Tree"]="38",["Old Man"]="39",["Nyan Cat"]="40",["Baller"]="41",
        ["Slicer"]="42",["Rick Roller"]="43",["Gigachad"]="44",["MrBeast"]="45",
        ["Handsome Man"]="46",
    }
    if npc == "Sogga" then return "Dancing Banana Quest" end
    return map[npc] and (u .. map[npc]) or ""
end

-- AUTO FARM TAB

local itemslist = {}
for _, item in LocalPlayer.Backpack:GetChildren() do
    if not item.Name:match("Power") then
        table.insert(itemslist, item.Name)
    end
end

local WeaponDropdown = SEC.AutoFarm:Dropdown({
    Title    = "AutoFarm Weapon",
    Values   = itemslist,
    Default  = "Combat",
    Multi    = false,
    Callback = function(t) _G.candyhub.weapon = t end,
})

SEC.AutoFarm:Button({
    Title    = "Refresh Weapons List",
    Icon     = "refresh-cw",
    Callback = function()
        local newList = {}
        for _, item in LocalPlayer.Backpack:GetChildren() do
            if not item.Name:match("Power") then
                table.insert(newList, item.Name)
            end
        end
        WeaponDropdown:Refresh(newList)
    end,
})

local autofarmtoggle = SEC.AutoFarm:Toggle({
    Title    = "Auto Farm",
    Icon     = "swords",
    Default  = false,
    Callback = function(t)
        _G.candyhub.autofloppa = t
        while _G.candyhub.autofloppa and task.wait() do
            for _, monster in workspace.Monster:GetChildren() do
                if monster.Name == _G.candyhub.tokill then
                    local hrp = monster:FindFirstChild("HumanoidRootPart")
                    local hum = monster:FindFirstChild("Humanoid")
                    if hrp and hum and Lives() and hum.Health >= 1 then
                        hrp.Size = Vector3.new(17, 17, 17)
                        if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                        SureQuest(_G.candyhub.quest)
                        if not CheckQuest() then
                            local questNpc = workspace.NPCs.Quests_Npc:FindFirstChild(_G.candyhub.quest)
                            if questNpc and Lives() and questNpc:FindFirstChild("Block") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.QuestLocaion:FindFirstChild(_G.candyhub.quest).CFrame
                                task.wait(0.1)
                                UseQuest(questNpc.Block:FindFirstChild("QuestPrompt"))
                                UseQuest(questNpc.Block:FindFirstChild("QuestPrompt"))
                                task.wait(0.1)
                            elseif Lives() then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.QuestLocaion:FindFirstChild(_G.candyhub.quest).CFrame
                            end
                        end
                        UseAura()
                        while hum.Health >= 1 and _G.candyhub.autofloppa and Lives() do
                            if hrp then
                                hrp.Size = Vector3.new(17, 17, 17)
                                if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                            end
                            if Lives() then
                                hrp.Size = Vector3.new(17, 17, 17)
                                LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                            end
                            click()
                            task.wait()
                        end
                    end
                end
            end
        end
    end,
})

SEC.AutoFarm:Toggle({
    Title    = "Allow Bosses",
    Icon     = "shield",
    Default  = false,
    Callback = function(t) _G.candyhub.allowbosses = t end,
})

local bringenemiestoggle = SEC.AutoFarm:Toggle({
    Title    = "Bring Enemies (Ignore Bosses)",
    Icon     = "users",
    Default  = false,
    Callback = function(t)
        _G.candyhub.bringenemies = t
        while _G.candyhub.bringenemies and task.wait() do
            if _G.candyhub.autofloppa and not _G.candyhub.autoraid and not _G.candyhub.autokillspec then
                for _, monster in workspace.Monster:GetChildren() do
                    local hum = monster:FindFirstChild("Humanoid")
                    local hrp = monster:FindFirstChild("HumanoidRootPart")
                    if hum and hum.Health >= 1 and hrp and Lives() then
                        if monster.Name == _G.candyhub.tokill and not _G.candyhub.boss then
                            local questNpc = workspace.NPCs.Quests_Npc:FindFirstChild(_G.candyhub.quest)
                            if questNpc and Lives() and questNpc:FindFirstChild("Block") then
                                hrp.CFrame = questNpc.Block.CFrame * CFrame.new(0, 8, 0)
                            end
                        end
                    end
                end
            elseif _G.candyhub.autoraid and not _G.candyhub.autofloppa and not _G.candyhub.autokillspec then
                for _, monster in workspace.Monster:GetChildren() do
                    local hum = monster:FindFirstChild("Humanoid")
                    local hrp = monster:FindFirstChild("HumanoidRootPart")
                    if hum and hum.Health >= 1 and hrp and Lives() then
                        local raidMonsters = {
                            ["Floppa Man"]=true,["Epic Doge"]=true,["Speedy Cheems"]=true,
                            ["Tanky Moai"]=true,["Killer Nugget"]=true,["The Stone"]=true,["Capybara"]=true,
                        }
                        if raidMonsters[monster.Name] then
                            local raidId = LocalPlayer:GetAttribute("Raiding")
                            if raidId and raidId ~= "" then
                                hrp.CFrame = workspace.Raids:FindFirstChild("Raid_" .. raidId).Statue.Floppa.CFrame * CFrame.new(0, 28, -10)
                            end
                        end
                    end
                end
            elseif _G.candyhub.autokillspec and not _G.candyhub.autofloppa and not _G.candyhub.autoraid then
                for _, monster in workspace.Monster:GetChildren() do
                    local hum = monster:FindFirstChild("Humanoid")
                    local hrp = monster:FindFirstChild("HumanoidRootPart")
                    if hum and hum.Health >= 1 and hrp and Lives() then
                        if monster.Name == _G.candyhub.tokill_monster then
                            hrp.CFrame = workspace.Location.Enemy_Location:FindFirstChild(monster.Name).CFrame * CFrame.new(0, 10, 0)
                        end
                    end
                end
            end
        end
    end,
})

-- STATS TAB

SEC.Stats:Toggle({
    Title    = "Auto Stats",
    Icon     = "trending-up",
    Default  = false,
    Callback = function(t)
        _G.candyhub.autostats = t
        while _G.candyhub.autostats and task.wait(0.1) do
            for _, stat in _G.candyhub.stats_s do
                MainEvents:WaitForChild("StatsFunction"):InvokeServer(
                    { Target = stat, Action = "UpgradeStats", Amount = 1 }
                )
            end
        end
    end,
})

SEC.Stats:Dropdown({
    Title    = "Stats to Upgrade",
    Values   = { "MeleeLevel", "DefenseLevel", "SwordLevel", "MemePowerLevel" },
    Default  = { "MeleeLevel", "DefenseLevel" },
    Multi    = true,
    Callback = function(t) _G.candyhub.stats_s = t end,
})

-- SHOP TAB

SEC.Shop:Button({
    Title    = "Redeem Codes",
    Icon     = "gift",
    Callback = function()
        local codes = {
            "100MVisits","100KLikes","100KFavorites","100KActive","70KActive",
            "40KActive","20KActive","10KActive","10KMembers","Update4",
            "4KActive","10KLikes","10MVisits","9MVisits",
        }
        for _, code in codes do
            MainEvents:WaitForChild("Code"):InvokeServer(code)
        end
        WindUI:Notify({ Title = "Done!", Content = "All codes redeemed.", Duration = 3 })
    end,
})

SEC.Shop:Button({
    Title    = "Roll Powers",
    Icon     = "zap",
    Callback = function()
        for _ = 1, _G.candyhub.amount do
            MainEvents:WaitForChild("Modules"):FireServer(
                "Random_Power",
                { Type = "Once", NPCName = "Floppa Gacha", GachaType = _G.candyhub.buyfruitmode }
            )
        end
    end,
})

SEC.Shop:Slider({
    Title    = "Roll Amount",
    Value    = { Min = 1, Max = 500, Default = 1 },
    Callback = function(t) _G.candyhub.amount = t end,
})

SEC.Shop:Dropdown({
    Title    = "Buy Mode",
    Values   = { "Money", "Gem" },
    Default  = "Money",
    Multi    = false,
    Callback = function(t) _G.candyhub.buyfruitmode = t end,
})

-- FARM SPECIFIED TAB

local memebeasttoggle = SEC.FarmBoss:Toggle({
    Title    = "Auto Meme Beast",
    Icon     = "skull",
    Default  = false,
    Callback = function(t)
        _G.candyhub.memebeast = t
        while _G.candyhub.memebeast and task.wait() do
            local beast = workspace.Monster:FindFirstChild("Meme Beast")
            if beast then
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Meme Beast"].CFrame
                    local hrp = beast:FindFirstChild("HumanoidRootPart")
                    local hum = beast:FindFirstChild("Humanoid")
                    if hrp and hum and hum.Health >= 1 then
                        UseAura()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                        click()
                    else
                        task.wait(1)
                    end
                end
            else
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Meme Beast"].CFrame
                end
                task.wait(1)
            end
        end
    end,
})

local giantpumptoggle = SEC.FarmBoss:Toggle({
    Title    = "Auto Giant Pumpkin (auto summon)",
    Icon     = "skull",
    Default  = false,
    Callback = function(t)
        _G.candyhub.giantpump = t
        while _G.candyhub.giantpump and task.wait() do
            local pump = workspace.Monster:FindFirstChild("Giant Pumpkin")
            if pump then
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Giant Pumpkin"].CFrame
                    local hrp = pump:FindFirstChild("HumanoidRootPart")
                    local hum = pump:FindFirstChild("Humanoid")
                    if hrp and hum and hum.Health >= 1 then
                        if Lives() and _G.candyhub.questmode and not CheckQuest() and GetLevel() >= 1100 then
                            SureQuest("Floppa Quest 23")
                            local qn = workspace.NPCs.Quests_Npc:FindFirstChild("Floppa Quest 23")
                            if qn then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = qn.Block.CFrame
                                task.wait(0.1)
                                UseQuest(qn.Block.QuestPrompt, 5)
                                task.wait(0.1)
                            end
                        end
                        hrp.Size = Vector3.new(20, 20, 20)
                        if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                        UseAura()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                        click()
                    else
                        task.wait(1)
                    end
                end
            else
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.PumpkinIsland.Summon1.Summon.CFrame
                    task.wait()
                    UseQuest(workspace.Island.PumpkinIsland.Summon1.Summon.SummonPrompt, 5)
                end
                task.wait(1)
            end
        end
    end,
})

local evilnoobtoggle = SEC.FarmBoss:Toggle({
    Title    = "Auto Evil Noob (auto summon)",
    Icon     = "skull",
    Default  = false,
    Callback = function(t)
        _G.candyhub.evilnoob = t
        while _G.candyhub.evilnoob and task.wait() do
            local noob = workspace.Monster:FindFirstChild("Evil Noob")
            if noob then
                if Lives() then
                    local hrp = noob:FindFirstChild("HumanoidRootPart")
                    local hum = noob:FindFirstChild("Humanoid")
                    if hrp and hum and hum.Health >= 1 then
                        if Lives() and _G.candyhub.questmode and not CheckQuest() and GetLevel() >= 1100 then
                            SureQuest("Floppa Quest 23")
                            local qn = workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest("Evil Noob"))
                            if qn then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = qn.Block.CFrame
                                task.wait(0.1)
                                UseQuest(qn.Block.QuestPrompt, 5)
                                task.wait(0.1)
                            end
                        end
                        hrp.Size = Vector3.new(20, 20, 20)
                        if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                        UseAura()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                        click()
                    else
                        task.wait(1)
                    end
                end
            else
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.MoaiIsland.Summon2.Summon.CFrame
                    task.wait()
                    UseQuest(workspace.Island.MoaiIsland.Summon2.Summon.SummonPrompt, 5)
                end
                task.wait(1)
            end
        end
    end,
})

local lordsustoggle = SEC.FarmBoss:Toggle({
    Title    = "Auto Lord Sus (auto summon)",
    Icon     = "skull",
    Default  = false,
    Callback = function(t)
        _G.candyhub.lordsus = t
        while _G.candyhub.lordsus and task.wait() do
            local sus = workspace.Monster:FindFirstChild("Lord Sus")
            if sus then
                if Lives() then
                    local hrp = sus:FindFirstChild("HumanoidRootPart")
                    local hum = sus:FindFirstChild("Humanoid")
                    if hrp and hum and hum.Health >= 1 then
                        if Lives() and _G.candyhub.questmode and not CheckQuest() and GetLevel() >= 1550 then
                            SureQuest("Floppa Quest 32")
                            local qn = workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest("Lord Sus"))
                            if qn then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = qn.Block.CFrame
                                task.wait(0.1)
                                UseQuest(qn.Block.QuestPrompt, 5)
                                task.wait(0.1)
                            end
                        end
                        hrp.Size = Vector3.new(17, 17, 17)
                        if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                        UseAura()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                        click()
                    else
                        task.wait(1)
                    end
                end
            else
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.ForgottenIsland.Summon3.Summon.CFrame
                    task.wait(0.05)
                    UseQuest(workspace.Island.ForgottenIsland.Summon3.Summon:FindFirstChild("SummonPrompt"), 5)
                end
                task.wait(1)
            end
        end
    end,
})

local bosstoggle = SEC.FarmBoss:Toggle({
    Title    = "Auto Farm Boss",
    Icon     = "target",
    Default  = false,
    Callback = function(t)
        _G.candyhub.autoboss = t
        while _G.candyhub.autoboss and task.wait(1) do
            if workspace:FindFirstChild("Monster") and Lives() then
                for _, boss in _G.candyhub.tokill_bosses do
                    if not workspace.Monster:FindFirstChild(boss) then
                        if Lives() then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location:FindFirstChild(boss).CFrame
                        end
                    end
                    if _G.candyhub.questmode then
                        local qn = workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(boss))
                        if qn and Lives() and qn:FindFirstChild("Block") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = qn.Block.CFrame
                            task.wait(0.001)
                            UseQuest(qn.Block:FindFirstChild("QuestPrompt"), 5)
                            task.wait(0.001)
                        end
                    end
                    local bossModel = workspace.Monster:FindFirstChild(boss)
                    if bossModel then
                        local hrp = bossModel:FindFirstChild("HumanoidRootPart")
                        local hum = bossModel:FindFirstChild("Humanoid")
                        if hum and hrp then
                            UseAura()
                            while hum.Health >= 1 and _G.candyhub.autoboss and Lives() do
                                if hrp then
                                    hrp.Size = Vector3.new(17, 17, 17)
                                    if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                                end
                                if Lives() then
                                    hrp.Size = Vector3.new(17, 17, 17)
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                                end
                                click()
                                task.wait()
                            end
                        end
                    end
                end
            end
        end
    end,
})

SEC.FarmBoss:Dropdown({
    Title    = "Boss Target",
    Values   = { "MrBeast","Rick Roller","Moai","Pink Absorber","Obamid","Gorilla King","Sus Face","Walter Dog","Big Floppa" },
    Default  = { "Big Floppa" },
    Multi    = true,
    Callback = function(t) _G.candyhub.tokill_bosses = t end,
})

_G.candyhub.monsters = {}
for _, monstre in workspace.Location.Enemy_Location:GetChildren() do
    local bosses = {
        ["Big Floppa"]=true,["Walter Dog"]=true,["Sus Face"]=true,["Gorilla King"]=true,
        ["Obamid"]=true,["Pink Absorber"]=true,["Moai"]=true,["Rick Roller"]=true,["MrBeast"]=true,
        ["Meme Beast"]=true,["Evil Noob"]=true,["Giant Pumpkin"]=true,["Lord Sus"]=true,["Training Log"]=true,
    }
    if not bosses[monstre.Name] then
        table.insert(_G.candyhub.monsters, monstre.Name)
    end
end

local farmspectoggle = SEC.FarmSpec:Toggle({
    Title    = "Auto Farm Specified",
    Icon     = "crosshair",
    Default  = false,
    Callback = function(t)
        _G.candyhub.autokillspec = t
        while _G.candyhub.autokillspec and task.wait() do
            local target = workspace.Monster:FindFirstChild(_G.candyhub.tokill_monster)
            if target then
                for _, monster in workspace.Monster:GetChildren() do
                    if monster.Name == _G.candyhub.tokill_monster then
                        if _G.candyhub.questmode then
                            SureQuest(GetQuest(_G.candyhub.tokill_monster))
                            if not CheckQuest() then
                                local qn = workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(_G.candyhub.tokill_monster))
                                if qn and Lives() and qn:FindFirstChild("Block") then
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = qn.Block.CFrame
                                    task.wait(0.05)
                                    UseQuest(qn.Block:FindFirstChild("QuestPrompt"), 5)
                                    UseQuest(qn.Block:FindFirstChild("QuestPrompt"), 5)
                                    task.wait(0.05)
                                end
                            end
                        end
                        local hrp = monster:FindFirstChild("HumanoidRootPart")
                        local hum = monster:FindFirstChild("Humanoid")
                        if hrp and hum and hum.Health >= 1 and Lives() then
                            while hum.Health >= 1 and _G.candyhub.autokillspec do
                                if Lives() then
                                    UseAura()
                                    hrp.Size = Vector3.new(16, 16, 16)
                                    if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, 8)
                                    click()
                                end
                                task.wait()
                            end
                        end
                    end
                end
            else
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location:FindFirstChild(_G.candyhub.tokill_monster).CFrame
                    task.wait(0.5)
                end
            end
        end
    end,
})

local MonsterDropdown = SEC.FarmSpec:Dropdown({
    Title    = "Monster Target",
    Values   = _G.candyhub.monsters,
    Default  = "Red Sus",
    Multi    = false,
    Callback = function(t) _G.candyhub.tokill_monster = t end,
})

SEC.FarmSpec:Toggle({
    Title    = "Bring Enemies (Specified Mode)",
    Icon     = "users",
    Default  = false,
    Callback = function(t)
        _G.candyhub.bringenemies = t
    end,
})

-- AUTO RAID TAB

local autoraidtoggle = SEC.AutoRaid:Toggle({
    Title    = "Auto Farm Raid",
    Icon     = "shield",
    Default  = false,
    Callback = function(t)
        _G.candyhub.autoraid = t
        while _G.candyhub.autoraid and task.wait() do
            while (LocalPlayer:GetAttribute("Raiding") == "" or LocalPlayer:GetAttribute("Raiding") == nil) and task.wait() and _G.candyhub.autoraid do
                if Lives() then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.MrBeastIsland.Raid_Area.CFrame
                    MiscEvents:WaitForChild("StartRaid"):FireServer("Start")
                end
            end
            MiscEvents:WaitForChild("StartRaid"):FireServer("Start")
            local raidMonsters = {
                ["Super Popcat"]=true,["Maxwell The Cat"]=true,["Reverse Master"]=true,
                ["Floppa Man"]=true,["Epic Doge"]=true,["Speedy Cheems"]=true,
                ["Tanky Moai"]=true,["Killer Nugget"]=true,["The Stone"]=true,["Capybara"]=true,
            }
            for _, monster in workspace.Monster:GetChildren() do
                if raidMonsters[monster.Name] then
                    local hrp = monster:FindFirstChild("HumanoidRootPart")
                    local hum = monster:FindFirstChild("Humanoid")
                    if hrp and hum and Lives() and hum.Health >= 1 then
                        hrp.Size = Vector3.new(16, 16, 16)
                        if _G.candyhub.devtest then hrp.Transparency = 0.8 end
                        UseAura()
                        while hum and hum.Health >= 1 and _G.candyhub.autoraid and task.wait() do
                            if monster.Name == "Maxwell The Cat" then
                                local raidId = LocalPlayer:GetAttribute("Raiding")
                                local raidFolder = raidId and workspace.Raids:FindFirstChild("Raid_" .. raidId)
                                if not workspace.Monster:FindFirstChild("Floppa Man")
                                    and not workspace.Monster:FindFirstChild("Speedy Cheems")
                                    and not workspace.Monster:FindFirstChild("Epic Dog") then
                                    if Lives() and hrp then
                                        local offset = monster:FindFirstChild("Reverse_Mark") and 13 or 8
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, offset)
                                    end
                                else
                                    break
                                end
                            else
                                if Lives() and hrp then
                                    local offset = monster:FindFirstChild("Reverse_Mark") and 13 or 8
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -5, offset)
                                end
                            end
                            click()
                        end
                    end
                end
            end
        end
    end,
})

SEC.AutoRaid:Toggle({
    Title    = "Bring Enemies (Raid Mode)",
    Icon     = "users",
    Default  = false,
    Callback = function(t)
        _G.candyhub.bringenemies = t
    end,
})

-- SETTINGS TAB

SEC.Settings:Toggle({
    Title    = "No Quests",
    Icon     = "x-circle",
    Default  = false,
    Callback = function(t) _G.candyhub.questmode = not t end,
})

SEC.Settings:Keybind({
    Title    = "Force Stop AutoFarm",
    Desc     = "Stops all auto farm toggles",
    Default  = Enum.KeyCode.J,
    Callback = function()
        _G.candyhub.autofloppa = false
        _G.candyhub.memebeast  = false
        _G.candyhub.giantpump  = false
        _G.candyhub.autoboss   = false
        _G.candyhub.evilnoob   = false
        _G.candyhub.autoraid   = false
        _G.candyhub.lordsus    = false
        autofarmtoggle:SetValue(false)
        memebeasttoggle:SetValue(false)
        giantpumptoggle:SetValue(false)
        bosstoggle:SetValue(false)
        evilnoobtoggle:SetValue(false)
        autoraidtoggle:SetValue(false)
        farmspectoggle:SetValue(false)
        lordsustoggle:SetValue(false)
    end,
})

-- LEVEL-BASED TARGET LOOP

task.spawn(function()
    while task.wait(0.5) do
        local lv = GetLevel()
        if     lv >= 2350 then _G.candyhub.tokill = "Handsome Man";     _G.candyhub.quest = "Floppa Quest 46"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 2350
        elseif lv >= 2300 and _G.candyhub.allowbosses then _G.candyhub.tokill = "MrBeast";        _G.candyhub.quest = "Floppa Quest 45"; _G.candyhub.boss = true;  _G.candyhub.tokill_level = 2300
        elseif lv >= 2250 then _G.candyhub.tokill = "Gigachad";        _G.candyhub.quest = "Floppa Quest 44"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 2250
        elseif lv >= 2200 and _G.candyhub.allowbosses then _G.candyhub.tokill = "Rick Roller";    _G.candyhub.quest = "Floppa Quest 43"; _G.candyhub.boss = true;  _G.candyhub.tokill_level = 2200
        elseif lv >= 2150 then _G.candyhub.tokill = "Slicer";          _G.candyhub.quest = "Floppa Quest 42"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 2150
        elseif lv >= 2100 then _G.candyhub.tokill = "Baller";          _G.candyhub.quest = "Floppa Quest 41"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 2100
        elseif lv >= 2050 then _G.candyhub.tokill = "Nyan Cat";        _G.candyhub.quest = "Floppa Quest 40"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 2050
        elseif lv >= 2000 then _G.candyhub.tokill = "Old Man";         _G.candyhub.quest = "Floppa Quest 39"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 2000
        elseif lv >= 1950 then _G.candyhub.tokill = "Mystical Tree";   _G.candyhub.quest = "Floppa Quest 38"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1950
        elseif lv >= 1900 then _G.candyhub.tokill = "Huh Cat";         _G.candyhub.quest = "Floppa Quest 37"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1900
        elseif lv >= 1850 then _G.candyhub.tokill = "Manly Nugget";    _G.candyhub.quest = "Floppa Quest 36"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1850
        elseif lv >= 1800 then _G.candyhub.tokill = "Toothless Dragon";_G.candyhub.quest = "Floppa Quest 35"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1800
        elseif lv >= 1750 then _G.candyhub.tokill = "Dancing Cat";     _G.candyhub.quest = "Floppa Quest 34"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1750
        elseif lv >= 1700 then _G.candyhub.tokill = "Sigma Man";       _G.candyhub.quest = "Floppa Quest 33"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1700
        elseif lv >= 1500 then _G.candyhub.tokill = "Sus Duck";        _G.candyhub.quest = "Floppa Quest 31"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1500
        elseif lv >= 1450 then _G.candyhub.tokill = "Red Sus";         _G.candyhub.quest = "Floppa Quest 30"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1450
        elseif lv >= 1350 and _G.candyhub.allowbosses then _G.candyhub.tokill = "Moai";           _G.candyhub.quest = "Floppa Quest 28"; _G.candyhub.boss = true;  _G.candyhub.tokill_level = 1350
        elseif lv >= 1300 then _G.candyhub.tokill = "Quandale Dingle"; _G.candyhub.quest = "Floppa Quest 27"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1300
        elseif lv >= 1250 then _G.candyhub.tokill = "Uncanny Cat";     _G.candyhub.quest = "Floppa Quest 26"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1250
        elseif lv >= 1200 then _G.candyhub.tokill = "Troll Face";      _G.candyhub.quest = "Floppa Quest 25"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1200
        elseif lv >= 1150 and _G.candyhub.allowbosses then _G.candyhub.tokill = "Pink Absorber";  _G.candyhub.quest = "Floppa Quest 24"; _G.candyhub.boss = true;  _G.candyhub.tokill_level = 1150
        elseif lv >= 1050 then _G.candyhub.tokill = "Scary Skull";     _G.candyhub.quest = "Floppa Quest 22"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1050
        elseif lv >= 1000 then _G.candyhub.tokill = "Creepy Head";     _G.candyhub.quest = "Floppa Quest 21"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 1000
        elseif lv >= 950  then _G.candyhub.tokill = "Floppy";          _G.candyhub.quest = "Floppa Quest 20"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 950
        elseif lv >= 900  and _G.candyhub.allowbosses then _G.candyhub.tokill = "Obamid";         _G.candyhub.quest = "Floppa Quest 19"; _G.candyhub.boss = true;  _G.candyhub.tokill_level = 900
        elseif lv >= 850  then _G.candyhub.tokill = "Bingus";          _G.candyhub.quest = "Floppa Quest 18"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 850
        elseif lv >= 800  then _G.candyhub.tokill = "Killerfish";      _G.candyhub.quest = "Floppa Quest 17"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 800
        elseif lv >= 750  then _G.candyhub.tokill = "Smiling Cat";     _G.candyhub.quest = "Floppa Quest 16"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 750
        elseif lv >= 700  and _G.candyhub.allowbosses then _G.candyhub.tokill = "Gorilla King";   _G.candyhub.quest = "Floppa Quest 15"; _G.candyhub.boss = true;  _G.candyhub.tokill_level = 700
        elseif lv >= 650  then _G.candyhub.tokill = "Popcat";          _G.candyhub.quest = "Floppa Quest 14"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 650
        elseif lv >= 600  then _G.candyhub.tokill = "Egg Dog";         _G.candyhub.quest = "Floppa Quest 13"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 600
        elseif lv >= 550  then _G.candyhub.tokill = "Sus Face";        _G.candyhub.quest = "Floppa Quest 12"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 550
        elseif lv >= 500  then _G.candyhub.tokill = "Banana Cat";      _G.candyhub.quest = "Floppa Quest 11"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 500
        elseif lv >= 450  then _G.candyhub.tokill = "The Rock";        _G.candyhub.quest = "Floppa Quest 10"; _G.candyhub.boss = false; _G.candyhub.tokill_level = 450
        elseif lv >= 400  then _G.candyhub.tokill = "Snow Tree";       _G.candyhub.quest = "Floppa Quest 9";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 400
        elseif lv >= 350  then _G.candyhub.tokill = "Hamster";         _G.candyhub.quest = "Floppa Quest 8";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 350
        elseif lv >= 300  then _G.candyhub.tokill = "Staring Fish";    _G.candyhub.quest = "Floppa Quest 7";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 300
        elseif lv >= 250  and _G.candyhub.allowbosses then _G.candyhub.tokill = "Walter Dog";     _G.candyhub.quest = "Floppa Quest 6";  _G.candyhub.boss = true;  _G.candyhub.tokill_level = 250
        elseif lv >= 200  then _G.candyhub.tokill = "Cheems";          _G.candyhub.quest = "Floppa Quest 5";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 200
        elseif lv >= 150  then _G.candyhub.tokill = "Doge";            _G.candyhub.quest = "Floppa Quest 4";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 150
        elseif lv >= 100  and _G.candyhub.allowbosses then _G.candyhub.tokill = "Big Floppa";     _G.candyhub.quest = "Floppa Quest 3";  _G.candyhub.boss = true;  _G.candyhub.tokill_level = 100
        elseif lv >= 50   then _G.candyhub.tokill = "Golden Floppa";   _G.candyhub.quest = "Floppa Quest 2";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 50
        elseif lv >= 1    then _G.candyhub.tokill = "Floppa";          _G.candyhub.quest = "Floppa Quest 1";  _G.candyhub.boss = false; _G.candyhub.tokill_level = 1
        end
        if _G.candyhub.autofloppa then AreaCheck(lv) end
    end
end)

-- CUSTOM OPEN BUTTON

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
            dragging  = true
            dragStart = input.Position
            startPos  = button.Position
        end
    end)
    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
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

createCustomOpenButton()
