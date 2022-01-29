# esx_armor
FiveM Script - Usable Armor Vests | Status saved in Databse

**Forum:** *Soon...*

## Description
* You can use the `armor` Item, then you get `noarmor` Item and a Vest will be added to your Ped.
* If you use `noarmor` Item then then the Vest will be removed from your Ped an you get the `armor` Item.
* Script checks all `Config.Refresh` times your status and save it in database.
* If a Player relog then the Player get the saved status from database and a Vest will be added to the Ped.

## Config
```lua
Config = {}
Config.Locale = 'de'
Config.VersionChecker = false

-- How often Armor Status should be saved in database
Config.Refresh = 30 -- in seconds

Config.Armors = { -- Set the Armor ID you want to use
    male = {skin1 = 11, skin2 = 1}, -- Male
    female = {skin1 = 3, skin2 = 1}, -- Female
    malepolice = {skin1 = 12, skin2 = 3}, -- Male Police
    femalepolice = {skin1 = 13, skin2 = 1}, -- Female Police
}

Config.Percent = { -- How much Armor a Player get from Item
    bulletproof = 100,
    bulletproof2 = 50,
    bulletproofpolice = 100
}
```

## Requirements
* ESX 1.2 (https://github.com/esx-framework/es_extended/releases/tag/v1-final)
* Should work with ESX Legacy too but I didn't test it.

## License
**GNU General Public License v3.0**
