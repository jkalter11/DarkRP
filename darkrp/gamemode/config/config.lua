-- DarkRP config settings

local cfg = {}

--[[
Toggle settings.
Set to true or false.
]]

-- PvP - Set all players in GodMode or not
config.pvpEnabled = true
-- Debug
config.debugInformation = false
-- Permission Denied
config.permissionDenied = false
-- Native Money System
config.nativeMoneySystem = true
-- Enable Rank Decorators
config.enableRankDecorators = false
-- Car Wash is paid
config.carwashispaid = true

--[[
Value settings
]]

-- startingcash - your wallet when you join for the first time.
config.startingCash = 100
-- spawn settings (only for first spawn)
config.spawnx = -1037.927
config.spawny = -2738.061
config.spawnz = 20.169
-- version
config.version = 0.1.1
-- Car Wash Price
config.pricecarwash = 50

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- Your community name
config.communityname = "YOURCOMMUNTIY"
-- Your site
config.siteweb = "www.yourwebsite.com"
-- Currency
config.currency = "$"
-- Ban Reason
config.banreason = "You are currently banned. Please go to: "..config.siteweb.."/bans"

return config