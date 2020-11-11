---@class Location:handle
ClassLocation = extendedClass(ClassHandle)

local class = ClassLocation

---@param locationHandle location
---@return Location
function class:new(locationHandle)
    self.handle = locationHandle
    return newObject(self)
end

---@param x real
---@param y real
function class:alloc(x, y)
    return self:new(Location(x, y))
end

---@param newX real
---@param newY real
function class:move(newX, newY)
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
    return self:move(x, self:getY())
end

---@param y real
function class:setY(y)
    return self:move(self:getX(), y)
end

---@param x real|nil
function class:x(x)
    if  not x then
        return self:getX()
    else
        self:move(x, self:getY())
    end
    return self
end

---@param y real|nil
function class:y(y)
    if  not y then
        return self:getY()
    else
        self:move(self:x(), y)
    end
    return self
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

---@param whichPoint ClassPoint
---@return boolean
function class:isContainsPoint(whichPoint)
    return self:isContainsCoords(whichPoint.coordX, whichPoint.coordY)
end

---@param whichLoc Location
---@return boolean
function class:isContainsLoc(whichLoc)
    return self:isContainsCoords(whichLoc:getX(), whichLoc:getY())
end

---@param whichUnit Unit
---@return boolean
function class:isContainsUnit(whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end

tempLocation = ClassLocation:alloc(0,0)