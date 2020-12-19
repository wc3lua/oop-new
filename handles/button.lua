---@class Button:Handle
Button = extendedClass(Handle)
local class = Button

function class:new(buttonHandle)
    self.handle = buttonHandle
    return newObject(self)
end