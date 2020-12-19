---@class Handle
Handle = newClass()
local class = Handle

function class:new(handle)
    self.handle = handle
    return newObject(self)
end

function class:handleId()
    return GetHandleId(self.handle)
end