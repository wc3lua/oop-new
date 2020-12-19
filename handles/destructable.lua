--============================================================================
-- Destructable Object API
-- Facing arguments are specified in degrees

---@class Destructable:Widget
Destructable = extendedClass(Widget)
local class = Destructable

function class:new(destructableHandle)
    self.handle  = destructableHandle
    return newObject(self)
end

function class:coordsCreate(objectid, x, y, face, scale, variation)
    return self:new(CreateDestructable(formatIntCC(objectid), x, y, face, scale, variation))
end

function class:coordsWithZCreate(objectid, x, y, z, face, scale, variation)
    return self:new(CreateDestructableZ(formatIntCC(objectid), x, y, z, face, scale, variation))
end

function class:pointCreate(objectid, p, face, scale, variation)
    return self:coordsWithZCreate(objectid, p:getX(), p:getY(), p:getZ(), face, scale, variation)
end

function class:locCreate(objectid, loc, face, scale, variation)
    return self:coordsWithZCreate(objectid, loc:getX(), loc:getY(), loc:getZ(), face, scale, variation)
end

function class:deadCoordsCreate(objectid, x, y, face, scale, variation)
    return self:new(CreateDeadDestructable(formatIntCC(objectid), x, y, face, scale, variation))
end

function class:deadCoordsWithZCreate(objectid, x, y, z, face, scale, variation)
    return self:new(CreateDeadDestructableZ(formatIntCC(objectid), x, y, z, face, scale, variation))
end

function class:deadPointCreate(objectid, p, face, scale, variation)
    return self:deadCoordsWithZCreate(objectid, p:getX(), p:getY(), p:getZ(), face, scale, variation)
end

function class:deadLocCreate(objectid, loc, face, scale, variation)
    return self:deadCoordsWithZCreate(objectid, loc:getX(), loc:getY(), loc:getZ(), face, scale, variation)
end

function class:remove()
    RemoveDestructable(self.handle)
    return self
end

function class:kill()
    KillDestructable(self.handle)
    return self
end

function class:setInvulnerable(flag)
    SetDestructableInvulnerable(self.handle, flag)
    return self
end

function class:isInvulnerable()
    return IsDestructableInvulnerable(self.handle)
end

function class:enumInRect(r, filter, actionFunc)
    EnumDestructablesInRect(r.handle, Condition(filter), actionFunc)
    return self
end

function class:getTypeId()
    return GetDestructableTypeId(self.handle)
end

function class:getX()
    return GetDestructableX(self.handle)
end

function class:getY()
    return GetDestructableY(self.handle)
end

function class:setLife(life)
    SetDestructableLife(self.handle, life)
    return self
end

function class:getLife()
    return GetDestructableLife(self.handle)
end

function class:setMaxLife(max)
    SetDestructableMaxLife(self.handle, max)
    return self
end

function class:getMaxLife()
    return GetDestructableMaxLife(self.handle)
end

function class:restoreLife(life, birth)
    DestructableRestoreLife(self.handle, life, birth)
    return self
end

function class:queueAnimation(whichAnimation)
    QueueDestructableAnimation(self.handle, whichAnimation)
    return self
end

function class:setAnimation(whichAnimation)
    SetDestructableAnimation(self.handle, whichAnimation)
    return self
end

function class:setAnimationSpeed(speedFactor)
    SetDestructableAnimationSpeed(self.handle, speedFactor)
    return self
end

function class:show(flag)
    ShowDestructable(self.handle, flag)
    return self
end

function class:getOccluderHeight()
    return GetDestructableOccluderHeight(self.handle)
end

function class:setOccluderHeight(height)
    SetDestructableOccluderHeight(self.handle, height)
    return self
end

function class:getName()
    return GetDestructableName(self.handle)
end

function class:triggered()
    return self:new(GetTriggerDestructable())
end