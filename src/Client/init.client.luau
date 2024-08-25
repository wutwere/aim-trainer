local App = require("@Client/UI/Components/App")
local React = require("@Packages/React")
local ReactRoblox = require("@Packages/ReactRoblox")
local ScreenGui = require("@Client/UI/Components/ScreenGui")

local folder = Instance.new("Folder")
local root = ReactRoblox.createRoot(folder)

root:render(React.createElement(ScreenGui, {}, React.createElement(App)))
folder.Parent = game:GetService("Players").LocalPlayer.PlayerGui
