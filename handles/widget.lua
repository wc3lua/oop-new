--============================================================================
-- Widget API

Widget = extendedClass(Handle)
local class = Widget

function class:new(widgetHandle)
    self.handle = widgetHandle
    return newObject(self)
end

function class:getLife()
    return GetWidgetLife(self.handle)
end

function class:setLife(newLife)
    SetWidgetlife(self.handle, newLife)
    return self
end

function class:life(newLife)
    if  not newLife then
        return self:getLife()
    else
        self:setLife(newLife)
    end
    return self
end

function class:getX()
    return GetWidgetX(self.handle)
end

function class:getY()
    return GetWidgetY(self.handle)
end


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