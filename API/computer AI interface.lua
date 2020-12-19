--============================================================================
-- Computer AI interface
--

---@class AI
AI = newClass()
local class = AI

---@param num player
---@param script string
function class:startMelee(num, script)
    StartMeleeAI(num, script)
end

---@param num player
---@param script string
function class:startCampaign(num, script)
    StartCampaignAI(num, script)
end

---@param num player
---@param command integer
---@param data integer
function class:command(num, command, data)
    CommandAI(num, command, data)
end

---@param p player
---@param pause boolean
function class:pauseComp(p, pause)
    PauseCompAI(p, pause)
end

---@param num player
---@return aidifficulty
function class:getDifficulty(num)
    GetAIDifficulty(num)
end


---@param hUnit unit
function class:removeGuardPosition(hUnit)
    RemoveGuardPosition(hUnit)
end

---@param hUnit unit
function class:recycleGuardPosition(hUnit)
    RecycleGuardPosition(hUnit)
end

---@param num player
function class:removeAllGuardPositions(num)
    RemoveAllGuardPositions(num)
end