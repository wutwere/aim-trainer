local React = require("@Packages/React")
local ReactRoblox = require("@Packages/ReactRoblox")

local app = require("@Client/UI/Components/App")

return {
	react = React,
	reactRoblox = ReactRoblox,
	controls = {},
	story = function(props: { [string]: any })
		local component = React.createElement(app, {})
		return component
	end,
}
