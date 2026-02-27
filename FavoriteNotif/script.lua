local AvatarEditorServce = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

Player.CharacterAdded:Connect(function(character)
    AvatarEditorServce:PromptSetFavorite(125050658582803, Enum.AvatarItemType.Asset, true)
end)local AvatarEditorServce = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

Player.CharacterAdded:Connect(function(character)
    AvatarEditorServce:PromptSetFavorite(125050658582803, Enum.AvatarItemType.Asset, true)
end)