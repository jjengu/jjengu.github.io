local games = {
    [6361937392] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfobtb-mobile.lua",
    [6356763358] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfobtb-mobile.lua",
    [11515893037] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfobtb-mobile.lua",
    [10191847911] = "https://raw.githubusercontent.com/Pstrw/Pstrw.github.io/main/scripts/solaris/games/stfo-mobile.lua"
}

if games[game.PlaceId] then
    loadstring(game:HttpGet(games[game.PlaceId]))()
end
