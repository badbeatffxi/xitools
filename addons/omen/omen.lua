addon.name    = 'omen'
addon.author  = 'lin'
addon.version = '0.1'
addon.desc    = 'Track objectives in omen'

local imgui = require('lin/ui')
local messages = require('messages')

---@class OmenMessageTemplate
---@field text    string
---@field summary string?
---@field func    fun(msg: OmenMessage, state: OmenObjectives)

---@class OmenMessage
---@field id      number
---@field summary string?
---@field params  number[]

---@class OmenObjectives
---@field mainTimer  number
---@field floorTimer number
---@field floor      OmenObjectiveFloor
---@field transient  OmenObjectiveTransient[]

---@class OmenObjectiveFloor
---@field summary string
---@field status  'success'|'pending'|'failure'

---@class OmenObjectiveTransient
---@field summary string
---@field status  'success'|'pending'|'failure'
---@field cur     number
---@field max     number

local OMEN_ZONE = 292
local STATUSES = {
    failure = '\xef\x81\x97',
    pending = '\xef\x85\x81',
    success = '\xef\x81\x98',
}

local party = AshitaCore:GetMemoryManager():GetParty()
local theme = imgui.lin.Theme()
local mainWindow = imgui.lin.Window {
    title = 'omen',
    isVisible = true,
    flags = ImGuiWindowFlags_NoDecoration,
    size = { -1, -1 },
    pos = { 400, 400 },
}

local function parseStringMessage(packet)
    -- ignore everything when you're not in reisenjima henge
    if party:GetMemberZone(0) ~= OMEN_ZONE then
        return nil
    end

    local msgId = struct.unpack('I2', packet, 0x0a + 1) - 0x8000
    if messages[msgId] == nil then
        return nil
    end

    return {
        id = msgId,
        summary = messages[msgId].summary,
        params = {
            [1] = struct.unpack('i4', packet, 0x10 + 1),
            [2] = struct.unpack('i4', packet, 0x14 + 1),
            [3] = struct.unpack('i4', packet, 0x18 + 1),
            [4] = struct.unpack('i4', packet, 0x1c + 1),
        }
    }
end

local function parseRestMessage(packet)
    -- ignore everything when you're not in reisenjima henge
    if party:GetMemberZone(0) ~= OMEN_ZONE then
        return nil
    end

    local msgId = struct.unpack('I2', packet, 0x1a + 1) - 0x8000
    if messages[msgId] == nil then
        return nil
    end

    return {
        id = msgId,
        summary = messages[msgId].summary,
        params = {
            [1] = struct.unpack('i4', packet, 0x08 + 1),
            [2] = struct.unpack('i4', packet, 0x0c + 1),
            [3] = struct.unpack('i4', packet, 0x10 + 1),
            [4] = struct.unpack('i4', packet, 0x14 + 1),
        }
    }
end

local function parseNpcMessage(packet)
    -- ignore everything when you're not in reisenjima henge
    if party:GetMemberZone(0) ~= OMEN_ZONE then
        return nil
    end

    local msgId = struct.unpack('I2', packet, 0x0a + 1) - 0x8000
    if messages[msgId] == nil then
        return nil
    end

    return {
        id = msgId,
        summary = messages[msgId].summary,
        params = { },
    }
end

---Parses a string message if it is determined to be omen-related
---@param e PacketInEventArgs
---@return OmenMessage?
local function parseOmenMessage(e)
    if e.id == 0x027 then
        return parseStringMessage(e.data)
    elseif e.id == 0x02a then
        return parseRestMessage(e.data)
    elseif e.id == 0x036 then
        return parseNpcMessage(e.data)
    end
end

---Gets a fresh objective state to begin tracking
---@return OmenObjectives
local function getNewObjectives()
    ---@type OmenObjectives
    local obj = {
        mainTimer = 0,
        floorTimer = 0,
        floor = {
            summary = 'no floor objective yet',
            status  = 'pending',
            isDone  = false,
            isFail  = false,
        },
        transient = { },
    }

    return obj
end

local currentObjectives = getNewObjectives()

---Checks the player zone on load to ensure we don't show it at a silly time
local function checkZone()
    local isInOmen = party:GetMemberZone(0) == OMEN_ZONE
    mainWindow.isVisible[1] = isInOmen
end

---Maintain objective state on zone change
---@param e PacketInEventArgs
local function handleZoning(e)
    if e.id == 0x0a then
        local zone = struct.unpack('i2', e.data, 0x30 + 1)
        local isInOmen = zone == OMEN_ZONE
        mainWindow.isVisible[1] = isInOmen
        currentObjectives = getNewObjectives()
    end
end

---Read and parse Omen objectives from message packets
---@param e PacketInEventArgs
local function trackObjectives(e)
    local omen = parseOmenMessage(e)
    if omen == nil or messages[omen.id] == nil then
        return
    end

    messages[omen.id].func(omen, currentObjectives)
end

---Displays the current timer and objective status in a simple window
local function showObjectives()
    imgui.lin.DrawUiWindow(mainWindow, theme, function()
        imgui.Text('======================= OMEN =======================')
        imgui.Separator()

        do
            local obj = currentObjectives.floor
            local status = STATUSES[obj.status]
            local color = theme.colors[obj.status]

            imgui.TextColored(color, status)
            imgui.SameLine()
            imgui.Text(obj.summary)
        end

        if #currentObjectives.transient == 0 then
            return
        else
            imgui.NewLine()
        end

        local timer = '%5ds remaining'
        imgui.Text(timer:format(currentObjectives.floorTimer))

        for _, obj in ipairs(currentObjectives.transient) do
            local status = STATUSES[obj.status]
            local color = theme.colors[obj.status]
            local progress = '%d / %d'

            imgui.TextColored(color, status)
            imgui.SameLine()
            imgui.Text(progress:format(obj.cur, obj.max))
            imgui.SameLine()
            imgui.Text(obj.summary)
        end
    end)
end

ashita.events.register('load', 'checkZone', checkZone)
ashita.events.register('packet_in', 'handleZoning', handleZoning)
ashita.events.register('packet_in', 'trackObjectives', trackObjectives)
ashita.events.register('d3d_present', 'showObjectives', showObjectives)
