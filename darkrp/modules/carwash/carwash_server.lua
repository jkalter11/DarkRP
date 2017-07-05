local config = require("resources/darkrp/config/config")

--Settings--

enableprice = config.carwashispaid -- true = carwash is paid, false = carwash is free

price = config.pricecarwash -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--

RegisterServerEvent('darkrp:checkmoney')
AddEventHandler('darkrp:checkmoney', function()
	TriggerEvent('darkrp:getPlayerFromId', source, function(player)
		if (user) then
			if(enableprice == true) then
				if(player:money >= price) then
					player:removeMoney((price))
					TriggerClientEvent('darkrp:success', source, price)
				else
					moneyleft = price - player:money
					TriggerClientEvent('darkrp:notenoughmoney', source, moneyleft)
				end
			else
				TriggerClientEvent('darkrp:free', source)
			end
		else
			TriggerEvent("darkrp:desyncMsg")
		end
	end)
end)
