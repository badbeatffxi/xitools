require('common')
local noop = function() end

---@module 'common.equip'
local Equip = gFunc.LoadFile('common/equip.lua')
---@module 'common.status'
local Status = gFunc.LoadFile('common/status.lua')

local settings = {
    Main = "Yoto",
    Sub  = "Yoto",
    Ammo = "Dart",
}

local sets = {
    Idle = Equip.NewSet {
        Main = Equip.Staves.Earth,
        Sub = Equip.Special.Displaced,
        Range = Equip.Special.Displaced,
        Ammo = settings.Ammo,

        Head = "Arhat's Jinpachi",
        Neck = "Evasion Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Drone Earring",

        Body = "Arhat's Gi",
        Hands = "Windurstian Tekko",
        Ring1 = "Sattva Ring",
        Ring2 = "Chariot Band",

        Back = "High Brth. Mantle",
        Waist = "Ryl.Kgt. Belt",
        Legs = "Nokizaru Hakama",
        Feet = "Mountain Gaiters",

        AtNight = {
            Legs = "Ninja Hakama",
            Feet = "Ninja Kyahan",
        },
    },
    Auto = Equip.NewSet {
        Main = settings.Main,
        Sub = settings.Sub,
        Range = Equip.Special.Displaced,
        Ammo = settings.Ammo,

        Head = "Super Ribbon",
        Neck = "Spike Necklace",
        Ear1 = "Beetle Earring +1",
        Ear2 = "Beetle Earring +1",

        Body = "Ninja Chainmail",
        Hands = "Windurstian Tekko",
        Ring1 = "Sattva Ring",
        Ring2 = "Woodsman Ring",

        Back = "High Brth. Mantle",
        Waist = "Swift Belt",
        Legs = "Republic Subligar",
        Feet = "Fed. Kyahan",
    },
    Throw = Equip.NewSet {
        Main = Equip.Staves.Earth,
        Sub = Equip.Special.Displaced,
        Range = Equip.Special.Displaced,
        Ammo = settings.Ammo,

        Head = "Arhat's Jinpachi",
        Neck = "Evasion Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Drone Earring",

        Body = "Arhat's Gi",
        Hands = "Ninja Tekko",
        Ring1 = "Woodsman Ring",
        Ring2 = "Horn Ring",

        Back = "High Brth. Mantle",
        Waist = "Ryl.Kgt. Belt",
        Legs = "Ninja Hakama",
        Feet = "Fed. Kyahan",
    },
    Shadows = Equip.NewSet {
        Main = Equip.Staves.Wind,
        Sub = Equip.Special.Displaced,
        Range = Equip.Special.Displaced,
        Ammo = settings.Ammo,

        Head = "Ninja Hatsuburi",
        Neck = "Evasion Torque",
        Ear1 = "Drone Earring",
        Ear2 = "Drone Earring",

        Body = "Arhat's Gi",
        Hands = "Savage Gauntlets",
        Ring1 = "Reflex Ring",
        Ring2 = "Sattva Ring",

        Back = "High Brth. Mantle",
        Waist = "Swift Belt",
        Legs = "Nokizaru Hakama",
        Feet = "Mountain Gaiters",

        AtNight = {
            Legs = "Ninja Hakama",
        },
    },
    Enfeeble = Equip.NewSet {
        Main = Equip.Staves.Wind,
        Sub = Equip.Special.Displaced,
        Range = Equip.Special.Displaced,
        Ammo = "Morion Tathlum",

        Head = "Ninja Hatsuburi",
        Neck = "Evasion Torque",
        Ear1 = "Morion Earring",
        Ear2 = "Cunning Earring",

        Body = "Arhat's Gi",
        Hands = "Savage Gauntlets",
        Ring1 = "Sattva Ring",
        Ring2 = "Eremite's Ring",

        Back = "High Brth. Mantle",
        Waist = "Swift Belt",
        Legs = "Nokizaru Hakama",
        Feet = "Mountain Gaiters",
    },
    Nuke = Equip.NewSet {
        Main = Equip.Staves.Wind,
        Sub = Equip.Special.Displaced,
        Range = Equip.Special.Displaced,
        Ammo = "Morion Tathlum",

        Head = "Ninja Hatsuburi",
        Neck = "Rep.Mythril Medal",
        Ear1 = "Morion Earring",
        Ear2 = "Moldavite Earring",

        Body = "Arhat's Gi",
        Hands = "Savage Gauntlets",
        Ring1 = "Eremite's Ring",
        Ring2 = "Eremite's Ring",

        Back = "High Brth. Mantle",
        Waist = "Swift Belt",
        Legs = "Nokizaru Hakama",
        Feet = "Mountain Gaiters",

        AtHalfMp = {
            Neck = "Uggalepih Pendant",
        },
    },
    Weaponskill = Equip.NewSet {
        Main = settings.Main,
        Sub = settings.Sub,
        Range = Equip.Special.Displaced,
        Ammo = "Morion Tathlum",

        Head = "Super Ribbon",
        Neck = "Spike Necklace",
        Ear1 = "Beetle Earring +1",
        Ear2 = "Beetle Earring +1",

        Body = "Ninja Chainmail",
        Hands = "Windurstian Tekko",
        Ring1 = "Courage Ring",
        Ring2 = "Courage Ring",

        Back = "High Brth. Mantle",
        Waist = "Ryl.Kgt. Belt",
        Legs = "Republic Subligar",
        Feet = "Fed. Kyahan",
    },
}

local function onLoad()
    AshitaCore:GetChatManager():QueueCommand(-1, '/addon reload wheel')
    ashita.tasks.once(1, function()
        AshitaCore:GetChatManager():QueueCommand( 1, '/wheel level ni')
        AshitaCore:GetChatManager():QueueCommand( 1, '/wheel lock')
    end)
end

local function onUnload()
    AshitaCore:GetChatManager():QueueCommand(-1, '/addon unload wheel')
end

local function handleCommand(args)
    if args[1] == 'ammo' then
        settings.Ammo = args[2] or "Pebble"
    end
end

local function handleDefault()
    local player = gData.GetPlayer()
    local env = gData.GetEnvironment()

    Equip.Set(sets.Idle)

    if Status.IsAttacking(player) and Status.HasStatus('Copy Image') then
        Equip.Set(sets.Auto)
    end

    if Status.IsInSandoria(env) then
        Equip.Body("Kingdom Aketon")
    elseif Status.IsInBastok(env) then
        Equip.Body("Republic Aketon")
    elseif Status.IsInWindurst(env) then
        Equip.Body("Federation Aketon")
    end
end

local function handlePreshot()
    Equip.Ammo(settings.Ammo)
end

local function handleMidshot()
    Equip.Set(sets.Throw)
end

local function handleMidcast()
    local spell = gData.GetAction()

    if Status.IsStealth(spell) then
        Equip.Set(sets.Shadows)
        Equip.Stealth()
    elseif Status.IsShadows(spell) then
        Equip.Set(sets.Shadows)
    elseif Status.IsDrain(spell) then
        Equip.Set(sets.Shadows)
        Equip.Staff(spell)
    elseif Status.IsNuke(spell) or Status.IsPotencyNinjutsu(spell) then
        Equip.Set(sets.Nuke)
        Equip.Staff(spell)
    elseif Status.IsAccuracyNinjutsu(spell) then
        Equip.Set(sets.Enfeeble)
        Equip.Staff(spell)
    end
end

local function handleWeaponskill()
    local weaponskill = gData.GetAction().Name

    if weaponskill == 'Blade: Teki'
    or weaponskill == 'Blade: To'
    or weaponskill == 'Blade: Chi' then
        Equip.Set(sets.Weaponskill)
    end
end

return {
    Sets = sets,
    OnLoad = onLoad,
    OnUnload = onUnload,
    HandleCommand = handleCommand,
    HandleDefault = handleDefault,
    HandleAbility = noop,
    HandleItem = gFunc.LoadFile('common/items.lua'),
    HandlePrecast = noop,
    HandlePreshot = handlePreshot,
    HandleMidcast = handleMidcast,
    HandleMidshot = handleMidshot,
    HandleWeaponskill = handleWeaponskill,
}
