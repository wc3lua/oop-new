--============================================================================

---@class APICheat
APICheat = newClass()
local class = APICheat

---@param cheatStr string
function class:cheat(cheatStr)
    Cheat(cheatStr)
end

---@return boolean
function class:isNoVictory()
    return IsNoVictoryCheat()
end

---@return boolean
function class:isNoDefeat()
    IsNoDefeatCheat()
end

---@param cheatStr string
function Cheat(cheatStr) 
    class:cheat(cheatStr)
end

---@return boolean
function IsNoVictoryCheat()
    return class:isNoVictory()
end

---@return boolean
function IsNoDefeatCheat() 
    return class:isNoDefeat()
end