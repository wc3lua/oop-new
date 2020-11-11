---@class Handle
ClassHandle = newClass()

local class = ClassHandle

---@param handle handle
---@return Handle
function class:new(handle)
    self.handle = handle
    return newObject(self)
end

---@return integer
function class:handleId()
    return GetHandleId(self.handle)
end