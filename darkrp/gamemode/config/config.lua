-- DarkRP config settings
require "resources/darkrp/lib/MySQL"

config {}

--[[
Database settings
]]

-- database
config.database = {
	host = "127.0.0.1",
	name = "changeme",
	username = "changeme",
	password = "changeme"
}

--[[
Toggle settings.
Set to true or false.
]]

-- PvP - Set all players in GodMode or not
config.pvpEnabled = true
-- Debug
config.debugInformation = false
-- Native Money System
config.nativeMoneySystem = true

--[[
Value settings
]]

-- startingcash - your wallet when you join for the first time.
config.startingCash = 100

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- Your community name
config.communityname = "YOURCOMMUNTIY"
-- Your site
config.siteweb = "WWW.YOURSITE.COM"
-- Currency
config.currency = "$"
-- First Spawn Coords
config.firstSpawnCoords = {x=464.091, y=-997.166, z=24.915}

return config