local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")


local player = Players.LocalPlayer


local screenGui = Instance.new("ScreenGui")

screenGui.Name = "TeleportUI"

screenGui.ResetOnSpawn = false


local mainFrame = Instance.new("Frame")

mainFrame.Size = UDim2.new(0, 200, 0, 280)

mainFrame.Position = UDim2.new(0, 10, 0, 10)

mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

mainFrame.BorderSizePixel = 0

mainFrame.Active = true

mainFrame.Draggable = true

mainFrame.Parent = screenGui


local titleBar = Instance.new("Frame")

titleBar.Size = UDim2.new(1, 0, 0, 25)

titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

titleBar.BorderSizePixel = 0

titleBar.Parent = mainFrame


local titleLabel = Instance.new("TextLabel")

titleLabel.Size = UDim2.new(1, 0, 1, 0)

titleLabel.BackgroundTransparency = 1

titleLabel.Text = "传送"

titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

titleLabel.TextSize = 14

titleLabel.Font = Enum.Font.Gotham

titleLabel.Parent = titleBar


local closeButton = Instance.new("TextButton")

closeButton.Size = UDim2.new(0, 25, 0, 25)

closeButton.Position = UDim2.new(1, -25, 0, 0)

closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)

closeButton.BorderSizePixel = 0

closeButton.Text = "X"

closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.TextSize = 12

closeButton.Font = Enum.Font.GothamBold

closeButton.Parent = titleBar


local scrollFrame = Instance.new("ScrollingFrame")

scrollFrame.Size = UDim2.new(1, -10, 1, -35)

scrollFrame.Position = UDim2.new(0, 5, 0, 30)

scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

scrollFrame.BorderSizePixel = 0

scrollFrame.ScrollBarThickness = 6

scrollFrame.Parent = mainFrame


local function teleportToPlayer(targetPlayer)

local character = player.Character

local targetCharacter = targetPlayer.Character

if not character or not targetCharacter then

return false

end

local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

if not humanoidRootPart or not targetRootPart then

return false

end

local success = false

pcall(function()

humanoidRootPart.CFrame = targetRootPart.CFrame * CFrame.new(0, 0, 4)

success = true

end)

if not success then

pcall(function()

character:MoveTo(targetRootPart.Position + Vector3.new(0, 0, 4))

success = true

end)

end

return success

end


local function createPlayerButton(playerName, playerObj, index)

local button = Instance.new("TextButton")

button.Size = UDim2.new(1, -10, 0, 30)

button.Position = UDim2.new(0, 5, 0, (index - 1) * 35)

button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

button.BorderSizePixel = 0

button.Text = playerName

button.TextColor3 = Color3.fromRGB(255, 255, 255)

button.TextSize = 12

button.Font = Enum.Font.Gotham

button.AutoButtonColor = true

button.MouseEnter:Connect(function()

button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

end)

button.MouseLeave:Connect(function()

button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

end)

button.MouseButton1Click:Connect(function()

teleportToPlayer(playerObj)

end)

return button

end


local function updatePlayerList()

for _, child in ipairs(scrollFrame:GetChildren()) do

if child:IsA("TextButton") then

child:Destroy()

end

end

local playerIndex = 0

for _, otherPlayer in ipairs(Players:GetPlayers()) do

if otherPlayer ~= player then

playerIndex = playerIndex + 1

local button = createPlayerButton(otherPlayer.Name, otherPlayer, playerIndex)

button.Parent = scrollFrame

end

end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, playerIndex * 35)

end


closeButton.MouseButton1Click:Connect(function()

screenGui.Enabled = false

end)


UserInputService.InputBegan:Connect(function(input, gameProcessed)

if gameProcessed then return end

if input.KeyCode == Enum.KeyCode.RightShift then

screenGui.Enabled = not screenGui.Enabled

end

end)


if player:FindFirstChild("PlayerGui") then

screenGui.Parent = player.PlayerGui

else

player:WaitForChild("PlayerGui")

screenGui.Parent = player.PlayerGui

end


updatePlayerList()


Players.PlayerAdded:Connect(updatePlayerList)

Players.PlayerRemoved:Connect(updatePlayerList)

