---@class FogState:ClassConvert
FogState = extendedClass(ClassConvert)
local class = FogState

---@param i integer
---@return fogstate
function class:convert(i)
    return ConvertFogState(i)
end

class.Masked = class:convert(1)
class.Fogged = class:convert(2)
class.Visible = class:convert(4)