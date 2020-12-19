---@class IdPlayer
IdPlayer = newClass()
local class = IdPlayer

---@alias idPlayer player|integer

---@param playerId idPlayer
---@return integer
function formatIdPlayer(playerId)
    if typeof(playerId, 'number') then
        return playerId
    else
        return GetPlayerId(playerId)
    end
end

---@param playerId idPlayer
---@return player
function formatPlayer(playerId)
    if typeof(playerId, 'number') then
        return Player(playerId)
    else
        return playerId
    end
end

---@param playerId idPlayer
---@return IdPlayer
function class:new(playerId)
    self.id = formatIdPlayer(playerId)
    self.player = ClassPlayer:new(formatPlayer(playerId))
end

function class:formatObject(playerId)
    
end