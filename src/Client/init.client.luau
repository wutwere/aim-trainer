local App = require("@Client/UI/Components/App")
local CameraController = require("./Controllers/CameraController")
local CharacterController = require("./Controllers/CharacterController")
local GunController = require("./Controllers/GunController")
local InputController = require("./Controllers/InputController")
local React = require("@Packages/React")
local ReactRoblox = require("@Packages/ReactRoblox")
local ScreenGui = require("@Client/UI/Components/ScreenGui")

-- Start Controllers
for i, controller in
	{ GunController, InputController, CharacterController, CameraController } :: { { Start: (any) -> () } }
do
	task.spawn(function()
		controller:Start()
	end)
end

-- Render the UI
local folder = Instance.new("Folder")
local root = ReactRoblox.createRoot(folder)

root:render(React.createElement(ScreenGui, {}, React.createElement(App)))
folder.Parent = game:GetService("Players").LocalPlayer.PlayerGui
