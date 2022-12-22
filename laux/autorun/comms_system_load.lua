AtlasComms = AtlasComms or {}

function AtlasComms:IncludeClient(path)
    if (CLIENT) then
        include("atlas_comms/" .. path .. ".lua")
    end

    if (SERVER) then
        AddCSLuaFile("atlas_comms/" .. path .. ".lua")
    end
end

function AtlasComms:IncludeServer(path)
    if (SERVER) then
        include("atlas_comms/" .. path .. ".lua")
    end
end

function AtlasComms:IncludeShared(path)
    self:IncludeServer(path)
    self:IncludeClient(path)
end

local function Load()
    -- Initialise the config wrapper
    AtlasComms:IncludeServer("core/config_wrapper")

    -- Config
    AtlasComms:IncludeServer("configuration/config")

    -- Main files
    AtlasComms:IncludeServer("core/comms_system")
    AtlasComms:IncludeServer("core/meta_functions")
    AtlasComms:IncludeServer("core/hooks")

    AtlasComms.FinishedLoading = true
end

if (AtlasUI) then
    Load()
else
    hook.Add("AtlasUI.Loaded", "AtlasComms", Load)
end