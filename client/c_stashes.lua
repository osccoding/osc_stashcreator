local stashList = Config.Stashs

CreateThread(function()
    if Config.Target == "qtarget" or Config.Target == "qb-target" or Config.Target == "ox_target" then
        for _, v in pairs(stashList) do
            Target():AddBoxZone("stash_creator", v.Coords, 1.5, 1.5, {
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
    else
        for _, v in pairs(stashList) do
            lib.zones.sphere {
                coords = vector3(v.Coords.x, v.Coords.y, v.Coords.z),
                radius = 1.5,
                debug = false,
                onEnter = function()
                    if GetTheJob() == v.Job then
                        lib.showTextUI(v.Target_label)
                    end
                end,
                inside = function()
                    if IsControlJustPressed(0, 38) and GetTheJob() == v.Job then
                        OpenStash(v.Name)
                    end
                end,
                onExit = function()
                    lib.hideTextUI()
                end
            }
        end
    end
end)