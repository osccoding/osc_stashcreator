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
    end
end)

CreateThread(function()
    if not Config.Target then
        for _, v in pairs(stashList) do
            lib.points.new({
                coords = vector3(v.Coords.x, v.Coords.y, v.Coords.z),
                distance = 2,
                onEnter = function()
                end,
                onExit = function()
                    lib.hideTextUI()
                end,
                nearby = function()
                    lib.showTextUI(v.Target_label)
                    DrawMarker(2, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                    if IsControlJustReleased(0, 38) then
                        OpenStash(v.Name)
                    end
                end
            })
        end
    end
end)
 
