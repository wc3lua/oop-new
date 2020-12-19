---@class Location:handle
HLocation = extendedClass(Handle)
local class = HLocation

function class:new(locationHandle)
    self.handle = locationHandle
    return newObject(self)
end

function class:alloc(x, y)
    return self:new(Location(x, y))
end

function class:move(newX, newY)
    MoveLocation(self.handle, newX, newY)
    return self
end

function class:getX()
    return GetLocationX(self.handle)
end

function class:getY()
    return GetLocationY(self.handle)
end

function class:setX(x)
    return self:move(x, self:getY())
end

function class:setY(y)
    return self:move(self:getX(), y)
end

function class:x(x)
    if  not x then
        return self:getX()
    else
        self:move(x, self:getY())
    end
    return self
end

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
function class:getZ()
    return GetLocationZ(self.handle)
end

function class:remove()
    RemoveLocation(self.handle)
    return self
end

function class:isInRegion(whichRegion)
    return IsLocationInRegion(whichRegion.handle, self.handle)
end

function class:isContainsUnit(whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end

function class:isContainsCoords(x, y)
    return IsPointInRegion(self.handle, x, y)
end

function class:isContainsPoint(whichPoint)
    return self:isContainsCoords(whichPoint.coordX, whichPoint.coordY)
end

function class:isContainsLoc(whichLoc)
    return self:isContainsCoords(whichLoc:getX(), whichLoc:getY())
end

function class:isContainsUnit(whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end

tempLocation = HLocation:alloc(0,0)