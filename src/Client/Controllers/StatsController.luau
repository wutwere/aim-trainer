local Bindable = require("@Shared/Bindable")

local public = {
	Headshots = Bindable.new(0),
	Bodyshots = Bindable.new(0),
	TotalShots = Bindable.new(0),
}

return public
