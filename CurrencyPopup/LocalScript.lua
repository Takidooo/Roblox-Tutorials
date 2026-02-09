-- Services --
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Replicated Event --
local MoneyGuiRE = ReplicatedStorage:WaitForChild("MoneyGui")

local Frame = script.Parent
local CoinImage = Frame:WaitForChild("ImageLabel")
local MoneyText = Frame:WaitForChild("TextLabel")

-- Function to convert large numbers --
local function moneyConversion(moneyAmount)

	local moneyConverted = tostring(moneyAmount)

	if moneyAmount < 1000 then return moneyConverted end

	if moneyAmount >= 1000000000 then
		moneyConverted = tostring(moneyAmount / 1000000000).."B"
	elseif moneyAmount >= 1000000 then
		moneyConverted = tostring(moneyAmount / 1000000).."M"
	elseif moneyAmount >= 1000 then
		moneyConverted = tostring(moneyAmount / 1000).."K"
	end

	return (moneyConverted)

end

-- When MoneyGuiRE is called in GivePlatform > GiveMoney script --
MoneyGuiRE.OnClientEvent:Connect(function(moneyAmount)
	-- Set random X and Y values for the GUI --
	local randX = math.random(-4.5, 4.5)
	local randY = math.random(-1, 1)

	Frame.Visible = true

	-- Set CoinImage --
	CoinImage.ImageTransparency = 0
	CoinImage.Position = UDim2.new(randX, 0, randY, 0)

	-- Set MoneyText --
	MoneyText.TextTransparency = 0
	MoneyText.Text = moneyConversion(moneyAmount)
	MoneyText.Position = UDim2.new(randX, 0, randY + .8, 0)

	-- Animate CoinImage --
	TweenService:Create(CoinImage, TweenInfo.new(2), {ImageTransparency = 1}):Play()
	TweenService:Create(CoinImage, TweenInfo.new(2), {Position = UDim2.new(randX, 0, randY -1, 0)}):Play()

	-- Animate MoneyText --
	TweenService:Create(MoneyText, TweenInfo.new(2), {TextTransparency = 1}):Play()
	TweenService:Create(MoneyText, TweenInfo.new(2), {Position = UDim2.new(randX, 0, randY -0.25, 0)}):Play()

end)