---@class Region:Handle
ClassRegion = extendedClass(ClassHandle)
local class = ClassRegion

---@param regionHandle region
---@return Region
function class:new(regionHandle)
    self.handle = regionHandle
    return newObject(self)
end

function class:create()
    return self:new(CreateRegion())
end

function class:remove()
    RemoveRegion(self.handle)
    return self
end

---@param r Rect
function class:addRect(r)
    RegionAddRect(self.handle, r.handle)
    return self
end

---@param r Rect
function class:clearRect(r)
    RegionClearRect(self.handle, r.handle)
    return self
end

---@param x real
---@param y real
function class:addCell(x, y)
    RegionAddCell(self.handle, x, y)
    return self
end

---@param whichLocation Location
function class:addLocCell(whichLocation)
    RegionAddCellAtLoc(self.handle, whichLocation.handle)
    return self
end

---@param whichPoint Point
function class:addPointCell(whichPoint)
    return self:addCell(whichPoint:getX(), whichPoint:getY())
end

---@param x real
---@param y real
function class:clearCell(x, y)
    RegionClearCell(self.handle, x, y)
    return self
end

---@param whichLocation Location
function class:clearLocCell(whichLocation)
    RegionClearCellAtLoc(self.handle, whichLocation.handle)
    return self
end

---@param whichPoint Point
function class:clearPointCell(whichPoint)
    return self:clearCell(whichPoint:getX(), whichPoint:getY())
end

---@param x real
---@param y real
---@return boolean
function class:isContainsCoords(x, y)
    return IsPointInRegion(self.handle, x, y)
end

---@param loc Location
---@return boolean
function class:isContainsLoc(loc)
    return self:isContainsCoords(loc:getX(), loc:getY())
end

---@param p Point
---@return boolean
function class:isContainsPoint(p)
    return self:isContainsCoords(p:getX(), p:getY())
end