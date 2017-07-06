-- Turn off automatic respawn here instead of updating FiveM file.
AddEventHandler('onClientMapStart', function()
	exports.spawnmanager:setAutoSpawn(true)
	exports.spawnmanager:forceRespawn()
	--exports.spawnmanager:spawnPlayer()
end)