local React = require("@Packages/React")

local e = React.createElement

type ScreenGuiProps = {
	children: any?,
}

return function(props: ScreenGuiProps)
	return e(
		"ScreenGui",
		{ ResetOnSpawn = false, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling },
		props.children
	)
end
