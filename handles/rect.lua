---@class Rect:Handle
Rect = extendedClass(Handle)
local class = Rect

---@param rectHandle rect
---@return Rect
function class:new(rectHandle)
    self.handle = rectHandle
    return newObject(self)
end

---@param minx real
---@param miny real
---@param maxx real
---@param maxy real
function class:getFromCoords(minx, miny, maxx, maxy)
    return self:new(Rect(minx, miny, maxx, maxy))
end

---@param min Location
---@param max Location
function class:getFromLoc(min, max)
    return self:new(RectFromLoc(min.handle, max.handle))
end

---@param min Point
---@param max Point
function class:getFromPoint(min, max)
    return self:get(min.coordX, min.coordY, max.coordX, max.coordY)
end

function class:remove()
    RemoveRect(self.handle)
    return self
end

---@param minx real
---@param miny real
---@param maxx real
---@param maxy real
function class:setFromCoords(minx, miny, maxx, maxy)
    SetRect(self.handle, minx, miny, maxx, maxy)
    return self
end

---@param min Location
---@param max Location
function class:setFromLoc(min, max)
    SetRectFromLoc(self.handle, min.handle, max.handle)
    return self
end

---@param min Point
---@param max Point
function class:setFromPoint(min, max)
    return self:setFromCoords(min.coordX, min.coordY, max.coordX, max.coordY)
end

---@param newCenterX real
---@param newCenterY real
function class:moveToCoords(newCenterX, newCenterY)
    MoveRectTo(self.handle, newCenterX, newCenterY)
    return self
end

---@param newCenterLoc Location
function class:moveToLoc(newCenterLoc)
    MoveRectToLoc(self.handle, newCenterLoc)
    return self
end

---@return real
function class:getCenterX()
    return GetRectCenterX(self.handle)
end

---@return real
function class:getCenterY()
    return GetRectCenterY(self.handle)
end

function class:getCenterPoint()
    return ClassPoint:new(self:getCenterX(), self:getCenterY())
end

---@return real
function class:getMinX()
    return GetRectMinX(self.handle)
end

---@return real
function class:getMinY()
    return GetRectMinY(self.handle)
end

---@return real
function class:getMaxX()
    return GetRectMaxX(self.handle)
end

---@return real
function class:getMaxY()
    return GetRectMaxY(self.handle)
end

-- Returns full map bounds, including unplayable borders, in world coordinates
function class:getWorldBounds()
    return self:new(GetWorldBounds())
end