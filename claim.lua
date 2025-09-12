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
                task.wait(3)
            end
        end)
    else
        if ClaimLoopThread then
            task.cancel(ClaimLoopThread)
        end
    end
end)