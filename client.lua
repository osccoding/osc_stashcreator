local Target = exports.qtarget
local Inventory = exports.ox_inventory

OpenStash = function(stash)
    Inventory:openInventory('stash', stash)
end

CreateThread(function()
    for k, v in pairs(Config.Stashs) do
        Target:AddBoxZone("stash_creator", v.Coords, 1.5, 1.5, {
            name = "stash_creator",
            heading = v.Coords.w,
            debugPoly = false,
            minZ = v.Coords.z - 1.0,
            maxZ = v.Coords.z + 1.0
        }, {
            options = {
                {
                    icon = v.Target_icon,
                    label = v.Target_label,
                    job = v.Job,
                    canInteract = function()
                        return true
                    end,
                    action = function()
                        OpenStash(v.Name)
                    end
                }
            },
            distance = 2.5
        })
    end
end)