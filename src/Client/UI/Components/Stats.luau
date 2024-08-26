local Frame = require("./Frame")
local React = require("@Packages/React")
local StatsController = require("@Client/Controllers/StatsController")
local Text = require("./Text")
local useBindable = require("../Hooks/useBindable")
local useRem = require("../Hooks/useRem")

local e = React.createElement

return function()
	local rem = useRem()
	local headshots = useBindable(StatsController.Headshots)
	local bodyshots = useBindable(StatsController.Bodyshots)
	local total = useBindable(StatsController.TotalShots)
	return e(Frame, {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, rem(15), 1, rem(-15)),
		Size = UDim2.new(0, rem(400), 0, rem(120)),
	}, {
		e(Text, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0, rem(400), 0, rem(40)),
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = "HEADSHOTS: " .. headshots,
		}),
		e(Text, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, 0, 0, rem(40)),
			Size = UDim2.new(0, rem(400), 0, rem(40)),
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = "BODYSHOTS: " .. bodyshots,
		}),
		e(Text, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, 0, 0, rem(80)),
			Size = UDim2.new(0, rem(400), 0, rem(40)),
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = "ACCURACY: " .. (if headshots + bodyshots == 0
				then "N/A"
				else tostring((headshots + bodyshots) / total * 100):sub(1, 5)) .. "%",
		}),
	})
end
