AddEventHandler('onClientMapStart', function()
	Citizen.Trace("ocms darkrp\n")

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
    SetClockTime(24, 0, 0)
    PauseClock(true)
    Citizen.Trace("ocms darkrp end\n")
end)