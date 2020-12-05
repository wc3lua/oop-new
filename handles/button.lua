---@class Button:Handle
Button = extendedClass(Handle)
local class = Button

---@param buttonHandle button
---@return Button
function class:new(buttonHandle)
    self.handle = buttonHandle
    return newObject(self)
end