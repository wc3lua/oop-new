---@class Button:Handle
ClassButton = extendedClass(ClassHandle)

local class = ClassButton

---@param buttonHandle button
---@return Button
function class:new(buttonHandle)
    self.handle = buttonHandle
    return newObject(self)
end