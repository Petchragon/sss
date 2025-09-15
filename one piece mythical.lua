local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "One piece Mythical",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "PetchHub",
   LoadingSubtitle = "by Petch",
   ShowText = "Angel Star",--for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Auto Compass")
local ClaimLoopRunning = false
local ClaimLoopThread
local Toggle = Tab:CreateToggle({
   Name = "Auto Claim",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(state)
   ClaimLoopRunning = state

    if ClaimLoopRunning then
        ClaimLoopThread = task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local remote = game:GetService("ReplicatedStorage").Connections:WaitForChild("Claim_Sam")
            local args = { "Claim1" }

            while ClaimLoopRunning do
                remote:FireServer(unpack(args))
                task.wait(3)
            end
        end)
    else
        if ClaimLoopThread then
            task.cancel(ClaimLoopThread)
        end
    end
   end,
})

	local Section = Tab:CreateSection("Auto Haki")
	local hakiLoopRunning = false
	local hakiLoopThread
	local Toggle = Tab:CreateToggle({
   	Name = "Auto Haki",
   	CurrentValue = false,
   	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   	Callback = function(state)
		if firstRun then
        firstRun = false
        return -- ข้ามการทำงานครั้งแรก
    end
		hakiLoopRunning = state
    local userId = game.Players.LocalPlayer.UserId

    if hakiLoopRunning then
        hakiLoopThread = task.spawn(function()
            while hakiLoopRunning do
                local args = {
                    [1] = "On",
                    [2] = 1
                }
                workspace.UserData["User_" .. userId].III:FireServer(unpack(args))
                task.wait(1)
            end
        end)
    else
        if hakiLoopThread then
            task.cancel(hakiLoopThread)
        end

        local args = {
            [1] = "Off",
            [2] = 9
        }
        workspace.UserData["User_" .. userId].III:FireServer(unpack(args))
    end
 end,
})