local CharacterService = require("./Services/CharacterService")

-- Start Services
for i, service in { CharacterService } :: { { Start: (any) -> () } } do
	task.spawn(function()
		service:Start()
	end)
end
