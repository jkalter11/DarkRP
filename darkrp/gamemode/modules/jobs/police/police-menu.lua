local policemenu = {
	opened = false,
	title = "Police Menu",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.32,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = { 
			title = "CATEGORIES", 
			name = "main",
			buttons = { 
				{name = "Citizen Interaction", description = ""},
				{name = "Vehicle Interaction", description = ""},
				{name = "Call for reinforcements", description = ""},
				{name = "Speed radar", description = ""},
				{name = "Wanted", description = ""},
				{name = "Police cone", description = ""},
				-- {name = "SupprimÃ© CÃ´nes (Soon)", description = ""},
			}
		},
		["mainwanted"] = { 
			title = "Add Wanted", 
			name = "mainwanted",
			buttons = { 
			}
		},
		["maininteraction"] = { 
			title = "Citizen Interaction", 
			name = "maininteraction",
			buttons = { 
				{name = "Identity Card", description = ''},
				{name = "Search", description = ''},
				-- {name = "Casier Judiciaire (SOON)", description = ''},
				{name = "(Un)Handcuff", description = ''},
				{name = "Cut Zip Ties", description = ''},				
				-- {name = "Escorter (SOON)", description = ''},
				{name = "Put in the vehicle", description = ''},
				{name = "Fine", description = ''},
				{name = "Grab", description = ''},
			}
		},
		["mainretrait"] = { 
			title = "Grab", 
			name = "mainretrait",
			buttons = { 
				{name = "Grab License", description = ''},
				{name = "Grab Weapons", description = ''},
				{name = "Grab Weapons (SP)", description = ''},
				{name = "Grab Dirty Money", description = ''},
				{name = "Grab Dirty Money (Discreetly)", description = ''},
			}
		},
		["permismenu"] = { 
			title = "Licence Revocation", 
			name = "permismenu",
			buttons = { 
				{name = "Driving Licence", description = ''},
				{name = "Weapons Licence", description = ''},
				{name = "Pilot(Aircraft) licence", description = ''},
				{name = "Boat License", description = ''},
			}
		},
		["citoyen1"] = { 
			title = "Identity Card", 
			name = "citoyen1",
			buttons = { 
			}
		},
		["citoyen2"] = { 
			title = "Search", 
			name = "citoyen2",
			buttons = { 
			}
		},
		["citoyen3"] = { 
			title = "Casier Judiciaire", 
			name = "citoyen3",
			buttons = { 
			}
		},
		["citoyen5"] = { 
			title = "Fine", 
			name = "citoyen5",
			buttons = { 
				{name = "Rappel Ã  la loi simple", description = {}, cost = 200, amid = 40},
                {name = "Rappel Ã  la loi grave", description = {}, cost = 500, amid = 41},
                {name = "Insulte Ã  agent", description = {}, cost = 5000, amid = 30},
                {name = "Infraction simple au CR", description = {}, cost = 1000, amid = 25},
                {name = "Infraction grave au CR", description = {}, cost = 5000, amid = 26},
                {name = "DÃ©lit de fuite", description = {}, cost = 20000, amid = 29},
                {name = "Conduite sans permis", description = {}, cost = 10000, amid = 33},
                {name = "Vol de vÃ©hicule", description = {}, cost = 50000, amid = 35},
                {name = "Coups et blessures", description = {}, cost = 7500, amid = 27},
                {name = "Port d'arme sans permis", description = {}, cost = 10000, amid = 32},
                {name = "Agression Ã  main armÃ©e", description = {}, cost = 10000, amid = 28},
                {name = "Tentative de vol Ã  main armÃ©e", description = {}, cost =  5000, amid =  42},
                {name = "Vol Ã  main armÃ©e", description = {}, cost =  15000, amid =  43},
                {name = "Tentative de meurtre", description = {}, cost =  7500, amid =  44},
                {name = "Homicide volontaire", description = {}, cost =  25000, amid =  45},
                {name = "Transport de substance illÃ©gale", description = {}, cost = 30000, amid = 31},
			}
		},
		["mainvehicle"] = { 
			title = "Vehicle Interaction", 
			name = "mainvehicle",
			buttons = { 
				{name = "Numberplate", description = ''},
				{name = "Search", description = ''},
				{name = "Crochet vehicle", description = ''},
			}
		},
		["vehicle1"] = { 
			title = "Numberplate", 
			name = "vehicle1",
			buttons = { 
				{name = "HelicoptÃ¨re Police", description = {}, model = "polmav"},
			}
		},
		["vehicle2"] = { 
			title = "Search", 
			name = "vehicle2",
			buttons = { 
				{name = "HelicoptÃ¨re Police", description = {}, model = "polmav"},
			}
		},
	}
}

---Wanted


RegisterNetEvent('OpenWantedlist')
AddEventHandler('OpenWantedlist', function(tableall)
	
    local a = tableall

	policemenu.menu["mainwanted"].buttons = {}
	
	local i = 1
	while a[i] do
		
	nameplayerwanted = a[i]['player_name']
	idplayerwanted = a[i]['ig']
	wantedplayerwanted = a[i]['wanted']
    
	
    table.insert(policemenu.menu["mainwanted"].buttons, {name = nameplayerwanted, description = "", id = idplayerwanted, wanted = wantedplayerwanted})

	i = i + 1
	end

end)


RegisterNetEvent('OpenWantedlist2')
AddEventHandler('OpenWantedlist2', function()

	policemenu.currentmenu = "mainwanted"
	policemenu.opened = true
	policemenu.selectedbutton = 0
	
end)

local boughtweapon = false

local function LocalPed()
return GetPlayerPed(-1)
end

--Creator Weapon
function OpenCreatorPoliceMenu()		
	boughtweapon = false
	policemenu.currentmenu = "main"
	policemenu.opened = true
	policemenu.selectedbutton = 0
end
function CloseCreatorPoliceMenu()
	Citizen.CreateThread(function()
		policemenu.opened = false
		policemenu.menu.from = 1
		policemenu.menu.to = 10
		inmenucivil = 0
		inmenuinv = 0
		inmenujob = 0
	end)
end

--Menu pomenu

function drawMenuButton(button,x,y,selected)
	local menu = policemenu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)	
end

function drawMenuInfo(text)
	local menu = policemenu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)	
end

function drawMenuRight(txt,x,y,selected)
	local menu = policemenu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)	
end

function drawMenuTitlePol(txt,x,y)
local menu = policemenu.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,93,166,202,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Notify6(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function ShowNotificationPolMenu(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

User = {
	Spawned = false,
	Loaded = false,
	group = "0",
	permission_level = 0,
	money = 0,
	dirtymoney = 0,
	job = 0,
	police = 0,
	enService = 0,
	nom = "",
	prenom = "",
	vehicle = "",
	identifier = nil,
	telephone = ""
}

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (User.enService == 1) and IsControlJustPressed(1,170) then
			if IsPedInAnyVehicle(LocalPed(), true) == false then
			if (inmenuinv == 0) and (inmenucivil == 0) then
				if policemenu.opened then
					CloseCreatorPoliceMenu()
					inmenucivil = 0
				    inmenuinv = 0
				    inmenujob = 0
				else
					OpenCreatorPoliceMenu()
					freezetargetPol = totarget
					inmenucivil = 0
				    inmenuinv = 0
				    inmenujob = 1 --POLICE
				end
			end
		    else
		    ShowNotificationMenuCivil2("~r~Vous ne pouvez pas ouvrir le menu dans un vÃ©hicule !")
	        end
		end
		
		if IsControlJustPressed(1,170) and (clientjobID == 19) then
			if IsPedInAnyVehicle(LocalPed(), true) == false then
			if (inmenuinv == 0) and (inmenucivil == 0) then
				if policemenu.opened then
					CloseCreatorPoliceMenu()
					inmenucivil = 0
				    inmenuinv = 0
				    inmenujob = 0
				else
					OpenCreatorPoliceMenu()
					freezetargetPol = totarget
					inmenucivil = 0
				    inmenuinv = 0
				    inmenujob = 1 --POLICE
				end
			end
		    else
		    ShowNotificationMenuCivil2("~r~Vous ne pouvez pas ouvrir le menu dans un vÃ©hicule !")
	        end
		end
		
		if policemenu.opened then
			local ped = LocalPed()
			local menu = policemenu.menu[policemenu.currentmenu]
			drawTxt(policemenu.title,1,1,policemenu.menu.x,policemenu.menu.y,1.0, 255,255,255,255)
			drawMenuTitlePol(menu.title, policemenu.menu.x,policemenu.menu.y + 0.08)
			drawTxt(policemenu.selectedbutton.."/"..tablelength(menu.buttons),0,0,policemenu.menu.x + policemenu.menu.width/2 - 0.0385,policemenu.menu.y + 0.067,0.4, 255,255,255,255)
			local y = policemenu.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			
			for i,button in pairs(menu.buttons) do
				if i >= policemenu.menu.from and i <= policemenu.menu.to then
					
					if i == policemenu.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,policemenu.menu.x,y,selected)
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected6(button)
					end
				end
			end	
		end
		if policemenu.opened then
			if IsControlJustPressed(1,202) then
				Back6()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if policemenu.selectedbutton > 1 then
					policemenu.selectedbutton = policemenu.selectedbutton -1
					if buttoncount > 10 and policemenu.selectedbutton < policemenu.menu.from then
						policemenu.menu.from = policemenu.menu.from -1
						policemenu.menu.to = policemenu.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if policemenu.selectedbutton < buttoncount then
					policemenu.selectedbutton = policemenu.selectedbutton +1
					if buttoncount > 10 and policemenu.selectedbutton > policemenu.menu.to then
						policemenu.menu.to = policemenu.menu.to + 1
						policemenu.menu.from = policemenu.menu.from + 1
					end
				end	
			end
		end
	end
end)

function playAnim(ped, animdict, anim, infinite)
	Citizen.CreateThread(function()
		while(not HasAnimDictLoaded(animdict))do
			RequestAnimDict(animdict)
			Citizen.Wait(0)
			
		end
		
						
		TaskPlayAnim(tonumber(ped), animdict, anim, 8.0, 0.0, -1, 0, 0, 1, 1, 1)
	end)
end
				    
function DrawMissionTextPolmenu(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Cuffed = false

local function RandomNumber()
    return math.random(0,9)
end

OpenRadar = false
inputspeed = 0
BarrierePose = false

function ButtonSelected6(button)
	local ped = GetPlayerPed(-1)
	local this = policemenu.currentmenu
	local btn = button.name
	local vehiclose = GetVehiclePedIsTryingToEnter(ped)
	myvehi = GetVehiclePedIsUsing(GetPlayerPed(-1))
	posPolmenu = GetEntityCoords(GetPlayerPed(-1))
	carTargetPol = GetClosestVehicle(posPolmenu['x'], posPolmenu['y'], posPolmenu['z'], 10.0,0,70)
		if carTargetPol ~=nil then
			platecarTargetPol = GetVehicleNumberPlateText(carTargetPol)
		end
	
	if this == "main" then
		if btn == "Citizen Interaction" then
			OpenMenuPoliMenu('maininteraction')
		elseif btn == "Vehicle Interaction" then
			OpenMenuPoliMenu('mainvehicle')
		elseif btn == "Speed radar" then
			OpenRadar = not OpenRadar
			if OpenRadar == true then
				DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
				inputspeed = 1
			else
			inputspeed = 0
			end
		elseif btn == "Wanted" then
			TriggerServerEvent('CheckWantedlist')
		elseif btn == "Police cone" then
				Citizen.CreateThread(function()
				local ObjectID = GetHashKey("prop_roadcone02c")
				
				RequestModel(ObjectID)
				while not HasModelLoaded(ObjectID) do
				Citizen.Wait(0)
				end
				
				local ped = LocalPed()			
				local playerCoords = GetEntityCoords(ped)
				local playerCoords = playerCoords + vector3(0, -1, -0.87)
				
				CreateObject(ObjectID, playerCoords['x'], playerCoords['y'], playerCoords['z'], true, true, true)
				end)
				ShowNotificationPolMenu("~h~CÃ´ne ~g~posÃ©~w~.")
		elseif btn == "SupprimÃ© CÃ´nes" then
		        Citizen.CreateThread(function()
				local ped = LocalPed()			
				local playerCoords = GetEntityCoords(ped)
				local playerCoords = playerCoords + vector3(0, -1, -0.87)
			    ClearAreaOfObjects(playerCoords['x'], playerCoords['y'], playerCoords['z'], 20.001, 1008436154)
				end)
				ShowNotificationPolMenu("~h~CÃ´nes ~r~supprimÃ©s~w~.")		
		elseif btn == "Demande d'appui" then
		    callxx, callyy, callzz = table.unpack(GetEntityCoords(GetPlayerPed(-1) , true))
			TriggerServerEvent('Call911for911', callxx, callyy, callzz)
			
		elseif btn == "Annuler l'appel" then		
			StopInterPolice()				
	    end
	elseif this == "maininteraction" then
		if btn == "Carte d'identitÃ©" then
			TriggerServerEvent('IdentTarget2',freezetargetPol)
			
		elseif btn == "Fouiller" then
			TriggerServerEvent('TargetInv', freezetargetPol)
			TriggerServerEvent('WeaponFouilleTarget',freezetargetPol)
			CloseCreatorPoliceMenu()
			policemenu.opened = false
			policemenu.menu.from = 1
			policemenu.menu.to = 10
			inmenucivil = 0
			inmenuinv = 0
			inmenujob = 0
		elseif btn == "Casier Judiciaire" then
			OpenMenuPoliMenu('citoyen3')
			
		elseif btn == "(De)Menotter" then
			TriggerServerEvent('CheckCuff',freezetargetPol)	
			
		elseif btn == "Couper Zip Ties" then
			TriggerServerEvent('CheckCuff2',freezetargetPol)	
			
		elseif btn == "Escorter" then
			TriggerServerEvent('PlayerFollowServ', freezetargetPol)
			
	    elseif btn == "Mettre dans le vehicule" then
			TriggerServerEvent('GetPlayerToVeh', freezetargetPol)	
			
		elseif btn == "Amende" then
			OpenMenuPoliMenu('citoyen5')
			
		elseif btn == "Saisir" then
			OpenMenuPoliMenu('mainretrait')		
		
		end
		
	elseif this == "mainretrait" then
	
	    if btn == "Saisir Permis" then
		    OpenMenuPoliMenu('permismenu') 

		elseif btn == "Saisir Armes" then
		    Citizen.CreateThread(function()
                    TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_POLICE_INVESTIGATE", 0, 1)
					PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
					Citizen.Wait(10000)
					ClearPedTasksImmediately(GetPlayerPed(-1))
		
			TriggerServerEvent('CheckWeaponRetire',freezetargetPol)	
			ShowNotificationPolMenu("~h~Vous avez ~r~saisis ~w~les armes du citoyen.")
			end)
		elseif btn == "Saisir Armes (SP)" then
			TriggerServerEvent('CheckWeaponRetire2',freezetargetPol)	
			ShowNotificationPolMenu("~h~Vous avez ~r~saisis ~w~les armes du citoyen.")
			Citizen.Wait(1000)
			TriggerServerEvent('spawnWeaponForRespawn2', freezetargetPol)
			ShowNotificationPolMenu("~h~Vous avez rendu uniquement les ~b~armes lÃ©git~w~ du citoyen.")
		elseif btn == "Saisir Argent sale" then
			TriggerServerEvent('SaisirMoneyDirty',freezetargetPol)	
		elseif btn == "Saisir Argent sale (Discretement)" then
			TriggerServerEvent('SaisirMoneyDirtyDiscret',freezetargetPol)				
		end
	elseif this == "permismenu" then
		if btn == "Permis de Voiture" then
		    TriggerServerEvent('RetirePermis', freezetargetPol)		
			
		elseif btn == "Licence du Port d'armes" then
		    TriggerServerEvent('RetirePermis2', freezetargetPol)
			
		elseif btn == "Licence de Pilote" then
		    TriggerServerEvent('RetirePermis3', freezetargetPol)
			
		elseif btn == "Permis de Bateau" then
		    TriggerServerEvent('RetirePermis4', freezetargetPol)
			
		end
		
	elseif this == "mainvehicle" then
		if btn == "Plaque d'immatriculation" then
		    Citizen.CreateThread(function()
                    TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, 1)
					PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
					Citizen.Wait(5000)
					ClearPedTasksImmediately(GetPlayerPed(-1))
		
		    
			TriggerServerEvent('CheckProprio', platecarTargetPol)
			 end)
		elseif btn == "Fouiller" then
		    Citizen.CreateThread(function()
                    TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_POLICE_INVESTIGATE", 0, 1)
					PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
					Citizen.Wait(10000)
					ClearPedTasksImmediately(GetPlayerPed(-1))
		
		    
		    ShowNotificationPolMenu("~h~~b~Coffre vÃ©hicule : ~w~")
		    ShowNotificationPolMenu("~w~ Vide.")
			end)
		elseif btn == "Crocheter vÃ©hicule" then
		    Citizen.CreateThread(function()
                    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, 1)
					PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
					ShowNotificationPolMenu('Crochetage en cours...')
					Citizen.Wait(10000)
					ClearPedTasksImmediately(GetPlayerPed(-1))

		
		    SetVehicleDoorsLocked(vehiclose, 1)
			SetVehicleDoorsLocked(carTargetPol, 1)
			ShowNotificationPolMenu("La voiture est ~g~Ouverte")
			
			end)
			
		end
	elseif this == "mainwanted" then
	    TriggerServerEvent('AddWanted', button.name, button.id, button.wanted)
			CloseCreatorPoliceMenu()
			policemenu.opened = false
			policemenu.menu.from = 1
			policemenu.menu.to = 10
			inmenucivil = 0
			inmenuinv = 0
			inmenujob = 0
    elseif this == "citoyen5" then
		TriggerServerEvent('CheckAmende',freezetargetPol, button.cost, button.amid, button.name)
		
	elseif this == "citoyen1" or this == "citoyen2" or this == "citoyen3" or this == "vehicle1" or this == "vehicle2" then
		TriggerServerEvent('CheckMenuPolice',button.amid)
	
	end
end

--Wanted retire notif

RegisterNetEvent('RetireWanted')
AddEventHandler('RetireWanted', function(name)
    ShowNotificationPolMenu("~h~Vous avez ~r~retirÃ©~w~ le WANTED du citoyen : ~b~"..name.."~w~.")
end)


--RADAR DE VITESSE

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputspeed == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputspeed = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputspeedpolice = GetOnscreenKeyboardResult()
					if string.len(inputspeedpolice) > 0 then
						ResultSpeed = inputspeedpolice
						inputspeed = 2
					else
						inputspeed = 0
					end

			elseif UpdateOnscreenKeyboard() == 2 then
				inputspeed = 0
			end
		end
		if inputspeed == 2 and (OpenRadar == true) then
		     local pos = GetEntityCoords(GetPlayerPed(-1))
			 local carM = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 10.0,0,70)
			 local plate = GetVehicleNumberPlateText(carM)
			 local herSpeedKm = GetEntitySpeed(carM)*3.6
				  
			DrawRect(0.848000000000001, 0.344, 0.185, 0.147, 0, 0, 0, 150)--BG black
			DrawAdvancedText2(0.914000000000001, 0.286, 0.005, 0.0028, 0.8, "Radar", 255, 255, 255, 255, 1, 1)
			if plate ~= nil then
			DrawAdvancedText2(0.913000000000001, 0.343, 0.005, 0.0028, 0.4, "~b~"..plate, 255, 255, 255, 255, 0, 1)
			DrawAdvancedText2(0.915800000000001, 0.386, 0.005, 0.0028, 0.4, "~b~"..math.ceil(herSpeedKm).." ~w~Km/h", 255, 255, 255, 255, 0, 1)
			else
			DrawAdvancedText2(0.898000000000001, 0.350, 0.005, 0.0028, 0.4, "~h~Aucun vÃ©hicule", 255, 255, 255, 255, 0, 1)
			end
			
			--Exces
			if tonumber(herSpeedKm) >= tonumber(ResultSpeed) then
				DrawRect(0.848000000000001, 0.446, 0.185, 0.054, 135, 0, 0, 150)
				DrawAdvancedText2(0.90000000000001, 0.449, 0.005, 0.0028, 0.5, "~h~ExcÃ¨s de vitesse", 255, 255, 255, 255, 1, 1)
			end
		end
	end
end)

RegisterNetEvent("SetUpgrade")
AddEventHandler('SetUpgrade', function()
    Citizen.CreateThread(function()
        Citizen.Wait(1000)
            local ped = GetPlayerPed(-1)
			local car = GetVehiclePedIsUsing(ped)
			
			SetVehicleModKit(car, 0)
			ToggleVehicleMod(car, 18, true)--turbo
			ToggleVehicleMod(car, 22, true)--light
			SetVehicleMod(car, 16, 4, true)--armor
			SetVehicleMod(car, 12, 2, true)--frein
			SetVehicleMod(car, 11, 2, true)--moteur
			local na = RandomNumber()
			local nb = RandomNumber()
			local nc = RandomNumber()
			a = tostring(na)
    		b = tostring(nb)
    		c = tostring(nc)
			local plate = "LSPD-"
			plate = plate..a..b..c
			SetVehicleNumberPlateText(car,plate)			
			SetVehicleDirtLevel(car, 0.0)	
    end)
end)

RegisterNetEvent("SetUpgrade2")
AddEventHandler('SetUpgrade2', function()
    Citizen.CreateThread(function()
        Citizen.Wait(1000)
            local ped = GetPlayerPed(-1)
			local car = GetVehiclePedIsUsing(ped)
			
			SetVehicleModKit(car, 0)
			ToggleVehicleMod(car, 18, true)--turbo
			ToggleVehicleMod(car, 22, true)--light
			SetVehicleMod(car, 16, 4, true)--armor
			SetVehicleMod(car, 12, 2, true)--frein
			SetVehicleMod(car, 11, 2, true)--moteur			
			SetVehicleDirtLevel(car, 0.0)	
    end)
end)

RegisterNetEvent('CheckProprioPlate')
AddEventHandler('CheckProprioPlate', function(proprio)
    ShowNotificationPolMenu("~h~~b~Plaque d'immatriculation : ~w~")
	ShowNotificationPolMenu(platecarTargetPol)
	ShowNotificationPolMenu("~h~~b~PropriÃ©taire : ~w~")
	ShowNotificationPolMenu(proprio)
end)


RegisterNetEvent('CheckSaisisSale')
AddEventHandler('CheckSaisisSale', function(name)
	ShowNotificationPolMenu("~h~~b~"..name.."~w~ vous a ~r~saisi ~w~votre argent sale.")
end)

RegisterNetEvent('CheckSaisisSale2')
AddEventHandler('CheckSaisisSale2', function(name)
	ShowNotificationPolMenu("~h~Vous avez ~r~saisi ~w~l'argent sale de ~b~"..name.."~w~.")
end)


RegisterNetEvent('RetireWeapon')
AddEventHandler('RetireWeapon', function()
    local ped = GetPlayerPed(-1)
	ShowNotificationPolMenu("~h~On vous a ~r~retirÃ© ~w~vos armes")
	RemoveAllPedWeapons(ped)
end)

ammenderecu = 0

RegisterNetEvent('CheckAmendeFinish')
AddEventHandler('CheckAmendeFinish', function(amcost, namepol, nameamende, idamende)
	ShowNotificationPolMenu("~h~Vous avez reÃ§u une amende de ~r~"..amcost.." $ ~w~de la part de ~b~"..namepol)
	ShowNotificationPolMenu("~h~~w~pour ~b~"..nameamende)
	ShowNotificationPolMenu("~h~Pour payer l'amende appuyez sur ~g~Y~w~ pour refuser l'amende appuyez sur ~r~N~w~.")
	ammenderecu = 1
	paramamende1 = amcost
	paramamende2 = idamende
	paramamende3 = nameamende
	paramamende4 = namepol
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
	    if IsControlJustPressed(1,246) and (ammenderecu == 1) then
			
			TriggerServerEvent('CheckAmende2', paramamende1, paramamende2, paramamende3, paramamende4)
			ammenderecu = 0
	    end
		if IsControlJustPressed(1,249) and (ammenderecu == 1) then
			
			TriggerServerEvent('CheckAmende3', paramamende1, paramamende2, paramamende3, paramamende4)
			ammenderecu = 0
	    end
	end
end)

RegisterNetEvent('CheckAmendeFinish2')
AddEventHandler('CheckAmendeFinish2', function(amcost2, nameinfra, nameamende2)
	ShowNotificationPolMenu("~h~Vous avez mis une amende de ~r~"..amcost2.." $ ~w~Ã  ~b~"..nameinfra)
	ShowNotificationPolMenu("~h~~w~pour ~b~"..nameamende2)
end)

RegisterNetEvent('CheckAmendeFinish3')
AddEventHandler('CheckAmendeFinish3', function(name)
	ShowNotificationPolMenu("~h~~b~"..name.."~w~ a payÃ© son amende.")
end)

RegisterNetEvent('CheckAmendeFinish5')
AddEventHandler('CheckAmendeFinish5', function(name)
	ShowNotificationPolMenu("~h~~b~"..name.."~w~ a ~r~RefusÃ©~w~ de payer son amende.")
end)

RegisterNetEvent('CheckAmendeFinish6')
AddEventHandler('CheckAmendeFinish6', function()
	ShowNotificationPolMenu("~h~Vous avez ~r~RefusÃ©~w~ de payer l'amende.")
end)

RegisterNetEvent('CheckAmendeFinish4')
AddEventHandler('CheckAmendeFinish4', function()
	ShowNotificationPolMenu("~h~Vous avez ~g~payÃ©~w~ l'amende.")
end)

RegisterNetEvent('CheckRetraitPermisFinish')
AddEventHandler('CheckRetraitPermisFinish', function(namepol2)
	ShowNotificationPolMenu("~h~Votre permis de conduire viens d'Ãªtre ~r~ANNULÃ‰ ~w~par ~b~"..namepol2)
end)

RegisterNetEvent('CheckRetraitPermisFinish2')
AddEventHandler('CheckRetraitPermisFinish2', function(nameRetrait)
	ShowNotificationPolMenu("~h~Vous avez ~r~ANNULÃ‰ ~w~le permis de conduire de ~b~"..nameRetrait)
end)

RegisterNetEvent('CheckRetraitPermis2Finish')
AddEventHandler('CheckRetraitPermis2Finish', function(namepol2)
	ShowNotificationPolMenu("~h~Votre permis de port d'armes viens d'Ãªtre ~r~ANNULÃ‰ ~w~par ~b~"..namepol2)
end)

RegisterNetEvent('CheckRetraitPermis2Finish2')
AddEventHandler('CheckRetraitPermis2Finish2', function(nameRetrait)
	ShowNotificationPolMenu("~h~Vous avez ~r~ANNULÃ‰ ~w~le permis de port d'armes de ~b~"..nameRetrait)
end)

RegisterNetEvent('CheckRetraitPermis3Finish')
AddEventHandler('CheckRetraitPermis3Finish', function(namepol2)
	ShowNotificationPolMenu("~h~Votre Licence de Pilote viens d'Ãªtre ~r~ANNULÃ‰ ~w~par ~b~"..namepol2)
end)

RegisterNetEvent('CheckRetraitPermis3Finish2')
AddEventHandler('CheckRetraitPermis3Finish2', function(nameRetrait)
	ShowNotificationPolMenu("~h~Vous avez ~r~ANNULÃ‰ ~w~la Licence de Pilote de ~b~"..nameRetrait)
end)

RegisterNetEvent('CheckRetraitPermis4Finish')
AddEventHandler('CheckRetraitPermis4Finish', function(namepol2)
	ShowNotificationPolMenu("~h~Votre permis de bateau viens d'Ãªtre ~r~ANNULÃ‰ ~w~par ~b~"..namepol2)
end)

RegisterNetEvent('CheckRetraitPermis4Finish2')
AddEventHandler('CheckRetraitPermis4Finish2', function(nameRetrait)
	ShowNotificationPolMenu("~h~Vous avez ~r~ANNULÃ‰ ~w~le permis de bateau de ~b~"..nameRetrait)
end)

RegisterNetEvent('FinishMenuPolice')
AddEventHandler('FinishMenuPolice', function()
	boughtweapon = true
	CloseCreatorPoliceMenu()
	policemenu.opened = false
	policemenu.menu.from = 1
	policemenu.menu.to = 10
	inmenucivil = 0
	inmenuinv = 0
	inmenujob = 0
end)

function OpenMenuPoliMenu(menu)
	policemenu.lastmenu = policemenu.currentmenu
	if menu == "maininteraction" then
		policemenu.lastmenu = "main"
	elseif menu == "mainvehicle"  then
		policemenu.lastmenu = "main"
	else
		policemenu.lastmenu = "main"
	end
	policemenu.menu.from = 1
	policemenu.menu.to = 10
	policemenu.selectedbutton = 0
	policemenu.currentmenu = menu	
end

function Back6()
	if backlock then
		return
	end
	backlock = true
	if policemenu.currentmenu == "main" then
		CloseCreatorPoliceMenu()
		policemenu.opened = false
		policemenu.menu.from = 1
		policemenu.menu.to = 10
		inmenucivil = 0
		inmenuinv = 0
		inmenujob = 0
	elseif policemenu.currentmenu == "citoyen1" or policemenu.currentmenu == "citoyen2" or policemenu.currentmenu == "citoyen3" or policemenu.currentmenu == "citoyen4" or policemenu.currentmenu == "citoyen5" or policemenu.currentmenu == "vehicle1" or policemenu.currentmenu == "vehicle2" then
		OpenMenuPoliMenu(policemenu.lastmenu)
	else
		OpenMenuPoliMenu(policemenu.lastmenu)
	end
end

function stringstarts6(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end