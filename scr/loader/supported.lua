local SupportedGames = {
    [142823291] = "https://raw.githubusercontent.com/Broidk-123/nahhidk/refs/heads/main/scr/script%2Clua.lua" -- MM2
}

local GameScript = SupportedGames[game.PlaceId]

if GameScript then
    loadstring(game:HttpGet(GameScript))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Liquid Hub",
        Text = "Game Not Supported",
        Duration = 5
    })
end
