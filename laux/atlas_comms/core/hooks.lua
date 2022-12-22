hook.Add("PlayerSay", "AtlasComms.GroupHandling", function( ply, txt, teamChat )
    if teamChat then return "" end

    local channel = false;
    local msg = "";

    for k,v in pairs( AtlasComms.Config.Channels ) do
        if not ply:HasCommsAccess( k ) then continue end

        local commands = v.commands;

        for i = 1, #commands do
            local chatCommand = "/" .. commands[ i ]
            if ( ( string.lower( chatCommand ) .. " " ) == ( string.sub( string.lower( txt ), 1, #chatCommand + 1 ) ) ) then
                channel = k;
                msg = ( string.sub( txt, #chatCommand + 2 ) );
                break;
            end
        end
    end

    if not channel then return end

    if msg == "" then return end

    local shortJammerRange = 2250;
    if ( isChannelJammed( channel ) ) then
        DarkRP.talkToPerson( ply, AtlasComms.Config.Channels[ channel ].color, "[" .. channel .. "] " .. ply:Name(), Color( 255, 125, 0, 255 ), AtlasComms:GetJammedChars(), ply, true );
        for _, v in ipairs(player.GetAll()) do
            if (v:GetPos():Distance(ply:GetPos()) <= 170) then
                DarkRP.talkToPerson(v, Color(150, 150, 150, 255), ply:Name(), Color( 255, 255, 255, 255 ), msg, ply, true)
            end
        end
        return "";
    elseif (isChannelShortJammed( channel ) ) then
        for i = 1, #shortJammers do --Run for the number of short jammer entities
            for k, v in ipairs( ents.FindByClass( shortJammers[i] ) ) do
                local dist = ply:GetPos():Distance(v:GetPos())
                if (dist < shortJammerRange) then return end -- if in range of the entity, block comms

                DarkRP.talkToPerson( ply, AtlasComms.Config.Channels[ channel ].color, "[" .. channel .. "] " .. ply:Name(), Color( 255, 125, 0, 255 ), AtlasComms:GetJammedChars(), ply, true );
                for _, v2 in ipairs(player.GetAll()) do
                    if v2:GetPos():Distance(ply:GetPos()) > 170 then return end
                    DarkRP.talkToPerson(v2, Color(150, 150, 150, 255), ply:Name(), Color( 255, 255, 255, 255 ), msg, ply, true)
                end
                return "";
            end
        end
    end
    local plys = player.GetAll();
    local seen = {}
    for i = 1, #plys do
        if ( plys[ i ]:HasCommsAccess( channel ) ) then
            seen[plys[ i ]] = true
            DarkRP.talkToPerson( plys[ i ], AtlasComms.Config.Channels[ channel ].color, "[" .. channel .. "] " .. ply:Name(), Color( 255, 255, 0, 255 ), msg, ply, true );
        end
    end
    for _, v in ipairs(plys) do
        if (v == ply or seen[v]) then continue end
        if (v:GetPos():Distance(ply:GetPos()) <= 170) then
            DarkRP.talkToPerson(v, Color(150, 150, 150, 255), ply:Name(), Color( 255, 255, 255, 255 ), msg, ply, true)
        end
    end

    ply:EmitSound( "scprp/radioBeep.mp3" );

    return "";

end)


local cmdDist = 300;
hook.Add( "PlayerSay", "AtlasComms.StripCommsCommandListener", function( ply, txt )
    if ( string.lower( txt ) == "/stripcomms" ) then
        local tar = ply:GetEyeTraceNoCursor().Entity;
        local stripcomms_jobs = AtlasComms.Config.CanStripComms
        if not table.HasValue( stripcomms_jobs, team.GetName( ply:Team() ) ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "You cannot strip comms", Player( 1 ) );
            return "";
        end
        local stripcomms_bl = AtlasComms.Config.StripCommsBlacklist
        if ( table.HasValue( stripcomms_bl, team.GetName( tar:Team() ) ) ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "The target cannot be stripped", Player( 1 ) );
            return "";
        end
        if not IsValid( tar ) then return end

        if not tar:IsPlayer() then return end

        if ( ply:GetPos():DistToSqr( tar:GetPos() ) > ( cmdDist * cmdDist ) ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "The target is too far away", Player( 1 ) );
            return "";
        end

        if ( tar:GetActiveWeapon():GetClass() ~= "weapon_handcuffed" ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "The target needs to be cuffed in order to have its radio stripped", Player( 1 ) );
            return "";
        end

        if not tar:GetComms() then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "The target has no radio", Player( 1 ) );
            return "";
        end

        ply:AddComms( tar:GetComms() );
        tar:StripComms();
        tar:AddComms( AtlasComms.Config.GlobalComms );
        tar:EmitSound( "npc/combine_soldier/gear1.wav" );

        for k,v in pairs( ents.FindInSphere( ply:GetPos(), 500 ) ) do
            if not IsValid( v ) then
                continue;
            end

            if not v:IsPlayer() then
                continue;
            end

            DarkRP.talkToPerson( v, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), ply:Name() .. " has stripped " .. tar:Name() .. " of their radio", ply );
        end

        return "";
    end
end)

local giveCmd = "/givecomms";

hook.Add( "PlayerSay", "AtlasComms.GiveCommsCommandListener", function( ply, txt )

    local msg = "";

    if ( string.sub( string.lower( txt ), 1, #giveCmd + 1 ) == giveCmd .. " " ) then
        msg = string.sub( string.lower( txt ), #giveCmd + 2 );

        if msg == "" then return end

        local chn = false;

        for k,v in pairs( AtlasComms.Config.Channels ) do
            if ( string.lower( k ) == string.lower( msg ) ) then
                chn = k;
                break;
            end
        end

        if not chn then return end

        if not ply:HasCommsAccess( chn ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] You don't have access to", Color( 255, 125, 0, 255 ), chn, Player( 1 ) );
            return "";
        end

        local tar = ply:GetEyeTraceNoCursor().Entity;

        if not IsValid( tar ) then return end

        if not tar:IsPlayer() then return end

        if ( ply:GetPos():DistToSqr( tar:GetPos() ) > ( cmdDist * cmdDist ) ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "The target is too far away", Player( 1 ) );
            return "";
        end

        if not tar:AddComms( { chn } ) then
            DarkRP.talkToPerson( tar, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] You already have access to", Color( 255, 125, 0, 255 ), chn, Player( 1 ) );
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] The target already has access to", Color( 255, 125, 0, 255 ), chn, Player( 1 ) );
            return "";
        end

        table.RemoveByValue( ply.channelComms, chn );

        for k, ent in pairs( ents.FindInSphere( ply:GetPos(), 500 ) ) do

            if not IsValid( ent ) then continue end

            if not ent:IsPlayer() then continue end

            DarkRP.talkToPerson( ent, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), ply:Name() .. " has given their " .. chn .. " access to " .. tar:Name(), ply );

        end

        return "";
    end
end)

hook.Add( "PlayerSay", "AtlasComms.CommsCommandListener", function( ply, txt )
    if ( string.lower( txt ) == "/comms" ) then
        local commsTbl = ply:GetComms();

        if not commsTbl then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "You don't have access to any radio channels", ply );
            return "";
        end

        local nTbl = {};

        for i = 1, #commsTbl do
            local comm = AtlasComms.Config.Channels[ commsTbl [ i ] ] or false

            if not comm then continue end

            for k, v in ipairs(comm.commands) do
                comm.commands[k] = string.format("/%s", v)
            end

            table.insert( nTbl, commsTbl[ i ] .. ": ( " .. table.concat( comm.commands, ", " ) .. " )" );
        end

        DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] You have access to", Color( 255, 125, 0, 255 ), table.concat( nTbl, ", " ), ply );

        return "";
    end
end)

hook.Add( "PlayerLoadout", "AtlasComms.EquipDefault", function( ply )
    if not IsValid( ply ) then return end

    ply:StripComms();

    ply:AddComms( ply:GetDefaultComms() );
end)