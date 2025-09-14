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
local hakiLoopRunning = false
local hakiLoopThread

Section:NewToggle("Auto Haki", "เปิดปิดฮาคิอัตโนมัติ", function(state)
    hakiLoopRunning = state

    if hakiLoopRunning then
        if not securityCheck() then
            warn("[Auto Haki] ยกเลิกการทำงานเพราะความเสี่ยงด้านความปลอดภัย")
            return
        end

        hakiLoopThread = task.spawn(function()
            while hakiLoopRunning do
                local args = {
                    [1] = "On",
                    [2] = 1
                }

                local success, err = pcall(function()
                    workspace.UserData.User_926062175.III:FireServer(unpack(args))
                end)

                if not success then
                    warn("[Auto Haki] เกิดข้อผิดพลาด:", err)
                end

                task.wait(math.random(2, 4)) -- รอแบบสุ่ม
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

        local success, err = pcall(function()
            workspace.UserData.User_926062175.III:FireServer(unpack(args))
        end)

        if not success then
            warn("[Auto Haki] ปิด Haki ล้มเหลว:", err)
        end
    end
end)
