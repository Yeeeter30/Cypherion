-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptExecutor"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 25)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.Text = "Open"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 14
ToggleButton.Draggable = true
ToggleButton.Active = true
ToggleButton.Parent = ScreenGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false  -- Initially hidden
MainFrame.Draggable = true
MainFrame.Active = true
MainFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 25)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BorderSizePixel = 0
Title.Text = "Cypherion Executor GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 16
Title.Parent = MainFrame

-- Script TextBox
local ScriptBox = Instance.new("TextBox")
ScriptBox.Size = UDim2.new(1, -20, 1, -70)
ScriptBox.Position = UDim2.new(0, 10, 0, 30)
ScriptBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ScriptBox.BorderSizePixel = 0
ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptBox.Font = Enum.Font.SourceSans
ScriptBox.TextSize = 14
ScriptBox.TextWrapped = true
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.ClearTextOnFocus = false
ScriptBox.MultiLine = true
ScriptBox.Text = 'print("Hello, World")'
ScriptBox.Parent = MainFrame

-- Execute Button
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Size = UDim2.new(0, 85, 0, 25)
ExecuteButton.Position = UDim2.new(0, 10, 1, -30)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.Font = Enum.Font.SourceSans
ExecuteButton.TextSize = 14
ExecuteButton.Parent = MainFrame

-- Clear Button
local ClearButton = Instance.new("TextButton")
ClearButton.Size = UDim2.new(0, 85, 0, 25)
ClearButton.Position = UDim2.new(0, 105, 1, -30)
ClearButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ClearButton.BorderSizePixel = 0
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.SourceSans
ClearButton.TextSize = 14
ClearButton.Parent = MainFrame

-- Copy Button
local CopyButton = Instance.new("TextButton")
CopyButton.Size = UDim2.new(0, 85, 0, 25)
CopyButton.Position = UDim2.new(0, 200, 1, -30)
CopyButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CopyButton.BorderSizePixel = 0
CopyButton.Text = "Copy"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.SourceSans
CopyButton.TextSize = 14
CopyButton.Parent = MainFrame

-- Button Functions
ExecuteButton.MouseButton1Click:Connect(function()
    local scriptText = ScriptBox.Text
    loadstring(scriptText)()
end)

ClearButton.MouseButton1Click:Connect(function()
    ScriptBox.Text = ""
end)

CopyButton.MouseButton1Click:Connect(function()
    setclipboard(ScriptBox.Text)
end)

-- Toggle GUI visibility with Toggle Button and M key
local guiVisible = false
local function toggleGUI()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    ToggleButton.Text = guiVisible and "Close" or "Open"
end

ToggleButton.MouseButton1Click:Connect(toggleGUI)

-- M Keybind to toggle GUI visibility
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.M then
        toggleGUI()
    end
end)