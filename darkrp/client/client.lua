local config = require("resources/darkrp/config/config")

-- All Notify/ShowText


-- Notify
RegisterNetEvent("darkrp:notify")
AddEventHandler("darkrp:notify", function(msg)
 Citizen.CreateThread(function()
	Wait(1)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(true, false)
 end)
end)


-- Notify at spawn
AddEventHandler("playerSpawned", function(spawn)
Citizen.CreateThread(function()
    while true do
		Wait(0)
		SetNotificationTextEntry("STRING")
		AddTextComponentString(config.spawnmessage)
		SetNotificationMessage("CHAR_ALL_PLAYERS_CONF", "CHAR_ALL_PLAYERS_CONF", true, 1, config.gamemode, config.version)
		DrawNotification(false, true)
		Wait(5000000)
	end
end)
end)


-- Notify Long
RegisterNetEvent("darkrp:notifylong")
AddEventHandler("darkrp:notifylong", function(icon, type, sender, title, text)
 Citizen.CreateThread(function()
	Wait(1)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	SetNotificationMessage(icon, icon, true, type, sender, title, text)
	DrawNotification(false, true)
 end)
end)


-- Show Text
RegisterNetEvent("darkrp:showtext")
AddEventHandler("darkrp:showtext", function(text)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(time, 1)
end

-- Events base

RegisterNetEvent("darkrp:setUser")
AddEventHandler("darkrp:setUser", function(infos)
	for k,v in pairs(infos) do
		User[k] = v
	end
end)

RegisterNetEvent("darkrp:setCarUser")
AddEventHandler("darkrp:setCarUser", function(infos)
	User.vehicle = infos
end)