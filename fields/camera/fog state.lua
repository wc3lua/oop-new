FogState = extendedClass(ClassConvert)
local class = FogState

function class:convert(i)
    return ConvertFogState(i)
end

class.Masked = class:convert(1)
class.Fogged = class:convert(2)
class.Visible = class:convert(4)