local DataStorageService = game:GetService("DataStoreService")
local dataStorage = DataStorageService:GetDataStore("Earnings")
local Players = game:GetService("Players")

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
        data = dataStorage:GetAsync(player.UserId)
    end)
    if success then
        -- I personnaly use math.floor because I want no decimals
        local timeDiff = math.floor(tick() - data[1])
        --timeDiff = math.floor(timeDiff / 60) -- Decomment this line to get 1 minute = 1 coin
        player.leaderstats.Coins.Value += timeDiff -- You can divide the value, here it's 1 second = 1 coin
    end
end)

-- Save current time when player leave or server close
local function saveTick(player)
    local leaveTime = tick()

    local success, err = pcall(function()
        dataStorage:SetAsync(player.UserId, {leaveTime})
    end)
end

Players.PlayerRemoving:Connect(function(player)
    saveTick(player)
end)

game:BindToClose(function()
    for _, player in Players:GetPlayers() do
        saveTick(player)
    end
end)
