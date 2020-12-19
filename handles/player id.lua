---@class IdPlayer
IdPlayer = newClass()
local class = IdPlayer

function class:new(playerId)
    self.id = formatIdPlayer(playerId)
    self.player = ClassPlayer:new(formatPlayer(playerId))
end

function class:formatObject(playerId)
    
end