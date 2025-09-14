-- สร้าง ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- สร้าง Frame หลัก
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- มุมโค้ง
local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 8)

-- ปุ่มลาก (เพื่อรองรับการลาก)
local drag = Instance.new("TextButton")
drag.Size = UDim2.new(1, 0, 0, 30)
drag.BackgroundTransparency = 1
drag.Text = ""
drag.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Text = "TITLE"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -60, 0, 30) -- ลดขนาดเพราะมี 2 ปุ่ม
title.Position = UDim2.new(0, 10, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame
-- ปุ่มปิด (X)
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ปุ่มพับ/ขยาย ()
local toggleButton = Instance.new("TextButton")
toggleButton.Text = ""
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 18
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundTransparency = 1
toggleButton.Size = UDim2.new(0, 30, 0, 30)
toggleButton.Position = UDim2.new(1, -60, 0, 0)
toggleButton.Parent = mainFrame

-- ขนาดก่อนและหลังพับ
local expandedSize = UDim2.new(0, 300, 0, 200)
local collapsedSize = UDim2.new(0, 300, 0, 30)
local isCollapsed = false

toggleButton.MouseButton1Click:Connect(function()
    isCollapsed = not isCollapsed
    mainFrame.Size = isCollapsed and collapsedSize or expandedSize
end)