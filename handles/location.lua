HLocation = extendedClass(Handle)
local class = HLocation

---@param locationHandle location
---@return Location
function class:new(locationHandle)
    return Handle:new(locationHandle)
end

---@param x real
---@param y real
function class:alloc(x, y)
    return self:new(Location(x, y))
end

---@param newX real
---@param newY real
function class:moveCoords(newX, newY)
    MoveLocation(self.handle, newX, newY)
    return self
end

---@return real
function class:getX()
    return GetLocationX(self.handle)
end

---@return real
function class:getY()
    return GetLocationY(self.handle)
end

---@param x real
function class:setX(x)
    return self:moveCoords(x, self:getY())
end

---@param y real
function class:setY(y)
    return self:moveCoords(self:getX(), y)
end

-- This function is asynchronous. The values it returns are not guaranteed synchronous between each player.
--  If you attempt to use it in a synchronous manner, it may cause a desync.
---@return real
function class:getZ()
    return GetLocationZ(self.handle)
end

function class:remove()
    RemoveLocation(self.handle)
    return self
end

---@param whichRegion Region
---@return boolean
function class:isInRegion(whichRegion)
    return IsLocationInRegion(whichRegion.handle, self.handle)
end

---@param whichUnit Unit
---@return boolean
function class:isContainsUnit(whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end

---@param x real
---@param y real
---@return boolean
function class:isContainsCoords(x, y)
    return IsPointInRegion(self.handle, x, y)
end

---@param p Pointable
---@return boolean
function class:isContainsPos(p)
    return self:isContainsCoords(self:getX(), self:getY())
end

tempLocation = HLocation:alloc(0,0)