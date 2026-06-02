local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 🔗 URLs
local WINDUI_URL = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
local SCRIPT_URL = "https://raw.githubusercontent.com/takgoomain-art/random123/5ea9ea02f315694e58b66488f780a5a424942df4/102923.lua"

-- 🚫 Blacklisted UserIds
local Blacklist = {
    12345678,
    87654321
}

-- 🔍 Check blacklist
local function isBlacklisted()
    for _, id in ipairs(Blacklist) do
        if player.UserId == id then
            return true
        end
    end
    return false
end

-- ❌ Block early (no WindUI yet)
if isBlacklisted() then
    warn("You are blacklisted.")
    return
end

-------------------------------------------------
-- 🌬️ LOAD WIND UI
-------------------------------------------------
local WindUI
local successUI, resultUI = pcall(function()
    return game:HttpGet(WINDUI_URL)
end)

if successUI and resultUI then
    local ok, lib = pcall(function()
        return loadstring(resultUI)()
    end)

    if ok and lib then
        WindUI = lib
        _G.WindUI = WindUI -- 🔥 share globally
    else
        warn("Failed to execute WindUI")
        return
    end
else
    warn("Failed to fetch WindUI")
    return
end

-------------------------------------------------
-- 🔔 NOTIFY 
-------------------------------------------------
local function notify(title, text, icon, duration)
    pcall(function()
        _G.WindUI:Notify({
            Title = title,
            Content = text,
            Icon = icon,
            Duration = duration
        })
    end)
end

-- ❌ Double check blacklist (with UI)
if isBlacklisted() then
    notify("Access Denied", "You are blacklisted.", "user-lock", 5)
    return
end


-- 🚀 LOAD MAIN SCRIPT
-------------------------------------------------
local success, script = pcall(function()
    return game:HttpGet(SCRIPT_URL)
end)

if success and script then
    notify("Loader", "Loading script...", "loader", 2)
    

    local runSuccess, err = pcall(function()
        loadstring(script)()
    end)

    if runSuccess then
        notify("Success", "Script loaded successfully", "circle-check-big", 4)
    else
        notify("Error!", "Execution failed!", "triangle-alert", 4)
        warn(err)
    end
else
    notify("Error", "Failed to fetch script", "triangle-alert", 4)
end
