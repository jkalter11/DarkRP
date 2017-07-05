-- DarkRP config settings

--[[
Toggle settings.
Set to true or false.
]]

config = {
-- PvP - Set all players in GodMode or not
	pvpEnabled = true
-- Debug
	debugInformation = false
-- Permission Denied
	permissionDenied = false
-- Native Money System
	nativeMoneySystem = true
-- Enable Rank Decorators
	enableRankDecorators = false
-- Car Wash is paid
	carwashispaid = true

--[[
Value settings
]]

-- startingcash - your wallet when you join for the first time.
	startingCash = 100
-- spawn settings (only for first spawn)
	spawnx = -1037.927
	spawny = -2738.061
	spawnz = 20.169
-- hospital settings
	hospital.x = 306.72396850586
	hospital.y = -1434.4223632813
	hospital.z = 29.804103851318
-- Car Wash Price
	pricecarwash = 50

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- GameMode name
	gamemode = "DarkRP"
-- Your community name
	communityname = "YOURCOMMUNTIY"
-- Your site
	siteweb = "www.yourwebsite.com"
-- Currency
	currency = "$"
-- Ban Reason
	banreason = "You are currently banned. Please go to: "..config.siteweb.."/bans"
-- Spawn Message
	spawnmessage = "Welcome to ~g~"..config.communityname.."~s~ !\n~y~For more info, go to : ~b~"..config.siteweb.."~s~ !"
}