RegisterServerEvent('darkrp:success')
AddEventHandler('darkrp:success', function(amount)
  -- Get the players money amount
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      total = math.random(100, 500);
      -- update player money amount
      user:addMoney((total + tonumber(math.floor(amount)) + 0.0))
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

RegisterServerEvent('darkrp:removeMoney')
AddEventHandler('darkrp:removeMoney', function(amount)
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local rounded = round(math.abs(tonumber(amount)), 0)
      user:removeMoney(rounded)
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

RegisterServerEvent('darkrp:addMoney')
AddEventHandler('darkrp:addMoney', function(amount)
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local rounded = round(math.abs(tonumber(amount)), 0)
      user:addMoney(rounded)
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

RegisterServerEvent("darkrp:getCash_s")
AddEventHandler("darkrp:getCash_s", function()
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local argent = user:getMoney()
      TriggerClientEvent("darkrp:f_getCash", source, argent)
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

RegisterServerEvent('darkrp:GetIdentifier')
AddEventHandler('darkrp:GetIdentifier', function()
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local player = user.identifier
      local L = #player - 4
      local L1 = #player - 3
      local L2 = #player - 2
      local L3 = #player - 1
      local plate = "JOBS" .. player[L] .. player[L1] .. player[L2] .. player[L3]
      plate = string.upper(plate)
      user:setJobVehicle(plate)
      TriggerClientEvent("darkrp:f_GetIdentifier", source, plate)
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.abs(math.floor(num * mult + 0.5) / mult)
end
