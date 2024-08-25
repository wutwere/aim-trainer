local Bindable = require("@Shared/Bindable")

local public = {
	Open = Bindable.new(true),
}

function public:SetMenuOpen(open: boolean)
	self.Open:SetValue(open)
	task.delay(5, function()
		self.Open:SetValue(not open)
	end)
end

return public
