local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Text = script.Parent

-- Function to convert large numbers --
local function moneyConversion(moneyAmount)

    local moneyConverted = tostring(moneyAmount)

    if moneyAmount < 10^3 then return moneyConverted end

    if moneyAmount >= 10^9 then
        moneyConverted = string.format("%.2f", moneyAmount / 10^9).."B"
    elseif moneyAmount >= 10^6 then
        moneyConverted = string.format("%.2f", moneyAmount / 10^6).."M"
    elseif moneyAmount >= 10^3 then
        moneyConverted = string.format("%.2f", moneyAmount / 10^3).."K"
    end
    return (moneyConverted)
end

while task.wait(.1) do
    local money = Player.leaderstats.Coins.Value
    Text.Text = moneyConversion(money)
end