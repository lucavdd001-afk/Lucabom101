--// Luca Hub - Mobile Friendly
--// Key: lucabom101

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LucaHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- MAIN LOGIN FRAME
local login = Instance.new("Frame")
login.Size = UDim2.new(0,260,0,170)
login.Position = UDim2.new(0.5,-130,0.5,-85)
login.BackgroundColor3 = Color3.fromRGB(20,20,20)
login.Active = true
login.Draggable = true
login.Parent = gui

local corner = Instance.new("UICorner", login)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Luca Hub"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = login

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0.35,0)
keyBox.PlaceholderText = "Enter Key"
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.Parent = login
Instance.new("UICorner", keyBox)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,0.63,0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.new(1,1,1)
status.TextScaled = true
status.Parent = login

local unlock = Instance.new("TextButton")
unlock.Size = UDim2.new(0.6,0,0,40)
unlock.Position = UDim2.new(0.2,0,0.75,0)
unlock.Text = "Unlock"
unlock.TextScaled = true
unlock.BackgroundColor3 = Color3.fromRGB(45,45,45)
unlock.TextColor3 = Color3.new(1,1,1)
unlock.Parent = login
Instance.new("UICorner", unlock)

-- HUB FRAME
local hub = Instance.new("Frame")
hub.Size = UDim2.new(0,300,0,260)
hub.Position = UDim2.new(0.5,-150,0.5,-130)
hub.BackgroundColor3 = Color3.fromRGB(20,20,20)
hub.Visible = false
hub.Active = true
hub.Draggable = true
hub.Parent = gui
Instance.new("UICorner", hub)

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1,0,0,40)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "Luca Hub"
hubTitle.TextScaled = true
hubTitle.Font = Enum.Font.GothamBold
hubTitle.TextColor3 = Color3.new(1,1,1)
hubTitle.Parent = hub

-- SCROLLING FRAME
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-10,1,-50)
scroll.Position = UDim2.new(0,5,0,45)
scroll.CanvasSize = UDim2.new(0,0,0,500)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1
scroll.Parent = hub

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,8)

-- FUNCTION TO CREATE TOGGLES
local function createToggle(name, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1,-10,0,45)
	button.BackgroundColor3 = Color3.fromRGB(35,35,35)
	button.TextColor3 = Color3.new(1,1,1)
	button.TextScaled = true
	button.Font = Enum.Font.Gotham
	button.Text = name .. " OFF"
	button.Parent = scroll
	Instance.new("UICorner", button)

	local enabled = false

	button.MouseButton1Click:Connect(function()
		enabled = not enabled
		button.Text = name .. (enabled and " ON" or " OFF")
		callback(enabled)
	end)
end

-- AUTO NUGGET FARM
local nuggetFarm = false
