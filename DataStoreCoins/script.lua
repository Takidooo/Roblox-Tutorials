local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local dataStorage = DataStoreService:GetDataStore("MyDataStore")

-- Add leaderstats and Coins inside for each player
Players.PlayerAdded:Connect(function(player)
 local leaderstats = Instance.new("Folder")
 leaderstats.Name = "leaderstats"
 leaderstats.Parent = player

 local coins = Instance.new("IntValue")
 coins.Name = "Coins"
 coins.Parent = leaderstats
 coins.Value = 0

 local data
 local success, err = pcall(function()
  data = dataStorage:GetAsync(player.UserId, table)
 end)
 if success then
  player.leaderstats.Coins.Value = data[1]
 end
end)

local function saveData(player)
 local table = {
  player.leaderstats.Coins.Value
 }
 local success, err = pcall(function()
  dataStorage:SetAsync(player.UserId, table)
 end)
end

Players.PlayerRemoving:Connect(function(player)
 saveData(player)
end)

game:BindToClose(function()
 for _, player in pairs(Players:GetPlayers()) do
  saveData(player)
 end
end)