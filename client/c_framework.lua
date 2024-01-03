if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

Target = function()
    if Config.Target == "qtarget" then
        return exports['qtarget']
    end
    if Config.Target == "qb-target" then
        return exports['qb-target']
    end
    if Config.Target == "ox_target" then
        return exports['qtarget']
    end
end

OpenStash = function(stash)
    if Config.Inventory == "qb" then
    local data = nil
    for _, stashData in pairs(Config.Stashs) do
        if stashData.name == stash then
            data = stashData
            break
        end
    end
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stash, {
        maxweight = data.Weight,
        slots = data.Slots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "ox" then
        exports.ox_inventory:openInventory('stash', stash)
    elseif Config.Inventory == "quasar" then
        local data = nil
        for _, stashData in pairs(Config.Stashs) do
            if stashData.name == stash then
                data = stashData
                break
            end
        end
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stash, {
            maxweight = data.Weight,
            slots = data.Slots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "chezza" then
        TriggerEvent('inventory:openStorage', "Stash", "stash"..stash, 100, 1000, nil)
    end
end

GetTheJob = function()
    if Config.Framework == "esx" then
        if ESX.GetPlayerData().job then
            return ESX.GetPlayerData().job.name
        else
            return false
        end
    elseif Config.Framework == "qb" then
        if QBCore.Functions.GetPlayerData().job then
            return QBCore.Functions.GetPlayerData().job.name
        else
            return false
        end
    end
end