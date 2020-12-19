--============================================================================
-- Force API
--
Force = extendedClass(Handle)
local class = Force

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

function class:addPlayer(whichPlayer)
    ForceAddPlayer(self.handle, whichPlayer.handle)
    return self
end

function class:removePlayer(whichPlayer)
    ForceRemovePlayer(self.handle, whichPlayer.handle)
    return self
end

function class:hasPlayer(whichPlayer)
    return BlzForceHasPlayer(self.handle, whichPlayer.handle)
end

function class:clear()
    ForceClear(self.handle)
    return self
end

function class:enumPlayers(filter)
    ForceEnumPlayers(self.handle, Condition(filter))
    return self
end

function class:enumCountedPlayers(countLimit, filter)
    ForceEnumPlayersCounted(self.handle, Condition(filter), countLimit)
    return self
end

function class:enumAllies(whichPlayer, filter)
    ForceEnumAllies(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

function class:enumEnemies(whichPlayer, filter)
    ForceEnumEnemies(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

function class:forEach(callback)
    ForForce(self.handle, callback)
    return self
end