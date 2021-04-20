Handle = newClass()
local class = Handle

---@param handle handle
---@return Handle
function class:new(handle)
    if handle ~= nil then
        self.handle = handle
    else
        self.handle = 0
    end
    return newObject(self)
end

---@return integer
function class:handleId()
    return GetHandleId(self.handle)
end