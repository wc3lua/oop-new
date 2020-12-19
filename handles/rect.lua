---@class Rect:Handle
Rect = extendedClass(Handle)
local class = Rect

function class:new(rectHandle)
    self.handle = rectHandle
    return newObject(self)
end

function class:getFromCoords(minx, miny, maxx, maxy)
    return self:new(Rect(minx, miny, maxx, maxy))
end

function class:getFromLoc(min, max)
    return self:new(RectFromLoc(min.handle, max.handle))
end

function class:getFromPoint(min, max)
    return self:get(min.coordX, min.coordY, max.coordX, max.coordY)
end

function class:remove()
    RemoveRect(self.handle)
    return self
end

function class:setFromCoords(minx, miny, maxx, maxy)
    SetRect(self.handle, minx, miny, maxx, maxy)
    return self
end

function class:setFromLoc(min, max)
    SetRectFromLoc(self.handle, min.handle, max.handle)
    return self
end

function class:setFromPoint(min, max)
    return self:setFromCoords(min.coordX, min.coordY, max.coordX, max.coordY)
end

function class:moveToCoords(newCenterX, newCenterY)
    MoveRectTo(self.handle, newCenterX, newCenterY)
    return self
end

function class:moveToLoc(newCenterLoc)
    MoveRectToLoc(self.handle, newCenterLoc)
    return self
end

function class:getCenterX()
    return GetRectCenterX(self.handle)
end

function class:getCenterY()
    return GetRectCenterY(self.handle)
end

function class:getCenterPoint()
    return ClassPoint:new(self:getCenterX(), self:getCenterY())
end

function class:getMinX()
    return GetRectMinX(self.handle)
end

function class:getMinY()
    return GetRectMinY(self.handle)
end

function class:getMaxX()
    return GetRectMaxX(self.handle)
end

function class:getMaxY()
    return GetRectMaxY(self.handle)
end

-- Returns full map bounds, including unplayable borders, in world coordinates
function class:getWorldBounds()
    return self:new(GetWorldBounds())
end