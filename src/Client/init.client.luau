local App = require("@Client/UI/Components/App")
local React = require("@Packages/React")
local ReactRoblox = require("@Packages/ReactRoblox")
local ScreenGui = require("@Client/UI/Components/ScreenGui")

local root = ReactRoblox.createRoot(game:GetService("Players").LocalPlayer.PlayerGui)

root:render(React.createElement(ScreenGui, {}, React.createElement(App)))
