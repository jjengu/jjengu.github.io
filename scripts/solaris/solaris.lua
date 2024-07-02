task.spawn(function()
loadstring(game:HttpGet("https://pastebin.com/raw/5ZnrqqNY"))()
end)

local games = {
    [6361937392] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfobtb.lua",
    [6356763358] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfobtb.lua",
    [11515893037] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfobtb.lua",
    [10191847911] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfo.lua"
}

if games[game.PlaceId] then
    loadstring(game:HttpGet(games[game.PlaceId]))()
end
