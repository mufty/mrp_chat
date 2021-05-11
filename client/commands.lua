-- StarBlazt Chat

MRP = nil

local function getPlayerData()
	while MRP == nil do
		TriggerEvent('mrp:getSharedObject', function(obj) MRP = obj end)
		Citizen.Wait(0)
	end
	while MRP.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	local playerData = MRP.GetPlayerData()
	return playerData
end

RegisterCommand('911', function(source, args, rawCommand)
    local source = GetPlayerServerId(PlayerId())
    local name = GetPlayerName(PlayerId())
    local caller = GetPlayerServerId(PlayerId())
    local msg = rawCommand:sub(4)
    TriggerServerEvent('chat:server:911source', source, caller, msg)
    TriggerServerEvent('911', source, caller, msg)
end, false)

RegisterCommand('311', function(source, args, rawCommand)
    local source = GetPlayerServerId(PlayerId())
    local name = GetPlayerName(PlayerId())
    local caller = GetPlayerServerId(PlayerId())
    local msg = rawCommand:sub(4)
    TriggerServerEvent(('chat:server:311source'), source, caller, msg)
    TriggerServerEvent('311', source, caller, msg)
end, false)


RegisterNetEvent('chat:EmergencySend911r')
AddEventHandler('chat:EmergencySend911r', function(fal, caller, msg)
	Citizen.CreateThread(function()
		local PlayerData = getPlayerData()
	    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
	        TriggerEvent('chat:addMessage', {
	        template = '<div class="chat-message emergency">911r {0} ({1}): {2} </div>',
	        args = {caller, fal, msg}
	        });
	    end
	end)
end)

RegisterNetEvent('chat:EmergencySend311r')
AddEventHandler('chat:EmergencySend311r', function(fal, caller, msg)
	Citizen.CreateThread(function()
		local PlayerData = getPlayerData()
	    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
	        TriggerEvent('chat:addMessage', {
	        template = '<div class="chat-message nonemergency">311r {0} ({1}): {2} </div>',
	        args = {caller, fal, msg}
	        });
	    end
	end)
end)

RegisterNetEvent('chat:EmergencySend911')
AddEventHandler('chat:EmergencySend911', function(fal, caller, msg)
	Citizen.CreateThread(function()
		local PlayerData = getPlayerData()
	    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
	        TriggerEvent('chat:addMessage', {
	        template = '<div class="chat-message emergency">911 {0} ({1}): {2} </div>',
	        args = {caller, fal, msg}
	        });
	    end
	end)
end)

RegisterNetEvent('chat:EmergencySend311')
AddEventHandler('chat:EmergencySend311', function(fal, caller, msg)
	Citizen.CreateThread(function()
		local PlayerData = getPlayerData()
	    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
	        TriggerEvent('chat:addMessage', {
	        template = '<div class="chat-message nonemergency">311 {0} ({1}): {2} </div>',
	        args = {caller, fal, msg}
	        });
	    end
	end)
end)

RegisterCommand('911r', function(target, args, rawCommand)
	Citizen.CreateThread(function()
		local PlayerData = getPlayerData()
	    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
	        local source = GetPlayerServerId(PlayerId())
	        local target = tonumber(args[1])
	        local msg = rawCommand:sub(8)
	        TriggerServerEvent(('chat:server:911r'), target, source, msg)
	        TriggerServerEvent('911r', target, source, msg)
	    end
	end)
end, false)

RegisterCommand('311r', function(target, args, rawCommand)
	Citizen.CreateThread(function()
		local PlayerData = getPlayerData()
	    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
	        local source = GetPlayerServerId(PlayerId())
	        local target = tonumber(args[1])
	        local msg = rawCommand:sub(8)
	        TriggerServerEvent(('chat:server:311r'), target, source, msg)
	        TriggerServerEvent('311r', target, source, msg)
	    end
	end)
end, false)
