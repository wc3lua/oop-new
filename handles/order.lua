---@class Order
Order = newClass()
local class = Order

function class:new(id)
    self.id = formatIntOrder(id)
    self.stringId = formatStringOrder(id)
    return newObject(self)
end

function class:formatInt(id)
    if instanceof(id, class) then
        return id.id
    else
        return formatIntOrder(id)
    end
end

function class:formatString(id)
    if instanceof(id, class) then
        return id.stringId
    else
        return formatStringOrder(id)
    end
end