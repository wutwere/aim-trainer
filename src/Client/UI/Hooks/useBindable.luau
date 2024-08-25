local Bindable = require("@Shared/Bindable")
local React = require("@Packages/React")

local function useBindable<T>(bindable: Bindable.Bindable<T>)
	local value, setValue = React.useState(bindable:GetValue())

	React.useEffect(function()
		local connection = bindable:Bind(function(newValue)
			setValue(newValue)
		end)
		return function()
			connection:Disconnect()
		end
	end, {})

	return value
end

return useBindable
