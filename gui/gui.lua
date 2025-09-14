local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Petch", "DarkTheme")

local Tab = Window:NewTab("Main")

-- Section สำหรับ Auto Claim
local Section = Tab:NewSection("Auto Claim")

local ClaimLoopRunning = false
local ClaimLoopThread

Section:NewToggle("Auto Claim", "เปิด/ปิด การเคลมอัตโนมัติ", function(state)
    ClaimLoopRunning = state

    if ClaimLoopRunning then
        ClaimLoopThread = task.spawn(function()
            local remote = game:GetService("ReplicatedStorage").Connections:WaitForChild("Claim_Sam")
            local args = { "Claim1" }

            while ClaimLoopRunning do
                remote:FireServer(unpack(args))
                task.wait(math.random(2, 4))
            end
        end)
    else
        if ClaimLoopThread then
            task.cancel(ClaimLoopThread)
        end
    end
end)

------------------------------------------------------------------------------------------------------

local Section = Tab:NewSection("Haki Control")
local hakiLoopRunning = false
local hakiLoopThread

Section:NewButton("เริ่ม / หยุด Auto Haki", "กดเพื่อเปิดหรือปิด Haki", function()
    hakiLoopRunning = not hakiLoopRunning
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
end)
