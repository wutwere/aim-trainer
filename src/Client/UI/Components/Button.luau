local Frame = require("./Frame")
local Palette = require("@Shared/Palette")
local React = require("@Packages/React")

local e = React.createElement

type ButtonProps = {
	OnClick: () -> any?,
} & Frame.FrameProps

return function(props: ButtonProps)
	return e("TextButton", {
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
		Size = props.Size or UDim2.new(1, 0, 1, 0),
		Position = props.Position or UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = props.BackgroundColor3 or Palette.PRIMARY_DARK,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		[React.Event.Activated] = props.OnClick,
		Text = "",
	}, {
		props.children,
		props.BorderThickness and e("UIStroke", {
			Thickness = props.BorderThickness,
			Color = props.BorderColor or Color3.new(),
			ApplyStrokeMode = props.BorderMode or Enum.ApplyStrokeMode.Border,
		}),
		props.CornerRadius and e("UICorner", { CornerRadius = props.CornerRadius }),
	})
end
