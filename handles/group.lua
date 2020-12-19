--============================================================================
-- Group API
---@class Group:Handle
Group = extendedClass(Handle)
local class = Group

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

function class:addUnit(whichUnit)
    return GroupAddUnit(self.handle, whichUnit.handle)
end

function class:removeUnit(whichUnit)
    return GroupRemoveUnit(self.handle, whichUnit.handle)
end

function class:addGroup(addGroup)
    return BlzGroupAddGroupFast(self.handle, addGroup.handle)
end

function class:removeGroup(removeGroup)
    return BlzGroupRemoveGroupFast(self.handle, removeGroup.handle)
end

function class:clear()
    GroupClear(self.handle)
    return self
end

function class:getSize()
    return BlzGroupGetSize(self.handle)
end

function class:unitAt(index)
    return Unit:new(BlzGroupUnitAt(self.handle, index))
end

function class:enumOfType(unitname, filter)
    GroupEnumUnitsOfType(self.handle, unitname, Condition(filter))
    return self
end

function class:enumOfPlayer(whichPlayer, filter)
    GroupEnumUnitsOfPlayer(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

function class:enumCountedOfType(unitname, countLimit, filter)
    GroupEnumUnitsOfTypeCounted(self.handle, unitname, Condition(filter), countLimit)
    return self
end

function class:enumInRect(r, filter)
    GroupEnumUnitsInRect(self.handle, r.handle, Condition(filter))
    return self
end

function class:enumCountedInRect(r, countLimit, filter)
    GroupEnumUnitsInRectCounted(self.handle, r.handle, Condition(filter), countLimit)
    return self
end

function class:enumInRangeOfCoords(x, y, radius, filter)
    GroupEnumUnitsInRange(self.handle, x, y, radius, Condition(filter))
    return self
end

function class:enumInRangeOfPoint(p, radius, filter)
    return self:enumInRangeOfCoords(p:getX(), p:getY(), radius, filter)
end

function class:enumInRangeOfLoc(whichLocation, radius, filter)
    GroupEnumUnitsInRangeOfLoc(self.handle, whichLocation.handle, radius, Condition(filter))
    return self
end

function class:enumCountedInRangeOfCoords(x, y, radius, countLimit, filter)
    GroupEnumUnitsInRangeCounted(self.handle, x, y, radius, Condition(filter), countLimit)
    return self
end

function class:enumCountedInRangeOfPoint(whichPoint, radius, countLimit, filter)
    return self:enumCountedInRangeOfCoords(whichPoint:getX(), whichPoint:getY(), radius, countLimit, filter)
end

function class:enumCountedInRangeOfLoc(whichLocation, radius, countLimit, filter)
    GroupEnumUnitsInRangeOfLocCounted(self.handle, whichLocation.handle, radius, Condition(filter), countLimit)
    return self
end

function class:enumSelected(whichPlayer, filter)
    GroupEnumUnitsSelected(self.handle, whichPlayer.handle, Condition(filter))
    return self
end

function class:immediateOrder(order)
    return GroupImmediateOrder(self.handle, formatStringOrder(order))
end

function class:immediateByIdOrder(orderId)
    return GroupImmediateOrderById(self.handle, formatIntOrder(orderId))
end

function class:coordsOrder(order, x, y)
    return GroupPointOrder(self.handle, formatStringOrder(order), x, y)
end

function class:pointOrder(order, whichPoint)
    return self:coordsOrder(order, whichPoint:getX(), whichPoint:getY())
end

function class:locOrder(order, whichLocation)
    return GroupPointOrderLoc(self.handle, formatStringOrder(order), whichLocation)
end

function class:coordsByIdOrder(order, x, y)
    return GroupPointOrderById(self.handle, formatIntOrder(order), x, y)
end

function class:pointByIdOrder(order, whichPoint)
    return self:coordsByIdOrder(order, whichPoint:getX(), whichPoint:getY())
end

function class:locByIdOrder(order, whichLocation)
    return GroupPointOrderByIdLoc(self.handle, formatIntOrder(order), whichLocation)
end

function class:targetOrder(order, targetWidget)
    return GroupTargetOrder(self.handle, formatStringOrder(order), targetWidget.handle)
end

function class:targetByIdOrder(order, targetWidget)
    return GroupTargetOrderById(self.handle, formatIntOrder(order), targetWidget.handle)
end

-- This will be difficult to support with potentially disjoint, cell-based regions
-- as it would involve enumerating all the cells that are covered by a particularregion
-- a better implementation would be a trigger that adds relevant units as they enter
-- and removes them if they leave...
function class:forEach(callback)
    ForGroup(self.handle, callback)
    return self
end

function class:getFirst()
    return Unit:new(FirstOfGroup(self.handle))
end