local Palette = require("@Shared/Palette")
local React = require("@Packages/React")

local e = React.createElement

export type FrameProps = {
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	BorderThickness: number?,
	BorderColor: Color3?,
	BorderMode: Enum.ApplyStrokeMode?,
	CornerRadius: UDim?,
	Visible: boolean?,
	children: any,
}

return function(props: FrameProps)
	return e("Frame", {
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
		Size = props.Size or UDim2.new(1, 0, 1, 0),
		Position = props.Position or UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = props.BackgroundColor3 or Palette.PRIMARY_DARK,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		Visible = props.Visible or (props.Visible == nil),
	}, {
		props.children,
		props.BorderThickness and e("UIStroke", {
			Thickness = props.BorderThickness,
			Color = props.BorderColor or Color3.new(),
			ApplyStrokeMode = props.BorderMode or Enum.ApplyStrokeMode.Contextual,
		}),
		props.CornerRadius and e("UICorner", { CornerRadius = props.CornerRadius }),
	})
end
