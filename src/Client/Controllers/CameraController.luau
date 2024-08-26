local public = {}

local localPlayer = game:GetService("Players").LocalPlayer

function public:GetCurrentCamera()
	return workspace.CurrentCamera
end

function public:GetCameraCFrame()
	return self:GetCurrentCamera().CFrame
end

function public:SetZoom(zoom: number)
	if not localPlayer then
		return
	end
	localPlayer.CameraMinZoomDistance = zoom
	localPlayer.CameraMaxZoomDistance = zoom
end

function public:Start()
	local camera: Camera = self:GetCurrentCamera()
	camera.FieldOfViewMode = Enum.FieldOfViewMode.MaxAxis
	camera.MaxAxisFieldOfView = 110 * (9 ^ 2 + 16 ^ 2) ^ 0.5 / 16
end

return public
