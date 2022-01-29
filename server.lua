local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    MySQL.Async.fetchScalar("SELECT * FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier()
        }, function(data)
        if data[1] then
            TriggerClientEvent('esx_armor:setJoinArmor', playerId, data[1].health, data[1].armour)
        end
    end)
end)

RegisterServerEvent('esx_armor:refreshArmour')
AddEventHandler('esx_armor:refreshArmour', function(updateHealth, updateArmour)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("UPDATE users SET armour = @armour, health = @health WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier(),
        ['@armour'] = tonumber(updateArmour),
        ['@health'] = tonumber(updateHealth)
    })
end)

-- Armor Vest 100%
ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('noarmor')
    
    if hasItem.count == 0 then
        TriggerClientEvent('esx_armor:setArmor', source, 'bulletproof')
        xPlayer.removeInventoryItem('bulletproof', 1)
        xPlayer.addInventoryItem("noarmor", 1)
        
        TriggerClientEvent('esx:showNotification', source, _U('used_armor'))
    else
        TriggerClientEvent('esx:showNotification', source, _U('has_armor'))
    end
end)

-- Armor Vest 50%
ESX.RegisterUsableItem('bulletproof2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('noarmor')
    
    if hasItem.count == 0 then
        TriggerClientEvent('esx_armor:setArmor', source, 'bulletproof2')
        xPlayer.removeInventoryItem('bulletproof2', 1)
        xPlayer.addInventoryItem("noarmor2", 1)
        
        TriggerClientEvent('esx:showNotification', source, _U('used_armor'))
    else
        TriggerClientEvent('esx:showNotification', source, _U('has_armor'))
    end
end)

-- Police Armor Vest
ESX.RegisterUsableItem('bulletproofpolice', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('noarmor')
    
    if hasItem.count == 0 then
        TriggerClientEvent('esx_armor:setArmor', source, 'bulletproofpolice')
        xPlayer.removeInventoryItem('bulletproofpolice', 1)
        xPlayer.addInventoryItem("noarmorpolice", 1)
        
        TriggerClientEvent('esx:showNotification', source, _U('used_armor'))
    else
        TriggerClientEvent('esx:showNotification', source, _U('has_armor'))
    end
end)

-- No Armor Vest
ESX.RegisterUsableItem('noarmor', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('armor')

    if hasItem.count == 0 then
        TriggerClientEvent('esx_armor:setDelArmor', source)
        xPlayer.removeInventoryItem('noarmor', 1)
        xPlayer.addInventoryItem("bulletproof", 1)
        
        TriggerClientEvent('esx:showNotification', source, _U('used_noarmor'))
    else
        TriggerClientEvent('esx:showNotification', source, _U('had_armor'))
    end
end)

ESX.RegisterUsableItem('noarmor2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('armor')

    if hasItem.count == 0 then
        TriggerClientEvent('esx_armor:setDelArmor', source)
        xPlayer.removeInventoryItem('noarmor2', 1)
        xPlayer.addInventoryItem("bulletproof2", 1)
        
        TriggerClientEvent('esx:showNotification', source, _U('used_noarmor'))
    else
        TriggerClientEvent('esx:showNotification', source, _U('had_armor'))
    end
end)

ESX.RegisterUsableItem('noarmorpolice', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local hasItem = xPlayer.getInventoryItem('armor')

    if hasItem.count == 0 then
        TriggerClientEvent('esx_armor:setDelArmor', source)
        xPlayer.removeInventoryItem('noarmorpolice', 1)
        xPlayer.addInventoryItem("bulletproofpolice", 1)
        
        TriggerClientEvent('esx:showNotification', source, _U('used_noarmor'))
    else
        TriggerClientEvent('esx:showNotification', source, _U('had_armor'))
    end
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