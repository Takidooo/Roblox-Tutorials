-- Services --
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Replicated Event --
local MoneyGuiRE = ReplicatedStorage:WaitForChild("MoneyGui")

local part = script.Parent

local playerTouched = {}

part.Touched:Connect(function(otherPart)
    local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
    local playerName = otherPart.Parent.Name
    
    local found = table.find(playerTouched, playerName)
    if humanoid and not found then
        local player = Players:FindFirstChild(playerName)
        
        if player then
            table.insert(playerTouched, playerName)
            
            local moneyAmount = 100
            player.leaderstats.Coins.Value += moneyAmount
            MoneyGuiRE:FireClient(player, moneyAmount)
            
            task.wait(1)
            table.remove(playerTouched, table.find(playerTouched, playerName))
        end
    end
    
end)