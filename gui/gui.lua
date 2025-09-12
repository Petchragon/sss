local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Petch", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Compass")

Section:NewToggle("Auto compass", "ToggleInfo", function(state)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Petchragon/sss/refs/heads/Claim/compass/claim.lua'),true))()
end)