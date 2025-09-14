-- โหลด Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Petch", "DarkTheme")

local Tab = Window:NewTab("Main")

-- สร้าง Section สำหรับ Compass
local ClaimLoopRunning = false
local ClaimLoopThread

Section:NewToggle("Auto Claim", "เปิด/ปิด การเคลมอัตโนมัติ", function(state)
    ClaimLoopRunning = state

    if ClaimLoopRunning then
        ClaimLoopThread = task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
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
-- ตัวแปรควบคุมลูป
local hakiLoopRunning = false
local hakiLoopThread

-- สร้างปุ่มกดเริ่ม/หยุด
Section:NewButton("เริ่ม / หยุด Auto Haki", "กดเพื่อเปิดหรือปิด Haki", function()
    hakiLoopRunning = not hakiLoopRunning

    if hakiLoopRunning then
        -- เริ่มลูป: เปิด Haki
        hakiLoopThread = task.spawn(function()
            while hakiLoopRunning do
                local args = {
                    [1] = "On",
                    [2] = 1
                }
                workspace.UserData.User_926062175.III:FireServer(unpack(args))
                wait(1)
            end
        end)
    else
        -- หยุดลูป: ปิด Haki
        if hakiLoopThread then
            task.cancel(hakiLoopThread)
        end

        local args = {
            [1] = "Off",
            [2] = 9
        }
        workspace.UserData.User_926062175.III:FireServer(unpack(args))
    end
end)
