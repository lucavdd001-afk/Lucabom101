--// Luca Hub - Mobile Friendly
--// Key: lucabom101

local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "LucaHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- LOGIN FRAME
local login = Instance.new("Frame")
login.Size = UDim2.new(0,260,0,170)
login.Position = UDim2.new(0.5,-130,0.5,-85)
login.BackgroundColor3 = Color3.fromRGB(20,20,20)
login.BorderSizePixel = 0
login.Active = true
login.Draggable = true
login.Parent = gui

Instance.new("UICorner", login)

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Luca Hub"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = login

-- KEY BOX
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0.35,0)
keyBox.PlaceholderText = "Enter Key"
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.Font = Enum.Font.Gotham
keyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.BorderSizePixel = 0
keyBox.Parent = login

Instance.new("UICorner", keyBox)

-- STATUS
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,0.63,0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextScaled = true
status.Font = Enum.Font.Gotham
status.TextColor3 = Color3.new(1,1,1)
status.Parent = login

-- UNLOCK BUTTON
local unlock = Instance.new("TextButton")
unlock.Size = UDim2.new(0.6,0,0,40)
unlock.Position = UDim2.new(0.2,0,0.75,0)
unlock.Text = "Unlock"
unlock.TextScaled = true
unlock.Font = Enum.Font.GothamBold
unlock.BackgroundColor3 = Color3.fromRGB(45,45,45)
unlock.TextColor3 = Color3.new(1,1,1)
unlock.BorderSizePixel = 0
unlock.Parent = login

Instance.new("UICorner", unlock)

-- HUB
local hub = Instance.new("Frame")
hub.Size = UDim2.new(0,300,0,260)
hub.Position = UDim2.new(0.5,-150,0.5,-130)
hub.BackgroundColor3 = Color3.fromRGB(20,20,20)
hub.BorderSizePixel = 0
hub.Visible = false
hub.Active = true
hub.Draggable = true
hub.Parent = gui

Instance.new("UICorner", hub)

-- HUB TITLE
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1,0,0,40)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "Luca Hub"
hubTitle.TextScaled = true
hubTitle.Font = Enum.Font.GothamBold
hubTitle.TextColor3 = Color3.new(1,1,1)
hubTitle.Parent = hub

-- CLOSE BUTTON
local close = Instance.new("TextButton")
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.TextScaled = true
close.Font = Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(255,60,60)
close.TextColor3 = Color3.new(1,1,1)
close.BorderSizePixel = 0
close.Parent = hub

Instance.new("UICorner", close)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- SCROLL FRAME
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-10,1,-50)
scroll.Position = UDim2.new(0,5,0,45)
scroll.CanvasSize = UDim2.new(0,0,0,500)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1
scroll.Parent = hub

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,8)
layout.Parent = scroll

-- TOGGLE CREATOR
local function createToggle(name, callback)

	local button = Instance.new("TextButton")

	button.Size = UDim2.new(1,-10,0,45)
	button.BackgroundColor3 = Color3.fromRGB(35,35,35)
	button.TextColor3 = Color3.new(1,1,1)
	button.TextScaled = true
	button.Font = Enum.Font.Gotham
	button.Text = name .. " OFF"
	button.BorderSizePixel = 0
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

createToggle("Auto Nugget Farm", function(state)
	nuggetFarm = state
end)

task.spawn(function()

	while task.wait(0.2) do

		if nuggetFarm then

			local nuggets = workspace:FindFirstChild("Nuggets")

			if nuggets and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

				for _, nugget in pairs(nuggets:GetChildren()) do

					if nugget:IsA("BasePart") then

						player.Character.HumanoidRootPart.CFrame =
							nugget.CFrame + Vector3.new(0,3,0)

						task.wait(0.15)

					end
				end
			end
		end
	end
end)

-- EXAMPLE TOGGLES
createToggle("Auto Sell", function(state)
	print("Auto Sell:", state)
end)

createToggle("ESP", function(state)
	print("ESP:", state)
end)

createToggle("WalkSpeed", function(state)

	if player.Character and player.Character:FindFirstChild("Humanoid") then

		if state then
			player.Character.Humanoid.WalkSpeed = 32
		else
			player.Character.Humanoid.WalkSpeed = 16
		end
	end
end)

-- KEY SYSTEM
unlock.MouseButton1Click:Connect(function()

	if keyBox.Text == "lucabom101" then

		status.Text = "Correct Key!"
		status.TextColor3 = Color3.fromRGB(0,255,0)

		task.wait(0.5)

		login.Visible = false
		hub.Visible = true

	else

		status.Text = "Wrong Key!"
		status.TextColor3 = Color3.fromRGB(255,0,0)

	end
end)
