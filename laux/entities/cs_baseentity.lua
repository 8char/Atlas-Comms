AddCSLUAFile()

ATLASCOMMS_JOB = 1
ATLASCOMMS_CATEGORY = 2

-- Don't add the entity to the Q menu as it's only a base for other entities
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.PrintName		= "Communications Device"
ENT.Author			= "Atlas"
ENT.Contact			= ""
ENT.Purpose			= "Contains the communications channels of its former owners"
ENT.Instructions	= "Pick it up"
ENT.Category 		= "Atlas's Comms System"
ENT.Model           = "models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/electronic_brain.mdl"

--[[
    What job/category it should ignore. Structured as such:
    ENT.CanUse = {
        { type = ATLASCOMMS_CATEGORY,   ["Clone Troopers"]  = true},
        { type = ATLASCOMMS_CATEGORY,   ["501st Legion"]    = true},
        { type = ATLASCOMMS_JOB,        ["Republic Droid"]  = true}
    }
]]--

ENT.CanUse = {}
ENT.MinimumDistance = 200
ENT.CommsChannels = {}
ENT.OneTimeUse = false
ENT.CommsProabability = 1
ENT.CooldownTime = 60

function ENT:Initialize()
    self:SetModel( self.Model );
    self:PhysicsInit( SOLID_VPHYSICS );
    self:SetMoveType( MOVETYPE_VPHYSICS );
    self:SetUseType( SIMPLE_USE );
    self:SetSolid( SOLID_VPHYSICS );
    self:SetCollisionGroup( COLLISION_GROUP_WORLD );
    self:DrawShadow( false );

    local phys = self:GetPhysicsObject()

    if ( phys:IsValid() ) then
        phys:Wake()
        phys:EnableMotion( false );
    end

    timer.Create( "AtlasComms.Beep." .. self:EntIndex(), 2, 0, function()

        if not IsValid( self ) then return end

        if not self.CommsChannels then
            timer.Remove( "AtlasComms.Beep." .. self:EntIndex() );
            return;
        end

        if not #self.CommsChannels < 1 then return end

        self:EmitSound( "npc/combine_soldier/vo/off3.wav" )
    end)
end


function ENT:Use( activator, ply )
    local canUse = false
    for _, v in ipairs(self.CanUse) do
        if v.type == ATLASCOMMS_CATEGORY then
            canUse = v[RPExtraTeams[ ply:Team() ].category]
        elseif v.type == ATLASCOMMS_JOB then
            canUse = v[RPExtraTeams[ ply:Team() ].name]
        end

        if canUse then break end
    end

    if not canUse then
        DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM] You can't steal comms as", Color( 255, 125, 0, 255 ), RPExtraTeams[ ply:Team() ].name, Player( 1 ) );
        return
    end

    if self:IsOnCooldown(ply) then
        DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "This device doesn't contain new communication channels for you as you are on cooldown", Player( 1 ) );
        return
    end

    if not self.CommsChannels and not self.OneTimeUse then
        if not ply:AddComms( ply:GetDefaultComms() ) then
            DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "This device doesn't contain new communication channels for you", Player( 1 ) );
        end
        return;
    end

    if ply:GetPos():DistToSqr( self:GetPos() ) > math.pow(self.MinimumDistance, 2) then return end

    if not ply:AddComms( self:RandomCommsSubset(self.CommsProabability) ) then
        DarkRP.talkToPerson( ply, Color( 0, 100, 255, 255 ), "[COMMS SYSTEM]", Color( 255, 125, 0, 255 ), "You were unsucessfull in collecting communication channels", Player( 1 ) );
    end
    self:StartCooldown(self.CooldownTime)

    if self.OneTimeUse then
        SafeRemoveEntity( self )
    end
end

function ENT:OnRemove()
    timer.Remove( "AtlasComms.Beep." .. self:EntIndex() );
end

-- This function takes a table and a probability (a number between 0 and 1)
-- and returns a new table with some of the values from the original table
-- based on the probability.
function ENT:RandomCommsSubset( probability )
    -- Create an empty table to store the result
    local result = {}

    -- Iterate over the elements in the original table
    for k, v in pairs( self.CommsChannels ) do
        -- Use the math.random function to generate a random number between 0 and 1
        if math.random() < probability then
            -- If the random number is less than the probability, add the element
            -- to the result table
            table.insert(result, v)
        end
    end

    return result
end

function ENT:IsOnCooldown(ply)
    ply.commsCooldowns = ply.commsCooldowns or {}

    return ply.commsCooldowns[self:EntIndex()]
end

function ENT:StartCooldown(delta)
    local entIndex = self:EntIndex()
    ply.commsCooldowns = ply.commsCooldowns or {}
    ply.commsCooldowns[entIndex] = true

    timer.Simple(delta, function()
        if not IsValid(ply) then return end

        ply.commsCooldowns[entIndex] = false;
    end)
end
