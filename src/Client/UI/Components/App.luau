local Box = require("./Box")
local BoxButton = require("./BoxButton")
local Frame = require("./Frame")
local React = require("@Packages/React")
local Text = require("./Text")
local UIController = require("@Client/Controllers/UIController")
local useBindable = require("../Hooks/useBindable")
local useRem = require("../Hooks/useRem")

local e = React.createElement

return function(props: { [string]: any })
	local rem = useRem()
	local open = useBindable(UIController.Open)
	local dof = React.useMemo(function()
		local obj = Instance.new("DepthOfFieldEffect")
		obj.FarIntensity = 1
		obj.FocusDistance = 0
		obj.InFocusRadius = 8
		obj.NearIntensity = 0
		return obj
	end, {})

	React.useEffect(function()
		dof.Parent = if open then game:GetService("Lighting") else nil
	end, { open })

	return e(Frame, { Visible = open }, {
		e(Box, {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, rem(100)),
			Size = UDim2.new(0, rem(500), 0, rem(50)),
		}, {
			e(Text, { Text = "<i>RIVALS</i>  AIM TRAINER" }),
		}),
		e(BoxButton, {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, rem(400)),
			Size = UDim2.new(0, rem(200), 0, rem(50)),
			OnClick = function()
				print("PLAY")
				UIController:SetMenuOpen(false)
			end,
		}, {
			e(Text, { Text = "PLAY" }),
		}),
		e(BoxButton, {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, rem(480)),
			Size = UDim2.new(0, rem(200), 0, rem(50)),
			OnClick = function()
				print("SETTINGS")
			end,
		}, {
			e(Text, { Text = "SETTINGS" }),
		}),
	})
end
