--============================================================================
-- Widget API

---@class Widget:Handle
ClassWidget = extendedClass(ClassHandle)

local class = ClassWidget

---@param widgetHandle widget
---@return Widget
function class:new(widgetHandle)
    self.handle = widgetHandle
    return newObject(self)
end

---@return real
function class:getLife()
    return GetWidgetLife(self.handle)
end

---@param newLife real
function class:setLife(newLife)
    SetWidgetlife(self.handle, newLife)
    return self
end

---@param newLife real|nil
function class:life(newLife)
    if  not newLife then
        return self:getLife()
    else
        self:setLife(newLife)
    end
    return self
end

---@return real
function class:getX()
    return GetWidgetX(self.handle)
end

---@return real
function class:getY()
    return GetWidgetY(self.handle)
end


---@return real
function class:getZ()
    return tempLocation:move(self:getX(), self:getY()):getZ()
end

function class:getLoc()
    return ClassLocation:alloc(self:getX(), self:getY())
end

function class:getPos()
    return ClassPoint:new(self:getX(), self:getY(), self:getZ())
end

function class:triggered()
    return self:new(GetTriggerWidget())
end