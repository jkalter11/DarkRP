require "resources/mysql-async/lib/MySQL"

function nameJob(id)
  return MySQL.Sync.fetchScalar("SELECT job_name FROM jobs WHERE job_id = @namejob", {['@namejob'] = id})
end

function updatejob(player, id)
  local job = id
  MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = job, ['@identifier'] = player})
end

function quitLastJob(source, job)
  if job == 1 then
  elseif job == 2 then
    TriggerClientEvent("darkrp:poolEnding", source)
  elseif job == 3 then
    TriggerClientEvent("darkrp:binEnding", source)
  elseif job == 4 then
    TriggerClientEvent("darkrp:mineEnding", source)
  elseif job == 5 then

  elseif job == 6 then
    TriggerClientEvent("darkrp:endingDay", source)
  elseif job == 7 then
    TriggerClientEvent("darkrp:endingDay", source)
  elseif job == 8 then
    TriggerClientEvent("darkrp:endingDay", source)
  elseif job == 9 then
    TriggerClientEvent("darkrp:endingDay", source)
  elseif job == 10 then

  elseif job == 11 then
    TriggerClientEvent("darkrp:orgEnding", source)
  elseif job == 12 then
    TriggerClientEvent("darkrp:morgEnding", source)
  elseif job == 13 then
    TriggerEvent('darkrp:endingService', source, 0)
  end
end

RegisterServerEvent('darkrp:jobs')
AddEventHandler('darkrp:jobs', function(id)
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local source = source
      local player = user.identifier

      ------ Quit Last job
      local job = user:getJob()
      quitLastJob(source, job)
      ------ Get New Job
      local nameJob = nameJob(id)
      updatejob(player, id)
      user:setJob(id)
      TriggerEvent('darkrp:getjobss', source)
      TriggerClientEvent("darkrp:notifylong", source, "CHAR_AMANDA", 1, "Mairie", false, "Your job is now : "..nameJob)
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

RegisterServerEvent('darkrp:getjobs')
AddEventHandler('darkrp:getjobs', function()
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local source = source
      TriggerClientEvent("darkrp:getJobs", source, user:getJob())
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)

RegisterServerEvent('darkrp:getjobss')
AddEventHandler('darkrp:getjobss', function(source)
  TriggerEvent('darkrp:getPlayerFromId', source, function(user)
    if (user) then
      local source = source
      TriggerClientEvent("darkrp:getJobs", source, user:getJob())
    else
      TriggerEvent("darkrp:desyncMsg")
    end
  end)
end)
