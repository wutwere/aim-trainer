local Frame = require("./Frame")
local Menu = require("./Menu")
local React = require("@Packages/React")
local Stats = require("./Stats")

local e = React.createElement

return function()
	return e(Frame, {}, {
		e(Menu),
		e(Stats),
	})
end
