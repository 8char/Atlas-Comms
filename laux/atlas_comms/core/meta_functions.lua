local meta = FindMetaTable("Player")

function meta:GetDefaultComms()

    if not IsValid( self ) then return false end

    if AtlasComms.Config.IgnoreJobs[ team.GetName( self:Team() ) ] then
        return false;
    end

    local tbl = {};

    if AtlasComms.Config.AdminJobs[ team.GetName( self:Team() ) ] then
        for k,v in pairs( AtlasComms.Config.Channels ) do
            table.insert( tbl, k );
        end

        return tbl;
    end

    local defaultCategoryComms = ( AtlasComms.Config.JobComms[ RPExtraTeams[ self:Team() ].category ] ) or false
    local defaultJobComms = ( AtlasComms.Config.JobComms[ team.GetName( self:Team() ) ] ) or false

    if ( defaultCategoryComms ) then
        for i = 1, #defaultCategoryComms do
            if ( table.HasValue( tbl, defaultCategoryComms[ i ] ) ) then
                continue;
            end

            table.insert( tbl, defaultCategoryComms[ i ] );
        end
    end

    if ( defaultJobComms ) then
        for i = 1, #defaultJobComms do
            if ( table.HasValue( tbl, defaultJobComms[ i ] ) ) then
                continue;
            end

            table.insert( tbl, defaultJobComms[ i ] );
        end
    end

    return tbl;

end

function meta:GetComms()
    if not IsValid( self ) then return false end

    if not self.channelComms then return false end

    if self.channelComms and ( #self.channelComms > 0 ) then return self.channelComms end

    return false;
end

function meta:AddComms( tbl )
    if not IsValid( self ) then return end

    if not self.channelComms then self.channelComms = {} end

    if AtlasComms.Config.CantUseJobs[ RPExtraTeams[ self:Team() ].category ] then return false end

    if not ( tbl and ( #tbl > 0 ) ) then return end

    local nTbl = {};

    local count = 0;

    for i = 1, #tbl do
        if ( table.HasValue( self.channelComms, tbl [ i ] ) ) then
            continue;
        end

        local comm = AtlasComms.Config.Channels[ tbl[ i ] ] or false

        if not comm then continue end

        count = ( count + 1 );

        for k, v in ipairs(comm.commands) do
            comm.commands[k] = string.format("/%s", v)
        end

        table.insert( self.channelComms, tbl[ i ] );
        table.insert( nTbl, tbl[ i ] .. ": ( " .. table.concat( comm.commands, ", " ) .. " )" );
    end

    if ( count > 0 ) then

        DarkRP.talkToPerson( self, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] You've got " .. #tbl .. " new radio channels", Color( 255, 125, 0, 255 ), table.concat( nTbl, ", " ), Player( 1 ) );

        self:EmitSound( "npc/overwatch/radiovoice/off2.wav" );

        return true;

    end

    return false;
end

function meta:StripComms()
    if not IsValid( self ) then return false end

    self.channelComms = false;
end

function meta:HasCommsAccess( commsChannel )
    if not IsValid( self ) then return false end
    if AtlasComms.Config.CantUseJobs[ RPExtraTeams[ self:Team() ].category ] then return false end

    return ( self.channelComms and ( #self.channelComms > 0 ) ) and table.HasValue( self.channelComms, commsChannel )
end