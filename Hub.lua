--// ADVANCED HUB V3 (SCROLLING + SMALL UI)

if getgenv().AdvancedHubLoaded then
    return
end
getgenv().AdvancedHubLoaded = true

--// SERVICES
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TS = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")

--// PLAYER
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

--// SETTINGS
local KEY = "lucabom101"

local Settings = {
    WalkSpeed = 16,
    FlySpeed = 60,
    Fly = false,
    Noclip = false,
    ESP = false,
    InfiniteJump = false,
    Fullbright = false
}

--// UPDATE CHARACTER
local function UpdateCharacter()
    Character = Player.Character or Player.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end

Player.CharacterAdded:Connect(function()
    task.wait(1)
    UpdateCharacter()
end)

--// GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdvancedHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

--// OPEN BUTTON
local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0,55,0,55)
OpenButton.Position = UDim2.new(0,15,0.5,-27)
OpenButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
OpenButton.Text = "⚙️"
OpenButton.TextScaled = true
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.Visible = false
OpenButton.Draggable = true
OpenButton.Parent = ScreenGui

Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1,0)

--// KEY SYSTEM
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0,300,0,200)
KeyFrame.Position = UDim2.new(0.5,-150,0.5,-100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
KeyFrame.Parent = ScreenGui

Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,45)
Title.BackgroundTransparency = 1
Title.Text = "🔐 ADVANCED HUB"
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(0,170,255)
Title.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1,-20,0,40)
KeyBox.Position = UDim2.new(0,10,0,60)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.Text = ""
KeyBox.TextScaled = true
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Parent = KeyFrame

Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0,8)

local Submit = Instance.new("TextButton")
Submit.Size = UDim2.new(1,-20,0,40)
Submit.Position = UDim2.new(0,10,0,110)
Submit.BackgroundColor3 = Color3.fromRGB(0,170,255)
Submit.Text = "SUBMIT"
Submit.TextScaled = true
Submit.TextColor3 = Color3.new(1,1,1)
Submit.Parent = KeyFrame

Instance.new("UICorner", Submit).CornerRadius = UDim.new(0,8)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1,0,0,25)
Status.Position = UDim2.new(0,0,0,160)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextScaled = true
Status.TextColor3 = Color3.new(1,0,0)
Status.Parent = KeyFrame

--// MAIN HUB
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,260,0,320)
Main.Position = UDim2.new(0.5,-130,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

--// HEADER
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1,0,0,45)
Header.BackgroundTransparency = 1
Header.Text = "⚙️ ADVANCED HUB"
Header.TextScaled = true
Header.Font = Enum.Font.GothamBold
Header.TextColor3 = Color3.fromRGB(0,170,255)
Header.Parent = Main

--// MINIMIZE
local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0,35,0,35)
Minimize.Position = UDim2.new(1,-40,0,5)
Minimize.BackgroundColor3 = Color3.fromRGB(40,40,40)
Minimize.Text = "-"
Minimize.TextScaled = true
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Parent = Main

Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1,0)

Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenButton.Visible = false
end)

--// SCROLL FRAME
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1,-10,1,-55)
Scroll.Position = UDim2.new(0,5,0,50)
Scroll.CanvasSize = UDim2.new(0,0,0,0)
Scroll.ScrollBarThickness = 4
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.Parent = Main

--// LIST
local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0,8)
UIList.Parent = Scroll

UIList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0,0,0,UIList.AbsoluteContentSize.Y + 10)
end)

--// BUTTON FUNCTION
local function CreateButton(Name, Callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1,-10,0,40)
    Button.BackgroundColor3 = Color3.fromRGB(35,35,35)
    Button.TextColor3 = Color3.new(1,1,1)
    Button.TextScaled = true
    Button.Font = Enum.Font.GothamBold
    Button.Text = Name
    Button.Parent = Scroll

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0,8)

    Button.MouseButton1Click:Connect(Callback)

    return Button
end

--// NOCLIP
local NoclipConnection

CreateButton("🚫 Noclip", function()
    Settings.Noclip = not Settings.Noclip

    if Settings.Noclip then
        NoclipConnection = RS.Stepped:Connect(function()
            for _,v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    else
        if NoclipConnection then
            NoclipConnection:Disconnect()
        end
    end
end)

--// FLY
local FlyConnection

CreateButton("🕊 Fly", function()
    Settings.Fly = not Settings.Fly

    if Settings.Fly then
        local BV = Instance.new("BodyVelocity")
        BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
        BV.Parent = RootPart

        local BG = Instance.new("BodyGyro")
        BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
        BG.Parent = RootPart

        FlyConnection = RS.RenderStepped:Connect(function()
            BG.CFrame = workspace.CurrentCamera.CFrame

            local Direction = Vector3.zero

            if UIS:IsKeyDown(Enum.KeyCode.W) then
                Direction += workspace.CurrentCamera.CFrame.LookVector
            end

            if UIS:IsKeyDown(Enum.KeyCode.S) then
                Direction -= workspace.CurrentCamera.CFrame.LookVector
            end

            if UIS:IsKeyDown(Enum.KeyCode.A) then
                Direction -= workspace.CurrentCamera.CFrame.RightVector
            end

            if UIS:IsKeyDown(Enum.KeyCode.D) then
                Direction += workspace.CurrentCamera.CFrame.RightVector
            end

            if Direction.Magnitude > 0 then
                BV.Velocity = Direction.Unit * Settings.FlySpeed
            else
                BV.Velocity = Vector3.zero
            end
        end)
    else
        if FlyConnection then
            FlyConnection:Disconnect()
        end

        for _,v in pairs(RootPart:GetChildren()) do
            if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
                v:Destroy()
            end
        end
    end
end)

--// SPEED
CreateButton("⚡ Speed +", function()
    Settings.WalkSpeed += 5
    Humanoid.WalkSpeed = Settings.WalkSpeed
end)

CreateButton("⚡ Speed -", function()
    Settings.WalkSpeed -= 5
    Humanoid.WalkSpeed = Settings.WalkSpeed
end)

--// INFINITE JUMP
CreateButton("🦘 Infinite Jump", function()
    Settings.InfiniteJump = not Settings.InfiniteJump
end)

UIS.JumpRequest:Connect(function()
    if Settings.InfiniteJump then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

--// FULLBRIGHT
CreateButton("💡 Fullbright", function()
    Lighting.Brightness = 5
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end)

--// ESP
local function AddESP(Target)
    if not Target.Character then
        return
    end

    if Target.Character:FindFirstChild("Highlight") then
        return
    end

    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(0,255,0)
    Highlight.OutlineColor = Color3.new(1,1,1)
    Highlight.FillTransparency = 0.5
    Highlight.Parent = Target.Character
end

CreateButton("👁 ESP", function()
    Settings.ESP = not Settings.ESP

    if Settings.ESP then
        for _,v in pairs(Players:GetPlayers()) do
            if v ~= Player then
                AddESP(v)
            end
        end
    else
        for _,v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Highlight") then
                v.Character.Highlight:Destroy()
            end
        end
    end
end)

--// REJOIN
CreateButton("🔄 Rejoin", function()
    TS:Teleport(game.PlaceId, Player)
end)

--// FULL RESET
CreateButton("❌ Destroy Hub", function()
    ScreenGui:Destroy()
    getgenv().AdvancedHubLoaded = false
end)

--// KEY CHECK
Submit.MouseButton1Click:Connect(function()
    if KeyBox.Text == KEY then
        Status.TextColor3 = Color3.fromRGB(0,255,0)
        Status.Text = "ACCESS GRANTED"

        task.wait(1)

        KeyFrame.Visible = false
        Main.Visible = true
    else
        Status.Text = "WRONG KEY"
    end
end)

print("Advanced Hub V3 Loaded")
