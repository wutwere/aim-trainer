local Frame = require("./Frame")
local Palette = require("@Shared/Palette")
local React = require("@Packages/React")
local Shadow = require("./Shadow")
local useRem = require("../Hooks/useRem")

local e = React.createElement

export type BoxProps = {
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	children: any?,
}

return function(props: BoxProps)
	local rem = useRem()
	local children = props.children
	props.children = nil
	return e(Frame, props, {
		e(Shadow),
		e(Frame, {
			BackgroundTransparency = 0,
			CornerRadius = UDim.new(0, rem(8)),
			BorderThickness = 1,
			BorderColor = Palette.WHITE,
		}),
		children,
	})
end
