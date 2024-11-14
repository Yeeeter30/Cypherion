-- Create a ScreenGui in CoreGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSPingGui"
screenGui.Parent = game:GetService("CoreGui")

-- Create the main frame for the GUI
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 100, 0, 40)
mainFrame.Position = UDim2.new(0, 10, 1, -50) -- Bottom-left corner
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- FPS Label
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0.5, 0)
fpsLabel.Position = UDim2.new(0, 0, 0, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextScaled = true
fpsLabel.Text = "FPS: 0"
fpsLabel.Parent = mainFrame

-- Ping Label
local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, 0, 0.5, 0)
pingLabel.Position = UDim2.new(0, 0, 0.5, 0)
pingLabel.BackgroundTransparency = 1
pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pingLabel.TextScaled = true
pingLabel.Text = "Ping: 0 ms"
pingLabel.Parent = mainFrame

-- Update FPS and Ping
game:GetService("RunService").RenderStepped:Connect(function()
    -- Calculate FPS
    local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
    fpsLabel.Text = "FPS: " .. fps

    -- Calculate Ping
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    pingLabel.Text = "Ping: " .. ping .. " ms"
end)