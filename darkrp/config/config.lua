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
-- hospital settings
config.hospital.x = 306.72396850586
config.hospital.y = -1434.4223632813
config.hospital.z = 29.804103851318
-- version
config.version = 0.1.1
-- Car Wash Price
config.pricecarwash = 50

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- GameMode name
config.gamemode = "DarkRP"
-- Your community name
config.communityname = "YOURCOMMUNTIY"
-- Your site
config.siteweb = "www.yourwebsite.com"
-- Currency
config.currency = "$"
-- Ban Reason
config.banreason = "You are currently banned. Please go to: "..config.siteweb.."/bans"
-- Spawn Message
config.spawnmessage = "Welcome to ~g~"..config.communityname.."~s~ !\n~y~For more info, go to : ~b~"..config.siteweb.."~s~ !"

return config