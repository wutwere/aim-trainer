local Assets = require("@Shared/Assets")
local React = require("@Packages/React")
local useRem = require("../Hooks/useRem")

local e = React.createElement

type ShadowProps = {
	ImageColor3: Color3?,
	ImageTransparency: number?,
	ShadowSize: number?,
}

return function(props: ShadowProps)
	local rem = useRem()
	return e("ImageLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, rem(45) + (props.ShadowSize or rem(20)), 1, rem(45) + (props.ShadowSize or rem(20))),
		Image = Assets.UI_GLOW,
		ImageColor3 = props.ImageColor3 or Color3.new(),
		ImageTransparency = props.ImageTransparency or 0.8,
		ScaleType = Enum.ScaleType.Slice,
		SliceScale = 0.7,
		SliceCenter = Rect.new(100, 100, 100, 100),
	})
end
