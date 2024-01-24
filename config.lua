Config = {
    Framework = 'esx', -- esx or qb
    Inventory = 'ox', -- qb or ox or quasar or chezza
    Target = false, -- qtarget or qb-target or ox_target or false == no target but textui and drawmarker
}

Config.Stashs = {
    Cardealer = {
        Name = "cardealer",
        Label = "Cardealer stash",
        Slots = 20,
        Weight = 50000, -- 50 KG
        Code = true, CodeText = "1234",
        Target_icon = "fas fa-box-open",
        Target_label = "Ouvrir le coffre",
        Job = 'cardealer', -- nil = all
        Coords = vector3(230.2142, -202.5376, 53.9232),
    },
    Police = {
        Name = "police",
        Label = "Police stash",
        Slots = 20,
        Code = false, CodeText = "2222",
        Weight = 50000, -- 50 KG
        Target_icon = "fas fa-box-open",
        Target_label = "Open Stash",
        Job = 'police', -- nil = all
        Coords = vector3(233.3831, -208.2868, 54.0278),
    }
}