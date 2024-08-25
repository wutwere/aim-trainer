local Fonts = require("@Shared/Fonts")
local Palette = require("@Shared/Palette")
local React = require("@Packages/React")

local e = React.createElement

export type TextProps = {
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
	RichText: boolean?,
	Text: string?,
	TextColor3: Color3?,
	TextScaled: boolean?,
	Font: Font?,
}

return function(props: TextProps)
	return e("TextLabel", {
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
		Size = props.Size or UDim2.new(0.8, 0, 0.8, 0),
		Position = props.Position or UDim2.new(0.5, 0, 0.5, 0),
		Text = props.Text or "UNDEFINED",
		Font = props.Font or Fonts.HEADER1,
		RichText = props.RichText or true,
		TextScaled = props.TextScaled or true,
		TextColor3 = props.TextColor3 or Palette.WHITE,
		BackgroundTransparency = 1,
	})
end
