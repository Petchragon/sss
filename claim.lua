local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ตั้งค่า Remote และ Args
local remote = game:GetService("ReplicatedStorage").Connections:WaitForChild("Claim_Sam")
local args = { "Claim1" }

-- ฟังก์ชัน Auto Claim Loop
task.spawn(function()
    while true do
        task.wait(3)
        if autoClaim then
            remote:FireServer(unpack(args))
        end
    end
end)