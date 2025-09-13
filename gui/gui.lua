-- โหลด Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Petch", "DarkTheme")

local Tab = Window:NewTab("Main")

-- ระบบแจ้งเตือนความปลอดภัย (ลบส่วนตรวจผู้เล่นอื่นออก)
local function securityCheck()
    -- ตรวจหา Anti-Cheat Script
    for _, obj in pairs(game:GetDescendants()) do
        local name = obj.Name:lower()
        if name:find("anti") or name:find("cheat") or name:find("detect") then
            warn("[Security] ตรวจพบระบบป้องกัน: ", obj:GetFullName())
            return false
        end
    end

    return true
end

-- สร้าง Section สำหรับ Compass
local Section = Tab:NewSection("Compass")

local ClaimLoopRunning = false
local ClaimLoopThread

Section:NewToggle("Auto Claim", "รับของอัตโนมัติ", function(state)
    ClaimLoopRunning = state

    if ClaimLoopRunning then
        if not securityCheck() then
            warn("[Auto Claim] ยกเลิกการทำงานเพราะความเสี่ยงด้านความปลอดภัย")
            return
        end

        ClaimLoopThread = task.spawn(function()
            local remote = game:GetService("ReplicatedStorage").Connections:WaitForChild("Claim_Sam")
            local args = { "Claim1" }

            while ClaimLoopRunning do
                local success, err = pcall(function()
                    remote:FireServer(unpack(args))
                end)

                if not success then
                    warn("[Auto Claim] เกิดข้อผิดพลาด:", err)
                end

                task.wait(math.random(3, 6)) -- รอแบบสุ่มเวลา
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
