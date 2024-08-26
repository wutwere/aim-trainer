local SoundService = game:GetService("SoundService")

local public = {}

function public:PlayLocalSound(soundId: string, volume: number?)
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	if volume then
		sound.Volume = volume
	end
	SoundService:PlayLocalSound(sound)
	task.spawn(function()
		sound.Ended:Wait()
		sound:Destroy()
	end)
end

return public
