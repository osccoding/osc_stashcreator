Config = {
    Framework = 'esx', -- esx or qb
    Inventory = 'ox', -- qb or ox or quasar or chezza
    Target = "qtarget", -- qtarget or qb-target or ox_target or false == no target but textui and marker
}

Config.Stashs = {
    Cardealer = {
        Name = "cardealer",
        Label = "Cardealer stash",
        Slots = 20,
        Weight = 50000, -- 50 KG
        Target_icon = "fas fa-box-open",
        Target_label = "Open Stash",
        Job = 'cardealer', -- nil = all
        Coords = vector3(243.2209, -151.0305, 61.1648),
    },
    --[[
            Cardealer = {
        Name = "cardealer",
        Label = "Cardealer stash",
        Slots = 20,
        Weight = 50000, -- 50 KG
        Target_icon = "fas fa-box-open",
        Target_label = "Open Stash",
        Job = 'cardealer', -- nil = all
        Coords = vector3(-764.2708, -1434.9412, 5.0576),
    }
    ]]
}