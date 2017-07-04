local config = require("resources/darkrp/gamemode/config/config")

-- All Notify/ShowText

RegisterNetEvent("darkrp:notify")
AddEventHandler("darkrp:notify", function(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(true, false)
end)

AddEventHandler("playerSpawned", function(spawn)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(config.spawnmessage)
	SetNotificationMessage("CHAR_ALL_PLAYERS_CONF", "CHAR_ALL_PLAYERS_CONF", true, 1, config.gamemode, config.version)
	DrawNotification(false, true)
end)

RegisterNetEvent("darkrp:notifylong")
AddEventHandler("darkrp:notifylong", function(icon, type, sender, title, text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	SetNotificationMessage(icon, icon, true, type, sender, title, text)
	DrawNotification(false, true)
end)

RegisterNetEvent("darkrp:showtext")
AddEventHandler("darkrp:showtext", function(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end