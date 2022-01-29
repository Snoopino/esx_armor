ESX = nil
local xPlayer = false

Citizen.CreateThread(function()
    --local ESX = exports['es_extended']:getSharedObject()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_armor:setJoinArmor')
AddEventHandler('esx_armor:setJoinArmor', function(health, armour)
    local playerPed = PlayerPedId()

    Citizen.Wait(10000)
    SetEntityHealth(playerPed, tonumber(health))
    SetPedArmour(playerPed, tonumber(armour))
    xPlayer = true

    if tonumber(armour) > 0 then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.male) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            else -- Female
                for k,v in pairs(Config.Armors.female) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if xPlayer == true then
            local playerPed = PlayerPedId()

            TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))
            Citizen.Wait(Config.Refresh * 1000)
        end
    end
end)

RegisterNetEvent('esx_armor:setArmor')
AddEventHandler('esx_armor:setArmor', function(id, type)
    local playerPed = PlayerPedId()

    if type == 'bulletproof' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.male) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            else -- Female
                for k,v in pairs(Config.Armors.female) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            end
        end)

        AddArmourToPed(playerPed, Config.Percent.bulletproof)
	    SetPedArmour(playerPed, Config.Percent.bulletproof)
        Citizen.Wait(100)
        TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))

    elseif type == 'bulletproof2' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.male) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            else -- Female
                for k,v in pairs(Config.Armors.female) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            end
        end)

        AddArmourToPed(playerPed, Config.Percent.bulletproof2)
	    SetPedArmour(playerPed, Config.Percent.bulletproof2)
        Citizen.Wait(100)
        TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))

    elseif type == 'bulletproofpolice' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then -- Male
                for k,v in pairs(Config.Armors.malepolice) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            else -- Female
                for k,v in pairs(Config.Armors.femalepolice) do
                    if skin.bproof_1 ~= v.skin1 and skin.bproof_2 ~= v.skin2 then
                        TriggerEvent('skinchanger:change', "bproof_1", v.skin1)
                        TriggerEvent('skinchanger:change', "bproof_2", v.skin2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            end
        end)

        AddArmourToPed(playerPed, Config.Percent.bulletproofpolice)
	    SetPedArmour(playerPed, Config.Percent.bulletproofpolice)
        Citizen.Wait(100)
        TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))
    end
end)

RegisterNetEvent('esx_armor:setDelArmor')
AddEventHandler('esx_armor:setDelArmor', function(id)
    local playerPed = PlayerPedId()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.bproof_1 ~= 0 then
            TriggerEvent('skinchanger:change', "bproof_1", 0)
            TriggerEvent('skinchanger:change', "bproof_2", 0)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
        end
    end)

    AddArmourToPed(playerPed, 0)
	SetPedArmour(playerPed, 0)
    Citizen.Wait(100)
    TriggerServerEvent('esx_armor:refreshArmour', GetEntityHealth(playerPed), GetPedArmour(playerPed))
end)