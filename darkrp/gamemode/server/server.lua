RegisterServerEvent('darkrp:updateUser')
AddEventHandler('darkrp:updateUser', function(openMenu)
-print("[DarkRP] - Updating User...")

	local userInfos = {}

	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			userInfos["group"] = user.group.group
			userInfos["permission_level"] = user.permission_level
			userInfos["money"] = user:getMoney()
			userInfos["dirtymoney"] = user:getDMoney()
			userInfos["job"] = user:getJob()
			userInfos["police"] = user:getPolice()
			userInfos["enService"] = user:getenService()
			userInfos["nom"] = user:getNom()
			userInfos["prenom"] = user:getPrenom()
			userInfos["vehicle"] = user:getVehicle()
			userInfos["telephone"] = user:getTel()
			userInfos["identifier"] = user.identifier
			userInfos["gender"] = user:getGender()
		end
	end)
	userInfos.Loaded = true
	-- send data and open menu...
	TriggerClientEvent("darkrp:setUser", source, userInfos)
end)

RegisterServerEvent('darkrp:getVehPlate_s')
AddEventHandler('darkrp:getVehPlate_s', function()
	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			local plate = user:getVehicle()
			TriggerClientEvent("darkrp:f_getVehPlate", source, plate)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

RegisterServerEvent("darkrp:cleanCash_s")
AddEventHandler("darkrp:cleanCash_s", function()
	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			local dcash = tonumber(user:getDMoney())
			local cash = tonumber(user:getMoney())
			local washedcash = dcash * 0.3
			user:setDMoney(0)
			local total = cash + round(washedcash)
			user:setMoney(total)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)

RegisterServerEvent("darkrp:giveCash_s")
AddEventHandler("darkrp:giveCash_s", function(netID, cash)
	total = tonumber(cash)
	local name = ""
	local surname = ""
	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			name =  user:getNom()
			surname = user:getPrenom()
			user:removeMoney(total)
			TriggerClientEvent("darkrp:notif", source, "Vous avez donné ~g~" .. total .. "" .. config.currency)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
	TriggerEvent('darkrp:getPlayerFromId', netID, function(user)
		if (user) then
			user:addMoney(total)
			TriggerClientEvent("darkrp:notif", netID, surname .. " " .. name .. " vous a donné ~g~" .. total .. "" .. config.currency)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)

RegisterServerEvent("darkrp:giveDCash_s")
AddEventHandler("darkrp:giveDCash_s", function(netID, cash)
	local total = tonumber(cash)
	local name = ""
	local surname = ""
	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			name =  user:getNom()
			surname = user:getPrenom()
			user:removeDMoney(total)
			TriggerClientEvent("darkrp:notif", source, "Vous avez donné ~r~" .. total .. "" .. config.currency)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
	TriggerEvent('darkrp:getPlayerFromId', netID, function(user)
		if (user) then
			user:addDMoney(total)
			TriggerClientEvent("darkrp:notif", netID, surname .. " " .. name .. " vous a donné ~r~" .. total .. "" .. config.currency)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)