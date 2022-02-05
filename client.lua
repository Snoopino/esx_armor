ESX = nil

Citizen.CreateThread(function()
    --local ESX = exports['es_extended']:getSharedObject() -- Just a Test, don't touch!
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_armor:setJoinArmor')
AddEventHandler('esx_armor:setJoinArmor', function(health, armour)
    local playerPed = PlayerPedId()

    Citizen.Wait(10000) -- Please Do Not Touch!
    SetEntityHealth(playerPed, tonumber(health))
    SetPedArmour(playerPed, tonumber(armour))

    if tonumber(armour) > 0 then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.male) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            else -- Female
                for k,v in pairs(Config.Armors.female) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
            
        if Config.EnableRefresh then
            TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))
            Citizen.Wait(Config.Refresh * 1000)
        end
    end
end)

RegisterNetEvent('esx_armor:setArmor')
AddEventHandler('esx_armor:setArmor', function(type)
    local playerPed = PlayerPedId()
    local lib = Config.Animations.lib
    local anim = Config.Animations.anim

    ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
		RemoveAnimDict(lib)
	end)
	Citizen.Wait(Config.AnimWait * 1000)
	ClearPedTasks(playerPed)

    if type == 'bproof_1' then
        if Config.Debug then
            print('set bproof_1')
        end
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.male) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            else -- Female
                for k,v in pairs(Config.Armors.female) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            end
        end)

        SetPedArmour(playerPed, Config.Percent.bproof_1)
        Citizen.Wait(100)
        TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))

    elseif type == 'bproof_2' then
        if Config.Debug then
            print('set bproof_2')
        end
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.male) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            else -- Female
                for k,v in pairs(Config.Armors.female) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            end
        end)

        SetPedArmour(playerPed, Config.Percent.bproof_2)
        Citizen.Wait(100)
        TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))

    elseif type == 'bproof_police' then
        if Config.Debug then
            print('set bproof_police')
        end
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.malepolice) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            else -- Female
                for k,v in pairs(Config.Armors.femalepolice) do
                    TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                    TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                end
            end
        end)

        SetPedArmour(playerPed, Config.Percent.bproof_police)
        Citizen.Wait(100)
        TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))
    end
end)

RegisterNetEvent('esx_armor:setDelArmor')
AddEventHandler('esx_armor:setDelArmor', function(id)
    local playerPed = PlayerPedId()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        if skin.bproof_1 ~= 0 then
            TriggerEvent('skinchanger:change', "bproof_1", 0)
            TriggerEvent('skinchanger:change', "bproof_2", 0)
        end
    end)

    SetPedArmour(playerPed, 0)
    Citizen.Wait(100)
    TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))
end)