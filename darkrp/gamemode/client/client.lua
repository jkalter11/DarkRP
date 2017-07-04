local config = require("resources/darkrp/config/config")

-- periodic player state update

local state_ready = false

AddEventHandler("playerSpawned",function() -- delay state recording
  state_ready = false
  
  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    state_ready = true
  end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(30000)

    if IsPlayerPlaying(PlayerId()) and state_ready then
      local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	  TriggerServerEvent("SavePlayer", x,y,z, getHealth(), getWeapons(), getCustomization())
    end
  end
end)

-- All Notify/ShowText

RegisterNetEvent("darkrp:notify")
AddEventHandler("darkrp:notify", function(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end)

AddEventHandler("playerSpawned", function(spawn)
	SetNotificationTextEntry("STRING")
    AddTextComponentString("Welcome to ~g~"..config.communityname.."~s~ !\n~y~For more info, go to : ~b~"..config.siteweb.."~s~ !")
	SetNotificationMessage("CHAR_ALL_PLAYERS_CONF", "CHAR_ALL_PLAYERS_CONF", true, 1, "DarkRP", "v0.1")
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