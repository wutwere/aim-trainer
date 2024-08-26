local Box = require("./Box")
local BoxButton = require("./BoxButton")
local CameraController = require("@Client/Controllers/CameraController")
local Frame = require("./Frame")
local React = require("@Packages/React")
local StatsController = require("@Client/Controllers/StatsController")
local Text = require("./Text")
local useKeybind = require("../Hooks/useKeybind")
local useRem = require("../Hooks/useRem")

local e = React.createElement

export type MenuProps = {}

return function(props: MenuProps)
	local rem = useRem()
	local open, setOpen = React.useState(true)
	local keyDown = useKeybind(Enum.KeyCode.M)

	React.useEffect(function()
		local obj
		if keyDown then
			setOpen(true)
		end
		if open then
			obj = Instance.new("DepthOfFieldEffect")
			obj.FarIntensity = 1
			obj.FocusDistance = 0
			obj.InFocusRadius = 8
			obj.NearIntensity = 0
			obj.Parent = game:GetService("Lighting")
			CameraController:SetZoom(1)
		else
			CameraController:SetZoom(0.5)
		end
		return function()
			if obj then
				obj:Destroy()
			end
		end
	end, { open, keyDown })

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
				setOpen(false)
			end,
		}, {
			e(Text, { Text = "PLAY" }),
		}),
		e(BoxButton, {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, rem(480)),
			Size = UDim2.new(0, rem(200), 0, rem(50)),
			OnClick = function()
				StatsController.Headshots:SetValue(0)
				StatsController.Bodyshots:SetValue(0)
				StatsController.TotalShots:SetValue(0)
			end,
		}, {
			e(Text, { Text = "RESET STATS" }),
		}),
	})
end
