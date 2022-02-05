# esx_armor
FiveM Script - Usable Armor Vests & Status will be saved in Databse

**Forum:** *Soon...*

## Description
* You can use the `armor` Item then you get `nobproof` Item and a Vest will be added to the Ped.
* With the `nobproof` Item then the Vest will be removed from Ped.
* Script checks all `Config.Refresh` times your status and save it in database.
* If a Player relog then the Player get the saved status from database and a Vest will be added to the Ped.
* Health and Armor will be saved in Databse.

## Config
```lua
Config = {}
----------------------------------------------------------------
Config.Locale = 'de'
Config.VersionChecker = false
----------------------------------------------------------------
-- If you want to remove Item after use
Config.RemoveItem = {
    bproof_1 = true, -- Item: bulletproof
    bproof_2 = true, -- Item: bulletproof2
    bproof_police = true -- Item: bulletproofpolice
}
----------------------------------------------------------------
-- How often Armor Status should be saved in database
Config.EnableRefresh = true
Config.Refresh = 30 -- in seconds (default: 30 seconds)
----------------------------------------------------------------
-- Set the Armor ID you want to use
Config.Armors = {
    male = {skin1 = 11, skin2 = 1}, -- Male
    female = {skin1 = 3, skin2 = 1}, -- Female
    malepolice = {skin1 = 12, skin2 = 3}, -- Male Police
    femalepolice = {skin1 = 13, skin2 = 1}, -- Female Police
}
----------------------------------------------------------------
-- How much Armor a Player get from Item
Config.Percent = {
    bproof_1 = 100, -- Item: bulletproof
    bproof_2 = 50, -- Item: bulletproof2
    bproof_police = 100 -- Item: bulletproofpolice
}
----------------------------------------------------------------
-- Animation for put on the Vest
Config.Wait = 1 -- in seconds (default: 1 second)
Config.Animations = {
    lib = 'clothingtie',
    anim = 'try_tie_neutral_a'
}
```

## Requirements
* ESX 1.2 (https://github.com/esx-framework/es_extended/releases/tag/v1-final)
* Should work with ESX Legacy too but I didn't test it.

## License
**GNU General Public License v3.0**
