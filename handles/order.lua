---@class Order
Order = newClass()
local class = Order

---@param id order
---@return Order
function class:new(id)
    self.id = formatIntOrder(id)
    self.stringId = formatStringOrder(id)
    return newObject(self)
end

---@param id order|Order
---@return integer
function class:formatInt(id)
    if instanceof(id, class) then
        return id.id
    else
        return formatIntOrder(id)
    end
end

---@param id order|Order
---@return string
function class:formatString(id)
    if instanceof(id, class) then
        return id.stringId
    else
        return formatStringOrder(id)
    end
end