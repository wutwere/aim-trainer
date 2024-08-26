local Bindable = require("@Shared/Bindable")
local CameraController = require("./CameraController")
local CharacterController = require("./CharacterController")
local DamageController = require("./DamageController")
local InputController = require("./InputController")
local SoundController = require("./SoundController")
local Sounds = require("@Shared/Sounds")
local StatsController = require("./StatsController")
local TweenController = require("./TweenController")

local MAX_BULLET_DISTANCE = 1000
local BULLET_VFX_SPEED = 500
local GUN_COOLDOWN = 1 / 10

local RunService = game:GetService("RunService")

local public = {
	Open = Bindable.new(true),
}

local function CreateBullet(width: number)
	local light = Instance.new("PointLight")
	light.Color = Color3.new(1, 0, 0)
	light.Brightness = 2
	local attach0 = Instance.new("Attachment")
	local attach1 = Instance.new("Attachment")
	local beam = Instance.new("Beam")
	beam.Attachment0 = attach0
	beam.Attachment1 = attach1
	beam.Brightness = 10
	beam.Color = ColorSequence.new(Color3.fromRGB(255, 70, 0))
	beam.LightEmission = 1
	beam.LightInfluence = 0
	beam.Transparency = NumberSequence.new(0)
	beam.Width0 = 0
	beam.Width1 = width
	beam.FaceCamera = true

	light.Parent = attach0
	beam.Parent = attach0
	attach0.Parent = workspace.Terrain
	attach1.Parent = workspace.Terrain
	return attach0, attach1, light
end

local function Raycast(start: Vector3, direction: Vector3): (Part?, Vector3)
	direction = direction.Unit * MAX_BULLET_DISTANCE
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = { CharacterController:GetCharacter() }
	local result = workspace:Raycast(start, direction, params)
	if result and result.Instance then
		return result.Instance, result.Position
	else
		return nil, start + direction
	end
end

local function AnimateBullet(start: Vector3, dest: Vector3)
	local attach0, attach1, light = CreateBullet(math.clamp((start - dest).Magnitude * 3 / BULLET_VFX_SPEED, 0.3, 2))
	attach0.CFrame = CFrame.new(start)
	attach1.CFrame = CFrame.new(dest)
	task.wait(TweenController:TweenVelocity(attach0 :: any, dest, BULLET_VFX_SPEED))
	task.wait(TweenController:TweenDefault(light, 0.5, { Brightness = 0 }))
	attach0:Destroy()
	attach1:Destroy()
end

local lastShootTime = 0

function public:TryShoot()
	local now = tick()
	if now - GUN_COOLDOWN < lastShootTime then
		return
	end
	lastShootTime = now
	local camCF = CameraController:GetCameraCFrame()
	local direction = camCF.LookVector
	local part, dest = Raycast(camCF.Position, direction)
	if part then
		DamageController:TryDamage(part)
	end
	SoundController:PlayLocalSound(Sounds.AK47_SHOOT)
	StatsController.TotalShots:UpdateValue(function(val)
		return val + 1
	end)
	AnimateBullet((camCF * CFrame.new(1, -2, 0)).Position, dest)
end

function public:Start()
	RunService.Stepped:Connect(function()
		if InputController:IsMouseDown(Enum.UserInputType.MouseButton1) then
			self:TryShoot()
		end
	end)
end

return public
