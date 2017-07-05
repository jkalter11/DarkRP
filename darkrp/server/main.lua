local config = ("resources/darkrp/config/config")

-- Server
Users = {}
commands = {}
settings = {}
settings.defaultSettings = {
	['banReason'] = config.banreason,
	['pvpEnabled'] = config.pvpEnabled,
	['permissionDenied'] = config.permissionDenied,
	['debugInformation'] = config.debugInformation,
	['startingCash'] = config.currency,
	['enableRankDecorators'] = config.enableRankDecorators,
	['spawnx'] = config.spawnx,
	['spawny'] = config.spawny,
	['spawnz'] = config.spawnxz,
	['moneyIcon'] = config.currency
}
settings.sessionSettings = {}

AddEventHandler('playerConnecting', function(name, setCallback)
	local identifiers = GetPlayerIdentifiers(source)

	for i = 1, #identifiers do
		local identifier = identifiers[i]
		debugMsg('Checking user ban: ' .. identifier .. " (" .. name .. ")")
		local banned = isIdentifierBanned(identifier)
		if(banned)then
			if(type(settings.defaultSettings.banreason) == "string")then
				setCallback(settings.defaultSettings.banreason)
			elseif(type(settings.defaultSettings.banreason) == "function")then
				setCallback(settings.defaultSettings.banreason(identifier, name))
			else
				setCallback("Default ban reason error")
			end
			CancelEvent()
		end
	end
end)

AddEventHandler('playerDropped', function()
	if(Users[source])then

		Users[source] = nil
	end
end)

local justJoined = {}

RegisterServerEvent('darkrp:firstJoinProper')
AddEventHandler('darkrp:firstJoinProper', function()
	local identifiers = GetPlayerIdentifiers(source)
	for i = 1, #identifiers do
		if(Users[source] == nil)then
			debugMsg("DarkRP | Loading user: " .. GetPlayerName(source))

			local identifier = identifiers[i]
			registerUser(identifier, source)

			TriggerEvent('darkrp:initialized', source)
			justJoined[source] = true

			if(settings.defaultSettings.pvpEnabled)then
				TriggerClientEvent("darkrp:enablePvp", source)
			end
		end
	end
end)

AddEventHandler('darkrp:setSessionSetting', function(k, v)
	settings.sessionSettings[k] = v
end)

AddEventHandler('darkrp:getSessionSetting', function(k, cb)
	cb(settings.sessionSettings[k])
end)

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	if(justJoined[source])then
		TriggerEvent("darkrp:firstSpawn", source)
		justJoined[source] = nil
	end
end)

AddEventHandler("darkrp:setDefaultSettings", function(tbl)
	for k,v in pairs(tbl) do
		if(settings.defaultSettings[k] ~= nil)then
			settings.defaultSettings[k] = v
		end
	end

	debugMsg("Default settings edited.")
end)

AddEventHandler('chatMessage', function(source, n, message)
	if(startswith(message, "/"))then
		local command_args = stringsplit(message, " ")

		command_args[1] = string.gsub(command_args[1], "/", "")

		local command = commands[command_args[1]]

		if(command)then
			CancelEvent()
			if(command.perm > 0)then
				if(Users[source].permission_level >= command.perm or Users[source].group:canTarget(command.group))then
					command.cmd(source, command_args, Users[source])
					TriggerEvent("darkrp:adminCommandRan", source, command_args, Users[source])
				else
					command.callbackfailed(source, command_args, Users[source])
					TriggerEvent("darkrp:adminCommandFailed", source, command_args, Users[source])

					if(type(settings.defaultSettings.permissionDenied) == "string" and not WasEventCanceled())then
						TriggerClientEvent('chatMessage', source, "", {0,0,0}, defaultSettings.permissionDenied)
					end

					debugMsg("No-admin (" .. GetPlayerName(source) .. ") attempted to run admin command: " .. command_args[1])
				end
			else
				command.cmd(source, command_args, Users[source])
				TriggerEvent("darkrp:userCommandRan", source, command_args, Users[source])
			end

			TriggerEvent("darkrp:commandRan", source, command_args, Users[source])
		else
			TriggerEvent('darkrp:invalidCommandHandler', source, command_args, Users[source])

			if WasEventCanceled() then
				CancelEvent()
			end
		end
	else
		TriggerEvent('darkrp:chatMessage', source, message, Users[source])
	end
end)

AddEventHandler('darkrp:addCommand', function(command, callback)
	commands[command] = {}
	commands[command].perm = 0
	commands[command].group = "user"
	commands[command].cmd = callback

	debugMsg("Command added: " .. command)
end)

AddEventHandler('darkrp:addAdminCommand', function(command, perm, callback, callbackfailed)
	commands[command] = {}
	commands[command].perm = perm
	commands[command].group = "superadmin"
	commands[command].cmd = callback
	commands[command].callbackfailed = callbackfailed

	debugMsg("Admin command added: " .. command .. ", requires permission level: " .. perm)
end)

AddEventHandler('darkrp:addGroupCommand', function(command, group, callback, callbackfailed)
	commands[command] = {}
	commands[command].perm = math.maxinteger
	commands[command].group = group
	commands[command].cmd = callback
	commands[command].callbackfailed = callbackfailed

	debugMsg("Group command added: " .. command .. ", requires group: " .. group)
end)

RegisterServerEvent('darkrp:updatePositions')
AddEventHandler('darkrp:updatePositions', function(x, y, z)
	if(Users[source])then
		Users[source]:setCoords(x, y, z)
	end
end)

-- Info command
commands['info'] = {}
commands['info'].perm = 0
commands['info'].cmd = function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "^2[^3DarkRP^2]^0 Version: ^2"..config.version)
	TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "^2[^3DarkRP^2]^0 Commands loaded: ^2" .. (returnIndexesInTable(commands) - 1))
end
