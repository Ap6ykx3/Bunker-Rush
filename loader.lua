local linkvertiseUrl = "https://link-center.net/5303608/sGWkGoPMZYrW""

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystem"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 180)
frame.Position = UDim2.new(0.5, -175, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "AP HUB - Enter Key"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 40)
keyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
keyBox.PlaceholderText = "Key from Linkvertise"
keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.Parent = frame

local getKey = Instance.new("TextButton")
getKey.Size = UDim2.new(0.35, 0, 0, 40)
getKey.Position = UDim2.new(0.1, 0, 0.7, 0)
getKey.Text = "Get Key"
getKey.BackgroundColor3 = Color3.fromRGB(0,120,215)
getKey.TextColor3 = Color3.fromRGB(255,255,255)
getKey.Font = Enum.Font.GothamBold
getKey.TextSize = 14
getKey.Parent = frame

local verify = Instance.new("TextButton")
verify.Size = UDim2.new(0.35, 0, 0, 40)
verify.Position = UDim2.new(0.55, 0, 0.7, 0)
verify.Text = "Run"
verify.BackgroundColor3 = Color3.fromRGB(0,180,80)
verify.TextColor3 = Color3.fromRGB(255,255,255)
verify.Font = Enum.Font.GothamBold
verify.TextSize = 14
verify.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,25)
status.Position = UDim2.new(0,0,0.85,0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255,100,100)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.Parent = frame

getKey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(linkvertiseUrl)
        status.Text = "Link copied. Open it in your browser."
        task.wait(2)
        status.Text = ""
    else
        status.Text = "Manual copy: " .. linkvertiseUrl
    end
end)

verify.MouseButton1Click:Connect(function()
    local key = keyBox.Text
    if key == "" then
        status.Text = "Enter a key."
        return
    end
    status.Text = "Loading..."
    verify.Enabled = false
    getKey.Enabled = false
    
    local success, err = pcall(function()
        local scriptFunc = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/Bunker-Rush/refs/heads/main/Bunker%20Rush.lua"))
        scriptFunc(key)
    end)
    
    if not success then
        status.Text = "Error: " .. tostring(err)
        verify.Enabled = true
        getKey.Enabled = true
    else
        screenGui:Destroy()
    end
end)
