export type Bindable<T> = {
	Bind: (Bindable<T>, (T) -> nil) -> RBXScriptConnection,
	SetValue: (Bindable<T>, T) -> nil,
	UpdateValue: (Bindable<T>, (T) -> T) -> nil,
	GetValue: (Bindable<T>) -> T,
}

return {
	new = function<T>(defaultValue: T): Bindable<T>
		local currentValue: T = defaultValue
		local event = Instance.new("BindableEvent")
		local obj = {}
		function obj:Bind(callback: (T) -> nil)
			return event.Event:Connect(callback)
		end
		function obj:SetValue(newValue: T)
			currentValue = newValue
			event:Fire(newValue)
		end
		function obj:UpdateValue(updater: (T) -> T)
			self:SetValue(updater(currentValue))
		end
		function obj:GetValue()
			return currentValue
		end
		return obj
	end,
}
