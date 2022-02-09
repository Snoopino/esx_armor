local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    MySQL.Async.fetchScalar("SELECT * FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.identifier
        }, function(data)
        if data[1] then
            TriggerClientEvent('esx_armor:setJoinArmor', playerId, data[1].health, data[1].armour)
        end
    end)

    if Config.Debug then
        print('Set Status')
    end
end)

ESX.RegisterServerCallback('esx_armor:getDBArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchScalar("SELECT * FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.identifier
        }, function(data)
        if data[1] then
            TriggerClientEvent('esx_armor:setJoinArmor', source, data[1].health, data[1].armour)
        end
    end)
end)

RegisterServerEvent('esx_armor:refreshArmour')
AddEventHandler('esx_armor:refreshArmour', function(updateHealth, updateArmour)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("UPDATE users SET armour = @armour, health = @health WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.identifier,
        ['@armour'] = tonumber(updateArmour),
        ['@health'] = tonumber(updateHealth)
    })

    if Config.Debug then
        print('Update Status')
    end
end)

RegisterServerEvent('esx_armor:delArmorItem')
AddEventHandler('esx_armor:delArmorItem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('nobproof')

    if hasItem.count > 0 then
        xPlayer.removeInventoryItem('nobproof', 1)
    end

    if Config.Debug then
        print('Armor Item deleted')
    end
end)

-- Armor Vest 100%
ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('esx_armor:setArmor', source, 'bproof_1')
    if Config.RemoveItem.bproof_1 then
        xPlayer.removeInventoryItem('bulletproof', 1)
    end
    xPlayer.addInventoryItem('nobproof', 1)
    TriggerClientEvent('esx:showNotification', source, _U('used_bproof'))
end)

-- Armor Vest 50%
ESX.RegisterUsableItem('bulletproof2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('esx_armor:setArmor', source, 'bproof_2')
    if Config.RemoveItem.bproof_2 then
        xPlayer.removeInventoryItem('bulletproof2', 1)
    end
    xPlayer.addInventoryItem('nobproof', 1)
    TriggerClientEvent('esx:showNotification', source, _U('used_bproof'))
end)

-- Police Armor Vest
ESX.RegisterUsableItem('bulletproofpolice', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('esx_armor:setArmor', source, 'bproof_police')
    if Config.RemoveItem.bproof_police then
        xPlayer.removeInventoryItem('bulletproofpolice', 1)
    end
    xPlayer.addInventoryItem('nobproof', 1)
    TriggerClientEvent('esx:showNotification', source, _U('used_bproof'))
end)

-- No Bulletproof Vest
ESX.RegisterUsableItem('nobproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('esx_armor:setDelArmor', source)
    xPlayer.removeInventoryItem('nobproof', 1)

    TriggerClientEvent('esx:showNotification', source, _U('used_nobproof'))
end)

---- GitHub Updater ----
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

local CurrentVersion = GetCurrentVersion()
local resourceName = "^4["..GetCurrentResourceName().."]^0"

if Config.VersionChecker then
	PerformHttpRequest('https://raw.githubusercontent.com/Musiker15/esx_armor/main/VERSION', function(Error, NewestVersion, Header)
		print("###############################")
    	if CurrentVersion == NewestVersion then
	    	print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    	elseif CurrentVersion ~= NewestVersion then
        	print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
	    	print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: ^9https://github.com/Musiker15/esx_armor/releases/tag/v'.. NewestVersion .. '^0')
    	end
		print("###############################")
	end)
else
	print("###############################")
	print(resourceName .. '^2 ✓ Resource loaded^0')
	print("###############################")
end