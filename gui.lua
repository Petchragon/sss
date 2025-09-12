local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Petch", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Claim compass")
Section:NewToggle("Claim", "ToggleInfo", function(state)

end)
