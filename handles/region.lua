Region = extendedClass(Handle)
local class = Region

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

function class:addRect(r)
    RegionAddRect(self.handle, r.handle)
    return self
end

function class:clearRect(r)
    RegionClearRect(self.handle, r.handle)
    return self
end

function class:addCell(x, y)
    RegionAddCell(self.handle, x, y)
    return self
end

function class:addLocCell(whichLocation)
    RegionAddCellAtLoc(self.handle, whichLocation.handle)
    return self
end

function class:addPointCell(whichPoint)
    return self:addCell(whichPoint:getX(), whichPoint:getY())
end

function class:clearCell(x, y)
    RegionClearCell(self.handle, x, y)
    return self
end

function class:clearLocCell(whichLocation)
    RegionClearCellAtLoc(self.handle, whichLocation.handle)
    return self
end

function class:clearPointCell(whichPoint)
    return self:clearCell(whichPoint:getX(), whichPoint:getY())
end

function class:isContainsCoords(x, y)
    return IsPointInRegion(self.handle, x, y)
end

function class:isContainsLoc(loc)
    return self:isContainsCoords(loc:getX(), loc:getY())
end

function class:isContainsPoint(p)
    return self:isContainsCoords(p:getX(), p:getY())
end