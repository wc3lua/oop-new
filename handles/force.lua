--============================================================================
-- Force API
--
---@class Force:Handle
Force = extendedClass(Handle)
local class = Force

---@param forceHandle force
---@return Force
function class:new(forceHandle)
    self.handle = forceHandle
    return newObject(self)
end

function class:create()
    return self:new(CreateForce())
end

function class:destroy()
    DestroyForce(self.handle)
end

---@param whichPlayer Player
function class:addPlayer(whichPlayer)
    ForceAddPlayer(self.handle, whichPlayer.handle)
    return self
end

---@param whichPlayer Player
function class:removePlayer(whichPlayer)
    ForceRemovePlayer(self.handle, whichPlayer.handle)
    return self
end

---@param whichPlayer Player
---@return boolean
function class:hasPlayer(whichPlayer)
    return BlzForceHasPlayer(self.handle, whichPlayer.handle)
end

function class:clear()
    ForceClear(self.handle)
    return self
end

---@param filter code
function class:enumPlayers(filter)
    ForceEnumPlayers(self.handle, Condition(filter))
    return self
end

---@param countLimit integer
---@param filter code
function class:enumCountedPlayers(countLimit, filter)
    ForceEnumPlayersCounted(self.handle, Condition(filter), countLimit)
    return self
end

---@param whichPlayer Player
---@param filter code
function class:enumAllies(whichPlayer, filter)
    ForceEnumAllies(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

---@param whichPlayer Player
---@param filter code
function class:enumEnemies(whichPlayer, filter)
    ForceEnumEnemies(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

---@param callback code
function class:forEach(callback)
    ForForce(self.handle, callback)
    return self
end