local UserInputService = game:GetService("UserInputService")

local public = {}

local keyCallbacks = {}

function public:RegisterKeybind(key: Enum.KeyCode | Enum.UserInputType, callback: () -> ())
	local callbacks = keyCallbacks[key]
	if callbacks == nil then
		callbacks = {}
		keyCallbacks[key] = callbacks
	end
	table.insert(callbacks, callback)
end

function public:IsKeyDown(key: Enum.KeyCode)
	return UserInputService:IsKeyDown(key)
end

function public:IsMouseDown(key: Enum.UserInputType)
	return UserInputService:IsMouseButtonPressed(key)
end

function public:Start()
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end
		local callbacks = keyCallbacks[input.KeyCode] or keyCallbacks[input.UserInputType]
		if callbacks then
			print("HIT", input.KeyCode, input.UserInputType)
			for i, callback in callbacks do
				task.spawn(callback)
			end
		end
	end)
end

return public
