--============================================================================
-- Destructable Object API
-- Facing arguments are specified in degrees

---@class Destructable:Widget
Destructable = extendedClass(Widget)
local class = Destructable

---@param destructableHandle destructable
---@return Destructable
function class:new(destructableHandle)
    self.handle  = destructableHandle
    return newObject(self)
end

---@param objectid integer|string
---@param x real
---@param y real
---@param face real
---@param scale real
---@param variation integer
function class:coordsCreate(objectid, x, y, face, scale, variation)
    return self:new(CreateDestructable(formatIntCC(objectid), x, y, face, scale, variation))
end

---@param objectid integer|string
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
function class:coordsWithZCreate(objectid, x, y, z, face, scale, variation)
    return self:new(CreateDestructableZ(formatIntCC(objectid), x, y, z, face, scale, variation))
end

---@param objectid integer|string
---@param p Point
---@param face real
---@param scale real
---@param variation integer
function class:pointCreate(objectid, p, face, scale, variation)
    return self:coordsWithZCreate(objectid, p:getX(), p:getY(), p:getZ(), face, scale, variation)
end

---@param objectid integer|string
---@param loc Location
---@param face real
---@param scale real
---@param variation integer
function class:locCreate(objectid, loc, face, scale, variation)
    return self:coordsWithZCreate(objectid, loc:getX(), loc:getY(), loc:getZ(), face, scale, variation)
end

---@param objectid integer|string
---@param x real
---@param y real
---@param face real
---@param scale real
---@param variation integer
function class:deadCoordsCreate(objectid, x, y, face, scale, variation)
    return self:new(CreateDeadDestructable(formatIntCC(objectid), x, y, face, scale, variation))
end

---@param objectid integer|string
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
function class:deadCoordsWithZCreate(objectid, x, y, z, face, scale, variation)
    return self:new(CreateDeadDestructableZ(formatIntCC(objectid), x, y, z, face, scale, variation))
end

---@param objectid integer|string
---@param p Point
---@param face real
---@param scale real
---@param variation integer
function class:deadPointCreate(objectid, p, face, scale, variation)
    return self:deadCoordsWithZCreate(objectid, p:getX(), p:getY(), p:getZ(), face, scale, variation)
end

---@param objectid integer|string
---@param loc Location
---@param face real
---@param scale real
---@param variation integer
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

---@param flag boolean
function class:setInvulnerable(flag)
    SetDestructableInvulnerable(self.handle, flag)
    return self
end

---@return boolean
function class:isInvulnerable()
    return IsDestructableInvulnerable(self.handle)
end

---@param r Rect
---@param filter boolexpr
---@param actionFunc code
function class:enumInRect(r, filter, actionFunc)
    EnumDestructablesInRect(r.handle, Condition(filter), actionFunc)
    return self
end

---@return integer
function class:getTypeId()
    return GetDestructableTypeId(self.handle)
end

---@return real
function class:getX()
    return GetDestructableX(self.handle)
end

---@return real
function class:getY()
    return GetDestructableY(self.handle)
end

---@param life real
function class:setLife(life)
    SetDestructableLife(self.handle, life)
    return self
end

---@return real
function class:getLife()
    return GetDestructableLife(self.handle)
end

---@param max real
function class:setMaxLife(max)
    SetDestructableMaxLife(self.handle, max)
    return self
end

---@return real
function class:getMaxLife()
    return GetDestructableMaxLife(self.handle)
end

---@param life real
---@param birth boolean
function class:restoreLife(life, birth)
    DestructableRestoreLife(self.handle, life, birth)
    return self
end

---@param whichAnimation string
function class:queueAnimation(whichAnimation)
    QueueDestructableAnimation(self.handle, whichAnimation)
    return self
end

---@param whichAnimation string
function class:setAnimation(whichAnimation)
    SetDestructableAnimation(self.handle, whichAnimation)
    return self
end

---@param speedFactor real
function class:setAnimationSpeed(speedFactor)
    SetDestructableAnimationSpeed(self.handle, speedFactor)
    return self
end

---@param flag boolean
function class:show(flag)
    ShowDestructable(self.handle, flag)
    return self
end

---@return real
function class:getOccluderHeight()
    return GetDestructableOccluderHeight(self.handle)
end

---@param height real
function class:setOccluderHeight(height)
    SetDestructableOccluderHeight(self.handle, height)
    return self
end

---@return string
function class:getName()
    return GetDestructableName(self.handle)
end

function class:triggered()
    return self:new(GetTriggerDestructable())
end