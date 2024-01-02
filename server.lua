local Inventory = exports.ox_inventory

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        for _, v in pairs(Config.Stashs) do
            if v.Job then
                Inventory:RegisterStash(v.Name, v.Label, v.Slots, v.Weight, nil, { [v.Job] = 0 }, v.Coords)
            else
                Inventory:RegisterStash(v.Name, v.Label, v.Slots, v.Weight, nil, nil, v.Coords)
            end
        end
    end
end)
