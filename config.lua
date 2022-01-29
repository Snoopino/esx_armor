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