local SoundController = require("./SoundController")
local Sounds = require("@Shared/Sounds")
local StatsController = require("./StatsController")
local TweenController = require("./TweenController")

local INTERNAL_HIGHLIGHT_ID = "__DAMAGE_HIGHLIGHT__"
local COMBO_DURATION = 0.35

local public = {}

local function AnimateDamage(character: Model)
	local highlight = character:FindFirstChild(INTERNAL_HIGHLIGHT_ID) :: Highlight
	if not highlight then
		local newHighlight = Instance.new("Highlight")
		newHighlight.Name = INTERNAL_HIGHLIGHT_ID
		newHighlight.OutlineColor = Color3.new(1, 0.3, 0.3)
		newHighlight.DepthMode = Enum.HighlightDepthMode.Occluded
		newHighlight.Parent = character
		highlight = newHighlight
	end
	highlight.FillColor = Color3.new(1, 1, 1)
	highlight.FillTransparency = 0
	highlight.OutlineTransparency = 0
	TweenController:TweenDefault(
		highlight,
		COMBO_DURATION,
		{ FillColor = Color3.new(1, 0, 0), FillTransparency = 1, OutlineTransparency = 1 }
	)
end

function public:CanDamage(part: BasePart)
	local model = part.Parent and part:FindFirstAncestorOfClass("Model")
	return model and model:FindFirstChild("Humanoid") and (model:FindFirstChild("Humanoid") :: Instance):IsA("Humanoid")
end

function public:TryDamage(part: BasePart)
	if self:CanDamage(part) then
		SoundController:PlayLocalSound(Sounds.HITMARKER, 1)
		if part.Name == "Head" then
			SoundController:PlayLocalSound(Sounds.HEADSHOT, 2)
			StatsController.Headshots:UpdateValue(function(val)
				return val + 1
			end)
		else
			StatsController.Bodyshots:UpdateValue(function(val)
				return val + 1
			end)
		end
		AnimateDamage(part.Parent :: Model)
	end
end

return public
