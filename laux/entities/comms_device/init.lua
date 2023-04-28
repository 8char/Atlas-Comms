AddCSLuaFile( "cl_init.lua" );
AddCSLuaFile( "shared.lua" );
include( "shared.lua" );

local cantUse = {};
cantUse[ "Special Containment Procedures" ] = true;

function ENT:Initialize()

    self:SetModel( "models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/electronic_brain.mdl" );
    self:PhysicsInit( SOLID_VPHYSICS );
    self:SetMoveType( MOVETYPE_VPHYSICS );
    self:SetUseType( SIMPLE_USE );
    self:SetSolid( SOLID_VPHYSICS );
    self:SetCollisionGroup( COLLISION_GROUP_WORLD );
    self:DrawShadow( false );
    self.commsChannels = false;

    local phys = self:GetPhysicsObject()

    if ( phys:IsValid() ) then
        phys:Wake()
        phys:EnableMotion( false );
    end

    timer.Create( "CH_RBeep" .. self:EntIndex(), 2, 0, function()

        if ( !IsValid( self ) ) then
            return;
        end

        if ( !self.commsChannels ) then
            timer.Remove( "CH_RBeep" .. self:EntIndex() );
            return;
        end

        if ( #self.commsChannels < 1 ) then
            return;
        end

        self:EmitSound( "npc/combine_soldier/vo/off3.wav" );

    end)

end

local dist = 200;

function ENT:Use( activator, ply )

    if ( cantUse[ RPExtraTeams[ ply:Team() ].category ] ) then
        DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] You can't use communications as", Color( 255, 125, 0, 255 ), RPExtraTeams[ ply:Team() ].category, Player( 1 ) );
    end

    if ( !self.commsChannels ) then
        if ( !ply:AddComms( ply:GetDefaultComms() ) ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "This device doesn't contain new communication channels for you", Player( 1 ) );
        end
        return;
    end

    stopif ( ply:GetPos():DistToSqr( self:GetPos() ) > ( dist * dist ) )

    if ( !ply:AddComms( self.commsChannels ) ) then
        DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "This device doesn't contain new communication channels for you", Player( 1 ) );
        return;
    end

    SafeRemoveEntity( self );
end

function ENT:OnRemove()
    timer.Remove( "CH_RBeep" .. self:EntIndex() );
end
