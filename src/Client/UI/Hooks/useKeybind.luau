local React = require("@Packages/React")

local UserInputService = game:GetService("UserInputService")

local function useKeybind<T>(key: Enum.KeyCode)
	local pressed, setPressed = React.useState(UserInputService:IsKeyDown(key))

	React.useEffect(function()
		local connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then
				return
			end
			if input.KeyCode == key then
				setPressed(true)
			end
		end)
		local connection2 = UserInputService.InputEnded:Connect(function(input, gameProcessed)
			if gameProcessed then
				return
			end
			if input.KeyCode == key then
				setPressed(false)
			end
		end)
		return function()
			connection:Disconnect()
			connection2:Disconnect()
		end
	end, {})

	return pressed
end

return useKeybind
