require "resources/darkrp/lib/MySQL"
local config = require("resources/darkrp/config/config")
local version = require("resources/darkrp/version")

-- open mysql
MySQL:open(config.database.host, config.database.name, config.database.username, config.database.password)

-- check version
print("Version : "..version)
PerformHttpRequest("https://raw.githubusercontent.com/RyUkApples/DarkRP/master/darkrp/gamemode/version.lua",function(err,text,headers)
  if err == 0 then
    text = string.gsub(text,"return ","")
    local r_version = tonumber(text)
    if version ~= r_version then
      print("WARNING: A new version is available here https://github.com/RyUkApples/DarkRP, update to benefit from the last features and to fix exploits/bugs.")
    end
  else
    print("Unable to check the remote version")
  end
end, "GET", "")

-- handlers

AddEventHandler("playerConnecting",function(name,setMessage)
  local ids = GetPlayerIdentifiers(source)
  if ids ~= nil and #ids > 0 then
    local user_id = getUserIdByIdentifiers(ids)
    if user_id == nil then
      user_id = registerUser(ids)
      -- redo getUserIdByIdentifiers, there is a strange TriggerEvent issue with the id returned by registerUser
	  -- user_id = vRP.getUserIdByIdentifiers(ids)
    end

    -- if user_id ~= nil and vRP.rusers[user_id] == nil then -- check user validity and if not already connected (old way, disabled until playerDropped is sure to be called)
    if user_id ~= nil then -- check user validity 
      if not isBanned(user_id) then
        if not config.whitelist or isWhitelisted(user_id) then
          SetTimeout(1,function() -- create a delayed function to prevent the nil <-> string deadlock issue
          if rusers[user_id] == nil then -- not present on the server, init
            -- init entries
            users[ids[1]] = user_id
            rusers[user_id] = ids[1]
            user_tables[user_id] = {}
            user_tmp_tables[user_id] = {}
            user_sources[user_id] = source

            -- load user data table
            -- gsub fix a strange deadlock issue with " in json data
            local sdata = getUData(user_id,"DarkRP:datatable")

  --          local s = json.decode([[{"hunger":0,"thirst":0}"]]) -- prevent strange json deadlock at next decode

            local data = json.decode(sdata)
            if type(data) == "table" then user_tables[user_id] = data end

            -- init user tmp table
            local tmpdata = getUserTmpTable(user_id)
            tmpdata.last_login = getLastLogin(user_id) or ""
            tmpdata.spawns = 0

            -- set last login
            local ep = GetPlayerEP(source)
            local last_login_stamp = string.sub(ep,1,string.find(ep,":")-1).." "..os.date("%H:%M:%S %d/%m/%Y")
            q_set_last_login:bind("@user_id",user_id)
            q_set_last_login:bind("@last_login",last_login_stamp)
            q_set_last_login:execute()

            -- trigger join
            print("[DarkRP] "..name.." ("..GetPlayerEP(source)..") joined (user_id = "..user_id..")")
            TriggerEvent("DarkRP:playerJoin", user_id, source, name, tmpdata.last_login)

          else -- already connected
            print("[DarkRP] "..name.." ("..GetPlayerEP(source)..") re-joined (user_id = "..user_id..")")
            TriggerEvent("DarkRP:playerRejoin", user_id, source, name)

            -- reset first spawn
            local tmpdata = getUserTmpTable(user_id)
            tmpdata.spawns = 0
          end

		  Debug.pend()
          end)
        else
          print("[DarkRP] "..name.." ("..GetPlayerEP(source)..") try to joining but is not Whitelited (user-id = "..user_id..").")
          setMessage("[DarkRP] Your not Whitelited (user-id = "..user_id..").")
          CancelEvent()
        end
      else
        print("[DarkRP] "..name.." ("..GetPlayerEP(source)..") rejected: banned (user_id = "..user_id..")")
        setMessage("[DarkRP] Banned (user_id = "..user_id..").")
        CancelEvent()
      end
    else
      print("[DarkRP] "..name.." ("..GetPlayerEP(source)..") rejected: identification error")
      setMessage("[DarkRP] Identification error.")
      CancelEvent()
    end
  else
    print("[DarkRP] "..name.." ("..GetPlayerEP(source)..") rejected: missing identifiers")
    setMessage("[DarkRP] Missing identifiers.")
    CancelEvent()
  end
end)

AddEventHandler("playerDropped",function(reason)
  local user_id = getUserId(source)

  -- remove player from connected clients
  TriggerClientEvent("removePlayer", source, -1)
  --vRPclient.removePlayer(-1,{source})

  if user_id ~= nil then
    TriggerEvent("DarkRP:playerLeave", user_id, source)

    -- save user data table
    setUData(user_id,"DarkRP:datatable",json.encode(getUserDataTable(user_id)))

    print("[DarkRP] "..GetPlayerEP(source).." disconnected (user_id = "..user_id..")")
    users[rusers[user_id]] = nil
    rusers[user_id] = nil
    user_tables[user_id] = nil
    user_tmp_tables[user_id] = nil
    user_sources[user_id] = nil
  end
end)