local public = {}

local localPlayer = game:GetService("Players").LocalPlayer

function public:GetCharacter()
	return localPlayer.Character
end

local function OnCharacterAdded(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	humanoid.JumpHeight = 5
	humanoid.WalkSpeed = 22
end

function public:Start()
	localPlayer.CharacterAdded:Connect(OnCharacterAdded)
	if localPlayer.Character then
		OnCharacterAdded(localPlayer.Character)
	end
end

return public
