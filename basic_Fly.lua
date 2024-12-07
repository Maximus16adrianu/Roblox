local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Animator = Humanoid:WaitForChild("Animator")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local StatusLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local SpeedSlider = Instance.new("Frame")
local SliderButton = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local KeybindInput = Instance.new("TextBox")  -- For the fly keybind

ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Size = UDim2.new(0, 250, 0, 160)  -- Adjusted to fit keybind input field
Frame.Position = UDim2.new(0.8, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0)

-- Add rounded corners and shadow
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

-- Status Label
StatusLabel.Size = UDim2.new(1, 0, 0.2, 0)
StatusLabel.Position = UDim2.new(0, 0, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Fly: OFF"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 18
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Parent = Frame

-- Close Button
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Frame

-- Add rounded corners to close button
local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

-- Speed Slider
SpeedSlider.Size = UDim2.new(0.8, 0, 0.1, 0)
SpeedSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
SpeedSlider.Parent = Frame
local SpeedSliderCorner = Instance.new("UICorner")
SpeedSliderCorner.CornerRadius = UDim.new(0, 8)
SpeedSliderCorner.Parent = SpeedSlider

-- Slider Button
SliderButton.Size = UDim2.new(0.1, 0, 1.5, 0)
SliderButton.Position = UDim2.new(0.5, 0, -0.25, 0)
SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderButton.Text = ""
SliderButton.Parent = SpeedSlider

local SliderButtonCorner = Instance.new("UICorner")
SliderButtonCorner.CornerRadius = UDim.new(0, 6)
SliderButtonCorner.Parent = SliderButton

-- Speed Label
SpeedLabel.Size = UDim2.new(1, 0, 0.2, 0)
SpeedLabel.Position = UDim2.new(0, 0, 0.7, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed: 50"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 16
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Parent = Frame

-- Keybind Input (TextBox)
KeybindInput.Size = UDim2.new(0.8, 0, 0.2, 0)
KeybindInput.Position = UDim2.new(0.1, 0, 0.9, 0)
KeybindInput.BackgroundColor3 = Color3.new(0.137255, 0.125490, 0.125490)
KeybindInput.TextColor3 = Color3.new(0.709804, 0.678431, 0.678431)
KeybindInput.TextSize = 14
KeybindInput.Font = Enum.Font.Gotham
KeybindInput.PlaceholderText = "Press a key for fly"
KeybindInput.ClearTextOnFocus = false
KeybindInput.Parent = Frame

-- Hover Effects
CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

SliderButton.MouseEnter:Connect(function()
    SliderButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
end)

SliderButton.MouseLeave:Connect(function()
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Variables
local Flying = false
local Speed = 50
local DragStart
local StartPos
local SliderDragging = false
local CurrentAnim
local FlyKeybind = Enum.KeyCode.F  -- Default fly keybind

-- Functions
local function ApplyVelocity(Direction)
    if Direction.Magnitude > 0 then
        Direction = Direction.Unit * Speed
    end
    RootPart.AssemblyLinearVelocity = Direction
end

local function SetupAnimations()
    -- Load idle animation
    local IdleAnim = Instance.new("Animation")
    IdleAnim.AnimationId = "rbxassetid://507766666" -- Default idle animation
    CurrentAnim = Animator:LoadAnimation(IdleAnim)
    CurrentAnim.Priority = Enum.AnimationPriority.Action
    CurrentAnim.Looped = true
end

local function UpdateFly()
    if Flying then
        -- Play idle animation
        if not CurrentAnim.IsPlaying then
            CurrentAnim:Play()
        end
        
        -- Disable character physics
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        
        local Direction = Vector3.new(0, 0, 0)
        local LookVector = workspace.CurrentCamera.CFrame.LookVector
        local RightVector = workspace.CurrentCamera.CFrame.RightVector
        
        LookVector = Vector3.new(LookVector.X, 0, LookVector.Z).Unit
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            Direction = Direction + (LookVector * 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            Direction = Direction - (LookVector * 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            Direction = Direction - (RightVector * 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            Direction = Direction + (RightVector * 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            Direction = Direction + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            Direction = Direction - Vector3.new(0, 1, 0)
        end
        
        ApplyVelocity(Direction)
        
        -- Keep character upright and prevent rotation
        RootPart.CFrame = CFrame.new(RootPart.Position, RootPart.Position + LookVector)
        Humanoid.AutoRotate = false
        
    else
        -- Re-enable character physics
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        Humanoid.AutoRotate = true
        
        if CurrentAnim and CurrentAnim.IsPlaying then
            CurrentAnim:Stop()
        end
    end
end

-- Event Connections
UserInputService.InputBegan:Connect(function(Input, GameProcessed)
    if Input.KeyCode == FlyKeybind and not GameProcessed then
        Flying = not Flying
        StatusLabel.Text = Flying and "Fly: ON" or "Fly: OFF"
        
        if Flying then
            Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        else
            -- Reset velocity and ensure normal physics
            RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            wait(0.1) -- Small delay to ensure state changes smoothly
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            wait(0.1)
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
end)

-- Keybind change handler
KeybindInput.Focused:Connect(function()
    KeybindInput.Text = ""  -- Clear placeholder text when focused
end)

KeybindInput.FocusLost:Connect(function()
    if KeybindInput.Text and #KeybindInput.Text > 0 then
        local NewKey = Enum.KeyCode[KeybindInput.Text:upper()]
        if NewKey then
            FlyKeybind = NewKey
            KeybindInput.Text = "Fly key: " .. FlyKeybind.Name
        else
            KeybindInput.Text = "Invalid key"
        end
    else
        KeybindInput.Text = "Press a key for fly"
    end
end)

local function UpdateSlider(Input)
    if SliderDragging then
        local MousePosition = UserInputService:GetMouseLocation()
        local SliderPosition = SpeedSlider.AbsolutePosition
        local SliderSize = SpeedSlider.AbsoluteSize
        
        local NewX = math.clamp((MousePosition.X - SliderPosition.X) / SliderSize.X, 0, 1)
        SliderButton.Position = UDim2.new(NewX, 0, SliderButton.Position.Y.Scale, 0)
        
        Speed = math.floor(NewX * 200)
        SpeedLabel.Text = "Speed: " .. tostring(Speed)
    end
end

SliderButton.MouseButton1Down:Connect(function()
    SliderDragging = true
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        SliderDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseMovement then
        UpdateSlider(Input)
    end
end)

RunService.RenderStepped:Connect(UpdateFly)

CloseButton.MouseButton1Click:Connect(function()
    if CurrentAnim then
        CurrentAnim:Stop()
    end
    ScreenGui:Destroy()
    Flying = false
    Humanoid.AutoRotate = true
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end)

Player.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
    Animator = Humanoid:WaitForChild("Animator")
    Flying = false
    StatusLabel.Text = "Fly: OFF"
    SetupAnimations()
end)

-- Initial setup
SetupAnimations()
