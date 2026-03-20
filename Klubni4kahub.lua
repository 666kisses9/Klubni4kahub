
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "FullscreenMessage"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.85
overlay.BorderSizePixel = 0
overlay.Parent = gui

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 650, 0, 400)
container.Position = UDim2.new(0.5, -325, 0.5, -200)
container.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
container.BackgroundTransparency = 0.05
container.BorderSizePixel = 0
container.Parent = overlay
Instance.new("UICorner", container).CornerRadius = UDim.new(0, 20)

local stroke = Instance.new("UIStroke", container)
stroke.Color = Color3.fromRGB(255, 100, 100)
stroke.Thickness = 3
stroke.Transparency = 0.3

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 10)
title.Text = "⚠️ ВНИМАНИЕ ⚠️"
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = container

local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, -40, 0, 80)
message.Position = UDim2.new(0.5, -300, 0, 80)
message.Text = "Для скрипта переходите по ссылке"
message.BackgroundTransparency = 1
message.Font = Enum.Font.GothamSemibold
message.TextSize = 18
message.TextColor3 = Color3.fromRGB(255, 255, 255)
message.TextXAlignment = Enum.TextXAlignment.Center
message.TextWrapped = true
message.Parent = container

local linkFrame = Instance.new("Frame")
linkFrame.Size = UDim2.new(0.8, 0, 0, 50)
linkFrame.Position = UDim2.new(0.5, -260, 0, 170)
linkFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
linkFrame.BackgroundTransparency = 0
linkFrame.BorderSizePixel = 0
linkFrame.Parent = container
Instance.new("UICorner", linkFrame).CornerRadius = UDim.new(0, 10)

local glow = Instance.new("UIGradient", linkFrame)
glow.Rotation = 90
glow.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.8),
    NumberSequenceKeypoint.new(0.5, 0.4),
    NumberSequenceKeypoint.new(1, 0.8)
})

local linkText = Instance.new("TextLabel")
linkText.Size = UDim2.new(1, -20, 1, 0)
linkText.Position = UDim2.new(0, 10, 0, 0)
linkText.Text = "https://funpay.com/lots/offer?id=66159439"
linkText.BackgroundTransparency = 1
linkText.Font = Enum.Font.Gotham
linkText.TextSize = 14
linkText.TextColor3 = Color3.fromRGB(100, 200, 255)
linkText.TextXAlignment = Enum.TextXAlignment.Center
linkText.TextYAlignment = Enum.TextYAlignment.Center
linkText.Parent = linkFrame

local copyIcon = Instance.new("TextLabel")
copyIcon.Size = UDim2.new(0, 30, 0, 30)
copyIcon.Position = UDim2.new(1, -38, 0.5, -15)
copyIcon.Text = ""
copyIcon.BackgroundTransparency = 1
copyIcon.Font = Enum.Font.GothamBold
copyIcon.TextSize = 18
copyIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
copyIcon.Parent = linkFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 15)
closeBtn.Text = "✕"
closeBtn.BackgroundTransparency = 1
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
closeBtn.Parent = container
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

copyIcon.MouseButton1Click:Connect(function()
    local success = copyToClipboard("https://funpay.com/lots/offer?id=66159439")
    if success then
        copyIcon.TextColor3 = Color3.fromRGB(100, 255, 100)
        task.wait(0.2)
        copyIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
        
        local notify = Instance.new("TextLabel")
        notify.Size = UDim2.new(0, 200, 0, 40)
        notify.Position = UDim2.new(0.5, -100, 0.8, 0)
        notify.Text = "✅ Ссылка скопирована!"
        notify.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        notify.BackgroundTransparency = 0
        notify.Font = Enum.Font.GothamBold
        notify.TextSize = 14
        notify.TextColor3 = Color3.fromRGB(100, 255, 100)
        notify.TextXAlignment = Enum.TextXAlignment.Center
        notify.ZIndex = 10
        notify.Parent = overlay
        Instance.new("UICorner", notify).CornerRadius = UDim.new(0, 10)
        
        notify.BackgroundTransparency = 1
        notify.TextTransparency = 1
        for i = 1, 10 do
            task.wait(0.03)
            notify.BackgroundTransparency = 1 - (i / 10)
            notify.TextTransparency = 1 - (i / 10)
        end
        task.wait(1.5)
        for i = 1, 10 do
            task.wait(0.03)
            notify.BackgroundTransparency = i / 10
            notify.TextTransparency = i / 10
        end
        notify:Destroy()
    end
end)

task.spawn(function()
    local t = 0
    while container.Parent do
        t = t + 0.033
        local alpha = 0.3 + math.sin(t * 3) * 0.1
        stroke.Transparency = alpha
        linkFrame.BackgroundColor3 = Color3.fromRGB(25 + math.sin(t * 4) * 5, 25, 30)
        task.wait(0.033)
    end
end)

print("[Fullscreen Message] Активно. END для закрытия.")
