local public = {}

local function GetTestRig()
	local bot = game:GetService("ReplicatedStorage"):WaitForChild("Rig"):Clone() :: Model
	local humanoid = bot:WaitForChild("Humanoid") :: Humanoid
	humanoid.WalkSpeed = 50
	humanoid.JumpPower = 70
	bot.Parent = workspace
	return bot
end

local function RunBotBehavior(bot: Model)
	local moveFinished = true
	local humanoid = bot:WaitForChild("Humanoid") :: Humanoid
	humanoid.MoveToFinished:Connect(function()
		moveFinished = true
	end)
	while task.wait() do
		humanoid.Jump = true
		if moveFinished then
			moveFinished = false
			humanoid:MoveTo(Vector3.new(math.random(-100, 100), 0, math.random(-100, 100)))
		end
	end
end

function public:Start()
	RunBotBehavior(GetTestRig())
end

return public
