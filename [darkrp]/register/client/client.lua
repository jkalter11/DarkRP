
local disableKeys = { 19, 20, 43, 48, 187, 233, 309, 311, 85, 74, 21, 73, 121, 45, 80, 140, 170, 177, 194, 202, 225, 263}

function DisableControls()
	for i = 1, #disableKeys do
		DisableControlAction(0,  disableKeys[i],  1)
	end
end

RegisterNetEvent('chatCommandEntered')

local guiEnabled = false

function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end

RegisterNetEvent("register:menu")
AddEventHandler('register:menu', function()
    FreezeEntityPosition(GetPlayerPed(-1),  true)
	Citizen.Wait(1000)
	SetEntityCoords(GetPlayerPed(-1), -1037.92724609375, -2738.06103515625, 20.1692943572998)
    Citizen.Wait(5000)
    EnableGui(true)
end)

-- AddEventHandler('chatCommandEntered', function(commands, player)
--     DisplayNotification(json.encode(commands))
--
--     if commands[1] == "/test" then
--         EnableGui(true)
--     end
-- end)

RegisterNUICallback('escape', function(data, cb)
    EnableGui(false)
    cb('ok')
end)

RegisterNUICallback('updateGender', function(data, cb)
    TriggerEvent("darkrp:changeGender", data.gender)
    Citizen.Wait(10)
    cb('ok')
end)

RegisterNUICallback('updateHair', function(data, cb)
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(data.hairy), tonumber(data.hairysec), 2)
	SetPedHairColor(GetPlayerPed(-1), tonumber(data.hairycolor), tonumber(data.hairycolorsec))
    Citizen.Wait(10)
    cb('ok')
end)

RegisterNUICallback('updateFace', function(data, cb)
	SetPedHeadBlendData(GetPlayerPed(-1), tonumber(data.face), tonumber(data.face), tonumber(data.face), tonumber(data.face), tonumber(data.face), tonumber(data.face), 1.0, 1.0, 1.0, true)
    SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(data.face), 0, 2)
    Citizen.Wait(10)
    cb('ok')
end)

RegisterNUICallback('login', function(data, cb)
		if string.len(data.username) > 0 and string.len(data.password) > 0 then
	    TriggerServerEvent("darkrp:updateName", data.username, data.password)
	    local target = ""
	    local choice = data.outfit
		if choice == "1" then
		    	TriggerEvent("darkrp:OutfitsVal", target, 3, 122)
			elseif choice == "2" then
			    TriggerEvent("darkrp:OutfitsVal", target, 4, 122)
			elseif choice == "3" then
			    TriggerEvent("darkrp:OutfitsVal", target, 5, 122)
			elseif choice == "4" then
			    TriggerEvent("darkrp:OutfitsVal", target, 8, 123)
			elseif choice == "5" then
			    TriggerEvent("darkrp:OutfitsVal", target, 11, 123)
			elseif choice == "6" then
			    TriggerEvent("darkrp:OutfitsVal", target, 12, 123)
			elseif choice == "7" then
			    TriggerEvent("darkrp:OutfitsVal", target, 17, 123)
			elseif choice == "8" then
			    TriggerEvent("darkrp:OutfitsVal", target, 19, 123)
			elseif choice == "9" then
			    TriggerEvent("darkrp:OutfitsVal", target, 4, 143)
			elseif choice == "10" then
			    TriggerEvent("darkrp:OutfitsVal", target, 1, 147)
			elseif choice == "11" then
			    TriggerEvent("darkrp:OutfitsVal", target, 6, 147)
			elseif choice == "12" then
			    TriggerEvent("darkrp:OutfitsVal", target, 10, 147)
			elseif choice == "13" then
			    TriggerEvent("darkrp:OutfitsVal", target, 1, 171)
			elseif choice == "14" then
			    TriggerEvent("darkrp:OutfitsVal", target, 3, 171)
			elseif choice == "15" then
			    TriggerEvent("darkrp:OutfitsVal", target, 2, 130)
			elseif choice == "16" then
			    TriggerEvent("darkrp:OutfitsVal", target, 2, 110)
			elseif choice == "17" then
			    TriggerEvent("darkrp:OutfitsVal", target, 7, 110)
			elseif choice == "18" then
			    TriggerEvent("darkrp:OutfitsVal", target, 8, 110)
			elseif choice == "19" then
				TriggerEvent("darkrp:OutfitsVal", target, 108, 175)
			elseif choice == "20" then
				TriggerEvent("darkrp:OutfitsVal", target, 99, 175)
			elseif choice == "21" then
				TriggerEvent("darkrp:OutfitsVal", target, 84, 175)
		end
	    TriggerServerEvent("darkrp:getFace", tonumber(data.gender), data.face, 0)
	    TriggerServerEvent("darkrp:getHair", tonumber(data.hair), tonumber(data.hairsec), tonumber(data.haircolor), tonumber(data.haircolorsec))
	    TriggerEvent("darkrp:notify", "Your last name: " .. data.password .. " - Your first name: " .. data.username)
	    TriggerEvent("darkrp:notify", "Your are a " .. data.gender)
	    EnableGui(false)
	    Citizen.Wait(2000)
		SetEntityCoordsNoOffset(GetPlayerPed(-1), -1037.927, -2738.061, 20.169, 0,  0,  1)
	    FreezeEntityPosition(GetPlayerPed(-1),  false)
	    TriggerServerEvent("darkrp:lastChar")
		else
			TriggerEvent("darkrp:notify", "~r~Fill in all fields")
		end
    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
		-- if IsControlJustReleased(0, 303) then
    --         EnableGui(true)
		-- 	Wait(100)
		-- end
        if guiEnabled then
            DisableControls()
            --DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            --DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
        Citizen.Wait(0)
    end
end)