-- Services --
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Replicated Event --
local MoneyGuiRE = ReplicatedStorage:WaitForChild("MoneyGui")

local part = script.Parent

-- This table will stock players who touched part --
local playerTouched = {}

-- When the part is Touched --
part.Touched:Connect(function(otherPart)
    -- Here we check if the otherPart Parent is a player by finding Humanoid --
    local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
    local playerName = otherPart.Parent.Name
    
    -- We check if the player is already in table, if it's the case he didn't waited the cooldown --
    local found = table.find(playerTouched, playerName)
    -- If it's a player and have waited the cooldown --
    if humanoid and not found then
        -- We get the Player from the Character (so we can access the leaderstats and activate animation) --
        local player = Players:FindFirstChild(playerName)
        
        if player then
            -- Put the player in the table --
            table.insert(playerTouched, playerName)
            
            -- Add money to player and fire coin animation for this specific player --
            local moneyAmount = 100
            player.leaderstats.Coins.Value += moneyAmount
            MoneyGuiRE:FireClient(player, moneyAmount)
            
            task.wait(1)
            -- Remove the player from the table --
            table.remove(playerTouched, table.find(playerTouched, playerName))
        end
    end
    
end)