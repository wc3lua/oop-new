--============================================================================
-- Group API
---@class Group:Handle
Group = extendedClass(Handle)
local class = Group

---@param groupHandle group
---@return Group
function class:new(groupHandle)
    self.handle = groupHandle
    return newObject(self)
end

function class:create()
    return self:new(CreateGroup())
end

function class:destroy()
    DestroyGroup(self.handle)
    return self
end

---@param whichUnit Unit
---@return boolean
function class:addUnit(whichUnit)
    return GroupAddUnit(self.handle, whichUnit.handle)
end

---@param whichUnit Unit
---@return boolean
function class:removeUnit(whichUnit)
    return GroupRemoveUnit(self.handle, whichUnit.handle)
end

---@param addGroup Group
---@return integer
function class:addGroup(addGroup)
    return BlzGroupAddGroupFast(self.handle, addGroup.handle)
end

---@param removeGroup Group
---@return integer
function class:removeGroup(removeGroup)
    return BlzGroupRemoveGroupFast(self.handle, removeGroup.handle)
end

function class:clear()
    GroupClear(self.handle)
    return self
end

---@return integer
function class:getSize()
    return BlzGroupGetSize(self.handle)
end

---@param index integer
function class:unitAt(index)
    return Unit:new(BlzGroupUnitAt(self.handle, index))
end

---@param unitname string
---@param filter boolexpr
function class:enumOfType(unitname, filter)
    GroupEnumUnitsOfType(self.handle, unitname, Condition(filter))
    return self
end

---@param whichPlayer Player
---@param filter boolexpr
function class:enumOfPlayer(whichPlayer, filter)
    GroupEnumUnitsOfPlayer(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

---@param unitname string
---@param countLimit integer
---@param filter boolexpr
function class:enumCountedOfType(unitname, countLimit, filter)
    GroupEnumUnitsOfTypeCounted(self.handle, unitname, Condition(filter), countLimit)
    return self
end

---@param r Rect
---@param filter boolexpr
function class:enumInRect(r, filter)
    GroupEnumUnitsInRect(self.handle, r.handle, Condition(filter))
    return self
end

---@param r Rect
---@param countLimit integer
---@param filter boolexpr
function class:enumCountedInRect(r, countLimit, filter)
    GroupEnumUnitsInRectCounted(self.handle, r.handle, Condition(filter), countLimit)
    return self
end

---@param x real
---@param y real
---@param radius real
---@param filter boolexpr
function class:enumInRangeOfCoords(x, y, radius, filter)
    GroupEnumUnitsInRange(self.handle, x, y, radius, Condition(filter))
    return self
end

---@param p Point
---@param radius real
---@param filter boolexpr
function class:enumInRangeOfPoint(p, radius, filter)
    return self:enumInRangeOfCoords(p:getX(), p:getY(), radius, filter)
end

---@param whichLocation Location
---@param radius real
---@param filter boolexpr
function class:enumInRangeOfLoc(whichLocation, radius, filter)
    GroupEnumUnitsInRangeOfLoc(self.handle, whichLocation.handle, radius, Condition(filter))
    return self
end

---@param x real
---@param y real
---@param radius real
---@param countLimit integer
---@param filter boolexpr
function class:enumCountedInRangeOfCoords(x, y, radius, countLimit, filter)
    GroupEnumUnitsInRangeCounted(self.handle, x, y, radius, Condition(filter), countLimit)
    return self
end

---@param whichPoint Point
---@param radius real
---@param countLimit integer
---@param filter boolexpr
function class:enumCountedInRangeOfPoint(whichPoint, radius, countLimit, filter)
    return self:enumCountedInRangeOfCoords(whichPoint:getX(), whichPoint:getY(), radius, countLimit, filter)
end

---@param whichLocation Location
---@param radius real
---@param countLimit integer
---@param filter boolexpr
function class:enumCountedInRangeOfLoc(whichLocation, radius, countLimit, filter)
    GroupEnumUnitsInRangeOfLocCounted(self.handle, whichLocation.handle, radius, Condition(filter), countLimit)
    return self
end

---@param whichPlayer Player
---@param filter boolexpr
function class:enumSelected(whichPlayer, filter)
    GroupEnumUnitsSelected(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

---@param order integer|string
---@return boolean
function class:immediateOrder(order)
    return GroupImmediateOrder(self.handle, formatStringOrder(order))
end

---@param orderId integer
---@return boolean
function class:immediateByIdOrder(orderId)
    return GroupImmediateOrderById(self.handle, formatIntOrder(orderId))
end

---@param order integer|string
---@param x real
---@param y real
---@return boolean
function class:coordsOrder(order, x, y)
    return GroupPointOrder(self.handle, formatStringOrder(order), x, y)
end

---@param order integer|string
---@param whichPoint Point
---@return boolean
function class:pointOrder(order, whichPoint)
    return self:coordsOrder(order, whichPoint:getX(), whichPoint:getY())
end

---@param order integer|string
---@param whichLocation Location
---@return boolean
function class:locOrder(order, whichLocation)
    return GroupPointOrderLoc(self.handle, formatStringOrder(order), whichLocation)
end

---@param order integer|string
---@param x real
---@param y real
---@return boolean
function class:coordsByIdOrder(order, x, y)
    return GroupPointOrderById(self.handle, formatIntOrder(order), x, y)
end

---@param order integer|string
---@param whichPoint Point
---@return boolean
function class:pointByIdOrder(order, whichPoint)
    return self:coordsByIdOrder(order, whichPoint:getX(), whichPoint:getY())
end

---@param order integer|string
---@param whichLocation Location
---@return boolean
function class:locByIdOrder(order, whichLocation)
    return GroupPointOrderByIdLoc(self.handle, formatIntOrder(order), whichLocation)
end

---@param order integer|string
---@param targetWidget Widget
---@return boolean
function class:targetOrder(order, targetWidget)
    return GroupTargetOrder(self.handle, formatStringOrder(order), targetWidget.handle)
end

---@param order integer|string
---@param targetWidget Widget
---@return boolean
function class:targetByIdOrder(order, targetWidget)
    return GroupTargetOrderById(self.handle, formatIntOrder(order), targetWidget.handle)
end

-- This will be difficult to support with potentially disjoint, cell-based regions
-- as it would involve enumerating all the cells that are covered by a particularregion
-- a better implementation would be a trigger that adds relevant units as they enter
-- and removes them if they leave...
---@param callback code
function class:forEach(callback)
    ForGroup(self.handle, callback)
    return self
end

function class:getFirst()
    return Unit:new(FirstOfGroup(self.handle))
end