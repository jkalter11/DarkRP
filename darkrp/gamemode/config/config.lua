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
-- define the first spawn position/radius of the player (very first spawn on the server, or after death)
config.spawn_enabled = false -- set to false to disable the feature
-- First Spawn Coords
config.spawn_position = {1854.21, 3685.51, 34.2671}
-- radius of spawn
config.spawn_radius = 1
-- mp_m_freemode_01 (male) or mp_f_freemode_01 (female)
config.default_customization = {
  model = "mp_m_freemode_01" 
}
-- init default ped parts
for i=0,19 do
  config.default_customization[i] = {0,0}
end

return config