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