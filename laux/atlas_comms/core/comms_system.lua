resource.AddWorkshop( 635535045 );

function AtlasComms:GetJammedChars()
    local str = "";
    for _, char in RandomPairs( self.Config.JammingCharacters ) do
        str = str .. char;
    end

    return str;
end

--local deJamDelay = 1; -- in MINUTE
local channels = {};
channels[ "Reich" ] = { "Wehrmacht", "SS", "NSDAP", "High Command", "Command", "Wehrmacht High Command", "SS High Command", "Generalstab", "Offiziere der Allgemeinen-SS", "NSDAP Hauptamt", "SS Officers", "Wehrmacht Officers", "NSDAP Officers", "RSHA", "Reich Security", "RuSHA", "Polizei", "FeSchuPo", "1.SS", "Kompanie 'Bruno'", "Kompanie 'Caesar'", "Feldgendarmerie", "Logistics", "Stapo-Leitstellen", "SD-Leitabschnitt", "Amt f. Justiz", "NSDAP-Ortsgruppenleitung", "SA" };
function AtlasComms:SetJamCommsChannelState( channelName, short, state )
    self.Config.Channels[ channelName ][ short and "shortjammed" or "jammed" ] = state;

    local comms = channels[ channelName ]
    stopif not comms

    for _, comm in ipairs(comms) do
        self.Config.Channels[ comm ][ short and "shortjammed" or "jammed" ] = state;
    end
end

function AtlasComms:IsChannelJammed( channelName, short )
    return self.Config.Channels[ channelName ][ short and "shortjammed" or "jammed" ]
end

local shortJammers = {}
local soundTimer = math.random(40,210);
timer.Create("Jammer_Sound_Clue", soundTimer, 0, function()
    for _, jammer in ipairs(shortJammers) do
        for _, ent in pairs( ents.FindByClass( jammer ) ) do
            continueif IsValid( ent )

            ent:EmitSound( "ambient/levels/prison/radio_random" .. math.random(1,2) .. ".wav", 75, 75, 1 )
        end
    end
    soundTimer = math.random(40,210);
end)

function AtlasComms:FileAlert(comm, msg) -- TODO: Sync this to work with bricks, function was named FileAlert, therefore it needs to be changed.
    stopif not comm

    local plys = player.GetHumans()

    for _, ply in ipairs(plys) do
        stopif not ply:HasCommsAccess( comm )

        DarkRP.talkToPerson( ply, self.Config.Channels[ comm ].col, "[" .. comm .. "] ", Color( 255, 255, 255, 255 ), msg, ply, true );
    end
end