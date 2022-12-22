if SAM_LOADED then return end

local sam, command = sam, sam.command

local function findByCommand(commsCommand)
    for k, v in pairs(AtlasComms.Config.Channels) do
        if table.HasValue(v["commands"], commsCommand) then
            return k
        end
    end
    return nil
end

command.new("givecomms")
    :SetPermission("give_comms", "admin")
    :SetCategory("Utility")
    :Help("Give comms to the target player(s)")

    :AddArg("player", {
        optional = false,
        single_target = false,
        allow_higher_target = false
    })

    :AddArg("text")

    :OnExecute(function(ply, players, comms)
        for k, v in ipairs(players) do
            local commsName = findByCommand(comms)
            if not commsName then
                return sam.player.send_message(ply, "Could not find {V} comms, please reffer to the document for all comms commands.", {
                    V = comms
                })
            end

            if superadminComms[commsName] then
                v:AddComms({ commsName })
                return sam.player.send_message(nil, "{A} gave {T} {V} comms", {
                    A = ply, T = players, V = comms
                })
            end

            if not ply:IsSuperAdmin() then
                return sam.player.send_message(ply, "Could not give {T} {V} comms because it's restricted to superadmin!", {
                    T = players, V = comms
                })
            end

            v:AddComms({ commsName })
            sam.player.send_message(nil, "{A} gave {T} {V} comms", {
                A = ply, T = players, V = comms
            })
        end
    end)
:End()