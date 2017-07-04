local coords = {}
local spawnReceived = false

RegisterNetEvent("darkrp:sendingSpawnData")
AddEventHandler("darkrp:sendingSpawnData", function(lecoords)
  coords = lecoords
  spawnReceived = true
end)

-- Used to respawn the player that is already spawned.
-- The spawnmanager is too nice for this.
AddEventHandler("playerSpawned", function()
  TriggerServerEvent("darkrp:requestingSpawnData")
  while not spawnReceived do
    Citizen.Wait(0)
  end

  -- FreezeEntityPosition(GetPlayerPed(-1), true)
  SetEntityCoordsNoOffset(GetPlayerPed(-1), coords.x, coords.y, coords.z, false, false, false, true)
  DoScreenFadeOut(500)

  while IsScreenFadingOut() do
    Citizen.Wait(0)
  end

  while IsPedFalling() do
    Wait(100)
    SetEntityCoordsNoOffset(GetPlayerPed(-1), coords.x, coords.y, coords.z, false, false, false, true)
  end

  Citizen.Trace("Ending")

  ShutdownLoadingScreen()
  DoScreenFadeIn(500)

  while IsScreenFadingIn() do
    Citizen.Wait(0)
  end
  -- FreezeEntityPosition(GetPlayerPed(-1), false)

  TriggerEvent("darkrp:setMoneyDisplay", "visible")
  TriggerEvent("banking:setBankDisplay", "visible")
end)
