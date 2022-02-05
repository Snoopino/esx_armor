Config = {}
----------------------------------------------------------------
Config.Locale = 'de'
Config.VersionChecker = false
Config.Debug = false
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
    femalepolice = {skin1 = 13, skin2 = 1} -- Female Police
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
Config.AnimWait = 1 -- in seconds (default: 1 second)
Config.Animations = {
    lib = 'clothingtie',
    anim = 'try_tie_neutral_a'
}
----------------------------------------------------------------