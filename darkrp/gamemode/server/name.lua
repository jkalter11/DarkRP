require "resources/mysql-async/lib/MySQL"

RegisterServerEvent('darkrp:updateName')
AddEventHandler('darkrp:updateName', function(prenom, nom)
	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			user:setNom(nom)
			user:setPrenom(prenom)
			local player = user.identifier
			MySQL.Async.execute("UPDATE users SET `nom`=@value WHERE identifier = @identifier", {['@value'] = nom, ['@identifier'] = player})
			MySQL.Async.execute("UPDATE users SET `prenom`=@value WHERE identifier = @identifier", {['@value'] = prenom, ['@identifier'] = player})
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)

RegisterServerEvent('darkrp:getName')
AddEventHandler('darkrp:getName', function()
	TriggerEvent('darkrp:getPlayerFromId', source, function(user)
		if (user) then
			local fullname = user:getPrenom() .. " " .. user:getNom()
			TriggerClientEvent("darkrp:f_getName", source, fullname)
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)
