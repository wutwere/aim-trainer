local TweenService = game:GetService("TweenService")

local public = {}

function public:TweenVelocity(obj: BasePart, dest: Vector3, speed: number)
	local seconds = dest.Magnitude / speed
	local tween = TweenService:Create(
		obj,
		TweenInfo.new(seconds, Enum.EasingStyle.Linear),
		{ CFrame = obj.CFrame - obj.Position + dest }
	)
	tween:Play()
	return seconds
end

function public:TweenDefault(obj: Instance, seconds: number, propertyTable: { [string]: any })
	local tween = TweenService:Create(obj, TweenInfo.new(seconds), propertyTable)
	tween:Play()
	return seconds
end

return public
