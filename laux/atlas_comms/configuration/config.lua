local cfg = AtlasComms.Config

cfg:CreateCommsEntity("comms_station")

--[[
    The AddComms function takes three arguments: a name string, a command aliases table, and a color value.
    The name and aliases are used to identify the comm and the color is used to specify the color to
    use for the comm in the comms list. This function does not return any values.

    For example, the following code would add a new comm named "Open" with the
    command aliases "open" and "o", and with a color of Color( 20, 150, 20):

    cfg:AddComms("Open", { "open", "o" }, Color( 20, 150, 20))
]]--

-- Large-scale Comms
cfg:AddComms("Open", { "open", "o" },                       Color( 20, 150, 20))
cfg:AddComms("Republic", { "republic", "r" },               Color( 200, 0, 0))
cfg:AddComms("Clone", { "clone","c" },                      Color( 255, 255, 255))
cfg:AddComms("Jedi", { "jedi","j" },                        Color( 50, 223, 207))
cfg:AddComms("Scavenger", { "Scavenger","scav" },           Color( 0, 0, 0))

-- Regimental Comms
cfg:AddComms("Clone Troopers", { "ct" },                    Color( 255, 255, 255))
cfg:AddComms("501st Legion", { "501" },                     Color( 0, 52, 255))
cfg:AddComms("212th Attack Battalion", { "212" },           Color( 255, 163, 5))
cfg:AddComms("442nd Siege Battalion", { "442" },            Color( 106, 161, 60, 1 ))
cfg:AddComms("Combat Engineers", { "ce" },                  Color( 233, 144, 0))
cfg:AddComms("Clone Guards", { "cg" },                      Color( 255, 0, 0))
cfg:AddComms("Galactic Marines", { "gm" },                  Color( 110, 0, 60))
cfg:AddComms("104th Wolfpack Battalion", { "104" },         Color(72, 74, 71, 255))
cfg:AddComms("41st Ranger Platoon", { "41" },               Color( 80, 200, 80))
cfg:AddComms("Republic Commandos", { "rc" },                Color( 86, 86, 86))
cfg:AddComms("ARC", { "arc" },                              Color( 86, 86, 86))
cfg:AddComms("RC-Shadow", { "rcs" },                        Color( 86, 86, 86))
cfg:AddComms("Medics", { "medic", "m" },                    Color( 24, 125, 142))
cfg:AddComms("Battalion", { "batt" },                       Color( 132, 132, 138))
cfg:AddComms("High Command", { "hc" },                      Color( 86, 86, 86))
cfg:AddComms("Jedi Shadows", { "shadow" },                  Color( 50, 223, 207))
cfg:AddComms("Jedi Masters", { "masters" },                 Color( 50, 223, 207))
cfg:AddComms("Wookie", { "wookies" },                       Color( 210, 105, 30))
cfg:AddComms("Event", { "event" },                          Color( 0, 0, 0))
cfg:AddComms("Sith", { "sith" },                            Color( 0, 0, 0))
cfg:AddComms("Sim T1", { "simt1" },                         Color( 200, 0, 0))
cfg:AddComms("Sim T2", { "simt2" },                         Color( 200, 0, 0))
cfg:AddComms("Sim T3", { "simt3" },                         Color( 200, 0, 0))
cfg:AddComms("Sim T4", { "simt4" },                         Color( 200, 0, 0))
cfg:AddComms("Eval T1", { "evalt1" },                       Color( 4, 0, 214))
cfg:AddComms("Eval T2", { "evalt2" },                       Color( 214, 0, 29))
cfg:AddComms("Serpent", { "serpent" },                      Color( 107, 0, 0))
cfg:AddComms("Temple Guards", { "templeguards", "tg" },     Color( 50, 223, 207))

--[[
    The AssignComms method is used to assign a list of comms to a specific job. This
    method takes two arguments: a jobName string and a commsTable table. The jobName
    argument specifies the name of the job to which the comms should be assigned,
    and the commsTable argument specifies the comms that should be assigned to the job.

    Here is an example of how you might use the AssignComms method
    to assign the "Open" and "Event" comms to the "Events" job:

    cfg:AssignComms("Events", { "Open", "Event" })
]]--


-- Miscellaneous Jobs
cfg:AssignComms("Events", { "Open", "Event" })
cfg:AssignComms("Separatist Army", { "Open", "Event" })
cfg:AssignComms("Cartel", { "Open", "Event" })
cfg:AssignComms("Deathwatch", { "Open", "Event" })
cfg:AssignComms("Spice Criminals", { "Open", "Event" })
cfg:AssignComms("Syndicate", { "Open", "Event" })
cfg:AssignComms("Mercenaries", { "Open", "Event" })
cfg:AssignComms("Infected", { "Open", "Event" })
cfg:AssignComms("Civilian", { "Open" })
cfg:AssignComms("Republic VIP Jobs", { "Open", "Republic" })
cfg:AssignComms("Wookie", { "Open", "Republic", "Wookie" })
cfg:AssignComms("Wookie Chieftain", { "Open", "Republic", "Wookie" })
cfg:AssignComms("Neutral", { "Open" })
cfg:AssignComms("Republic Renowned Mercenary", { "Republic" })
cfg:AssignComms("Scavenger", { "Open", "Scavenger" })
cfg:AssignComms("Advanced Scavenger", { "Open", "Scavenger" })
cfg:AssignComms("Clone Troopers", { "Open", "Republic", "Clone", "Clone Troopers" })
cfg:AssignComms("501st Legion", { "Open", "Republic", "Clone", "501st Legion" })
cfg:AssignComms("212th Attack Battalion", { "Open", "Republic", "Clone", "212th Attack Battalion" })
cfg:AssignComms("442nd Siege Battalion", { "Open", "Republic", "Clone", "442nd Siege Battalion" })
cfg:AssignComms("Combat Engineers", { "Open", "Republic", "Clone", "Combat Engineers" })
cfg:AssignComms("Clone Guards", { "Open", "Republic", "Clone", "Clone Guards" })
cfg:AssignComms("Galactic Marines", { "Open", "Republic", "Clone", "Galactic Marines" })
cfg:AssignComms("Medical Corps Command", { "Open", "Republic", "Clone", "Medics" })
cfg:AssignComms("104th Wolfpack Battalion", { "Open", "Republic", "Clone", "104th Wolfpack Battalion" })
cfg:AssignComms("41st Ranger Platoon", { "Open", "Republic", "Clone", "41st Ranger Platoon" })
cfg:AssignComms("Republic Commandos", { "Open", "Republic", "Clone", "ARC", "Republic Commandos", "RC-Shadow" })
cfg:AssignComms("Battalion", { "Open", "Republic", "Clone", "Clone Guards", "Battalion" })
cfg:AssignComms("High Command", { "Open", "Republic", "Clone", "Clone Guards", "Battalion", "High Command", "RC-Shadow" })
cfg:AssignComms("Jedi", { "Open", "Republic", "Jedi"})
cfg:AssignComms("Jedi Generals", { "Open", "Republic", "Jedi"})
cfg:AssignComms("Jedi High Council", { "Open", "Republic", "Jedi", "Jedi Shadows", "Temple Guards", "Jedi Masters", "RC-Shadow" })

-- Jedi Sub-Paths
cfg:AssignComms("Temple Guard", { "Open", "Republic", "Jedi", "Clone Guards", "Temple Guards" })
cfg:AssignComms("Ace", { "Open", "Republic", "Jedi", "Combat Engineers" })
cfg:AssignComms("Warlock", { "Open", "Republic", "Jedi", "Galactic Marines", "41st Ranger Platoon" })
cfg:AssignComms("Blade Warrior", { "Open", "Republic", "Jedi", "212th Attack Battalion", "501st Legion" })
cfg:AssignComms("Sage", { "Open", "Republic", "Jedi", "Medics" })
cfg:AssignComms("Man of Arms", { "Open", "Republic", "Jedi", "442nd Siege Battalion" })
cfg:AssignComms("Beast Tamer", {"Open", "Republic", "Jedi", "104th Wolfpack Battalion"})
cfg:AssignComms("Teacher", { "Open", "Republic", "Jedi", "Clone Troopers" })
cfg:AssignComms("Shadow", { "Open", "Republic", "Jedi", "Jedi Shadows", "RC-Shadow" })
cfg:AssignComms("Master", { "Open", "Republic", "Jedi", "Jedi Shadows", "Temple Guards", "Jedi Masters", "Medics" })

-- Admirality Jobs
cfg:AssignComms("Fleet Admiral", { "ARC", "Republic Commandos", "Medics" })
cfg:AssignComms("Grand Admiral", { "ARC", "Republic Commandos" })
cfg:AssignComms("Admiral", { "ARC", "Republic Commandos" })
cfg:AssignComms("Vice Admiral", { "ARC", "Republic Commandos" })
cfg:AssignComms("Rear Admiral", { "ARC", "Republic Commandos" })

-- Regimental ARC Jobs
cfg:AssignComms("CT ARC Trooper", { "ARC" })
cfg:AssignComms("501st ARC Trooper", { "ARC" })
cfg:AssignComms("212th ARC Trooper", { "ARC" })
cfg:AssignComms("CE ARC Trooper", { "ARC" })
cfg:AssignComms("CG ARC Trooper", { "ARC" })
cfg:AssignComms("GM ARC Trooper", { "ARC" })
cfg:AssignComms("104th ARC Trooper", { "ARC" })
cfg:AssignComms("41st ARC Trooper", { "ARC" })
cfg:AssignComms("442nd ARC Trooper", { "ARC" })

-- Medic Jobs
cfg:AssignComms("CT Medical Trooper", { "Medics" })
cfg:AssignComms("501st Medical Trooper", { "Medics" })
cfg:AssignComms("212th Medical Trooper", { "Medics" })
cfg:AssignComms("CE Medical Trooper", { "Medics" })
cfg:AssignComms("CG Medical Trooper", { "Medics" })
cfg:AssignComms("GM Medical Trooper", { "Medics" })
cfg:AssignComms("74th Medical Trooper", { "Medics" })
cfg:AssignComms("104th Medical Trooper", { "Medics" })
cfg:AssignComms("41st Medical Trooper", { "Medics" })
cfg:AssignComms("442nd Medical Trooper", { "Medics" })

-- Marshal & Senior Commander Jobs
cfg:AssignComms("41st Senior Commander", { "High Command" })
cfg:AssignComms("CE Marshal Commander", { "High Command" })
cfg:AssignComms("104th Senior Commander", { "High Command" })

-- Jedi & Custom General Jobs
cfg:AssignComms("Aayla Secura", { "Medics" })
cfg:AssignComms("Barriss Offee", { "Medics" })
cfg:AssignComms("Yarael Poof", { "Combat Engineers" })
cfg:AssignComms("Shaak Ti", { "Jedi Shadows", "Temple Guards", "Jedi Masters", "Medics" })
cfg:AssignComms("Ahsoka Tano", { "Jedi Shadows", "RC-Shadow" })
cfg:AssignComms("Quinlan Vos", { "Jedi Shadows", "RC-Shadow" })

-- Sith Jobs
cfg:AssignComms("Sith Warrior", { "Open", "Sith" })
cfg:AssignComms("Sith Sorcerer", { "Open", "Sith" })
cfg:AssignComms("Sith Marauder", { "Open", "Sith" })

-- Sim Teams
cfg:AssignComms("SIM Team 1 Trooper", { "Open", "Republic", "Sim T1" })
cfg:AssignComms("SIM Team 1 Sniper", { "Open", "Republic", "Sim T1" })
cfg:AssignComms("SIM Team 1 Heavy", { "Open", "Republic", "Sim T1" })
cfg:AssignComms("SIM Team 2 Trooper", { "Open", "Republic", "Sim T2" })
cfg:AssignComms("SIM Team 2 Sniper", { "Open", "Republic", "Sim T2" })
cfg:AssignComms("SIM Team 2 Heavy", { "Open", "Republic", "Sim T2" })
cfg:AssignComms("SIM Team 3 Trooper", { "Open", "Republic", "Sim T3" })
cfg:AssignComms("SIM Team 3 Sniper", { "Open", "Republic", "Sim T3" })
cfg:AssignComms("SIM Team 3 Heavy", { "Open", "Republic", "Sim T3" })
cfg:AssignComms("SIM Team 4 Trooper", { "Open", "Republic", "Sim T4" })
cfg:AssignComms("SIM Team 4 Sniper", { "Open", "Republic", "Sim T4" })
cfg:AssignComms("SIM Team 4 Heavy", { "Open", "Republic", "Sim T4" })

-- ARC Evaluation Jobs
cfg:AssignComms("Arc Eval T1", { "Open", "Eval T1" })
cfg:AssignComms("Arc Eval T2", { "Open", "Eval T2" })

-- Misc. Event Character Jobs
cfg:AssignComms("?????", { "Clone", "Republic", "Jedi" })

-- Staff & Event Planner Jobs
cfg:AssignComms("Staff on Duty", { "Open", "Republic", "Jedi", "Clone", "Event", "Underworld"})
cfg:AssignComms("Event Host", { "Open", "Republic", "Jedi", "Clone", "Event", "Sith", "Underworld"})

--[[
    The SetCanStripComms method is used to set the players who can use the
    "stripcomms"command. This method takes a variable number of arguments,
    representing the player names of the players who can use the "stripcomms"
    command. This method does not return any values.

    Here is an example of how you might use the SetCanStripComms method to set the players who can use the "stripcomms" command:

    cfg:SetCanStripComms(
        "Hierarchy",
        "CG Commander",
        "CG Vice Commander",
        "CG EXO"
    )
]]--

cfg:SetCanStripComms(
    "Hierarchy",
    "CG Commander",
    "CG Vice Commander",
    "CG EXO",
    "CG ARC Trooper",
    "CG Staff Officer",
    "CG Commissioned Officer",
    "CG Medical Trooper",
    "RC Commander",
    "RC Vice Commander",
    "DS Squad Leader",
    "OS Squad Leader",
    "DS Commando",
    "OS Commando",
    "Rear Admiral",
    "Vice Admiral",
    "Admiral",
    "Fleet Admiral",
    "Grand Admiral",
    "CE Marshal Commander",
    "212th Senior Commander",
    "104th Senior Commander",
    "Hunter",
    -- Jedi
    "Temple Guard",
    "Sentinel",
    "Master",
    "Anakin Skywalker",
    "Kit Fisto",
    "Obi Wan Kenobi",
    "Plo Koon",
    "Mace Windu",
    "Grandmaster Yoda",
    -- Custom Generals
    "Shaak Ti",
    "Neru Ordern",
    -- Event Jobs
    "Event Host",
    "Bounty Hunter",
    "?????",
    -- Scavengers
    "Scavenger",
    "Advanced Scavenger"
)

--[[
    The SetStripCommsBlacklist method is used to set the players who cannot
    be stripped of their comms using the "stripcomms" command. This method
    takes a variable number of arguments, representing the player names of
    the players who cannot be stripped of their comms using the "stripcomms"
    command. This method does not return any values.

    Here is an example of how you might use the SetStripCommsBlacklist method
    to set the players who cannot be stripped of their comms using the "stripcomms" command:

    cfg:SetStripCommsBlacklist(
        "Alice",
        "Bob",
        "Charlie",
        "Dave",
        "Eve",
        "Mallory"
    )

    In this example, the SetStripCommsBlacklist method is called on the
    cfg object and passed a list of player names as arguments. This sets
    the players with the specified names as players who cannot be stripped
    of their comms using the "stripcomms" command.
]]--

cfg:SetStripCommsBlacklist(
    "Clone Trooper",
    "501st Enlisted Trooper",
    "212th Enlisted Trooper",
    "104th Enlisted Trooper",
    "21st Enlisted Trooper",
    "41st Enlisted Trooper",
    "CE Enlisted Trooper",
    "CG Enlisted Trooper",
    "Battalion Security",
    "Advanced Battalion Security",
    "Superrooper",
    "Republic Droid",
    "Civilian",
    "Moisture Farmer",
    "Bartender",
    "Doctor",
    "Mechanic",
    "Petty Thief",
    "Cartel Associate",
    "Pirate Powdermonkey",
    "Initiate",
    "Apprentice",
    "Padawan",
    -- Staff & Event Jobs
    "Hierarchy",
    "Staff on Duty",
    "Event Host"
)

--[[
    The SetJammingCharacters method is used to set the characters that are
    used to jam comms. This method takes a variable number of arguments,
    representing the characters that are used to jam comms.
    This method does not return any values.

    Here is an example of how you might use the SetJammingCharacters
    method to set the characters that are used to jam comms:

    cfg:SetJammingCharacters(
        "*", "#", "$", "^", "!", "&",
        "/", "?", "Q", "W", "E", "R",
        "T", "Y", "U", "I", "O", "P",
        "A", "S", "D", "F", "G", "H",
        "J", "K", "L", "Z", "X", "C",
        "V", "B", "N", "M"
    )

    In this example, the SetJammingCharacters method is called on
    the cfg object and passed a list of characters as arguments.
    This sets the specified characters as the characters that
    are used to jam comms.
]]--

cfg:SetJammingCharacters(
    "*", "#", "$", "^", "!", "&",
    "/", "?", "Q", "W", "E", "R",
    "T", "Y", "U", "I", "O", "P",
    "A", "S", "D", "F", "G", "H",
    "J", "K", "L", "Z", "X", "C",
    "V", "B", "N", "M"
)

--[[
    The SetSuperAdminComms method is used to set the comms that can only be
    given out by a superadmin or the config. This method takes a variable
    number of arguments, representing the comms that can only be given out
    by a superadmin or the config. This method does not return any values.

    Here is an example of how you might use the SetSuperAdminComms method
    to set the comms that can only be given out by a superadmin or the config:

    cfg:SetSuperAdminComms(
        "Broadcast",
        "Intercom",
        "Squad Comms",
        "Group Comms",
        "Faction Comms",
        "Local Comms",
        "Whisper Comms"
    )

    In this example, the SetSuperAdminComms method is called on the cfg
    object and passed a list of comm names as arguments. This sets the
    specified comms as the comms that can only be given out by a
    superadmin or the config.
]]--

cfg:SetSuperAdminComms(
    "Republic Commandos",
    "Jedi Masters",
    "High Command",
    "Battalion"
)

--[[
    The SetAdminJobs method is used to set the jobs that have access to all comms.
    This method takes a variable number of arguments, representing the names of
    the jobs that have access to all comms. This method does not return any values.

    Here is an example of how you might use the SetAdminJobs
    method to set the jobs that have access to all comms:

    cfg:SetAdminJobs(
        "Hierarchy"
    )

    In this example, the SetAdminJobs method is called on the cfg object and passed
    a list of job names as arguments. This sets the specified jobs as the jobs that
    have access to all comms.
]]--

cfg:SetAdminJobs(
    "Hierarchy"
)

--[[
    The SetIgnoreJobs method is used to set the jobs that do not receive any comms
    when spawning in. This method takes a variable number of arguments, representing
    the names of the jobs that do not receive any comms when spawning in.
    This method does not return any values.

    Here is an example of how you might use the SetIgnoreJobs method to
    set the jobs that do not receive any comms when spawning in:

    cfg:SetIgnoreJobs(
        "Youngling"
        "Cadet",
    )

    In this example, the SetIgnoreJobs method is called on the cfg object and passed
    a list of job names as arguments. This sets the specified jobs as the jobs that
    do not receive any comms when spawning in.
]]--

cfg:SetIgnoreJobs(
    "Youngling",
    "Cadet"
)

--[[
    The SetCantUseJobs method is used to set the jobs that are excluded from the
    Comms System as a whole and cannot be given any comms. This method takes a
    variable number of arguments, representing the names of the jobs that are
    excluded from the Comms System and cannot be given any comms. This method
    does not return any values.

    Here is an example of how you might use the SetCantUseJobs method to set the
    jobs that are excluded from the Comms System and cannot be given any comms:

    cfg:SetCantUseJobs(
        "Jawa",
        "Jawa Engineer",
        "Jawa Warrior",
        "Jawa Leader",
    )

    In this example, the SetCantUseJobs method is called on the cfg object and
    passed a list of job names as arguments. This sets the specified jobs as
    the jobs that are excluded from the Comms System and cannot be given any comms.
]]--

cfg:SetCantUseJobs()

--[[
    The SetGlobalComms method is used to set the comms that are global and
    available to everyone who has not been excluded from the Comms System.
    This method takes a variable number of arguments, representing the names
    of the comms that are global. This method does not return any values.

    Here is an example of how you might use the SetGlobalComms method to set the comms that are global:
    cfg:SetGlobalComms(
        "Open",
        "Citizen",
    )

    In this example, the SetGlobalComms method is called on the cfg object
    and passed a list of comm names as arguments. This sets the specified
    comms as the global comms that are available to everyone who has not
    been excluded from the Comms System.
]]--

cfg:SetGlobalComms(
    "Open"
)