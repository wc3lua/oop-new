--============================================================================

APICheat = newClass()
local class = APICheat

function class:cheat(cheatStr)
    Cheat(cheatStr)
end

function class:isNoVictory()
    return IsNoVictoryCheat()
end

function class:isNoDefeat()
    IsNoDefeatCheat()
end

function Cheat(cheatStr) 
    class:cheat(cheatStr)
end

function IsNoVictoryCheat()
    return class:isNoVictory()
end

function IsNoDefeatCheat() 
    return class:isNoDefeat()
end