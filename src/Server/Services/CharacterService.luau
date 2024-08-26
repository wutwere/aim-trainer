local public = {}

local function OnCharacterAdded(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	local currentDescription = humanoid:GetAppliedDescription()
	currentDescription.Head = 0
	currentDescription.Torso = 0
	currentDescription.LeftArm = 0
	currentDescription.RightArm = 0
	currentDescription.LeftLeg = 0
	currentDescription.RightLeg = 0
	humanoid:ApplyDescription(currentDescription)
end

local function OnPlayerAdded(player: Player)
	player.CharacterAdded:Connect(OnCharacterAdded)
	if player.Character then
		task.spawn(OnCharacterAdded, player.Character)
	end
end

function public:Start()
	game:GetService("Players").PlayerAdded:Connect(OnPlayerAdded)
	for i, player in game:GetService("Players"):GetPlayers() do
		task.spawn(OnPlayerAdded, player)
	end
end

return public
