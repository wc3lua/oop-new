BlendMode = extendedClass(ClassConvert)
local class = BlendMode

function class:convert(i)
    return ConvertBlendMode(i)
end

class.None = class:convert(0)
class.DontCare = class:convert(0)
class.KeyAlpha = class:convert(1)
class.Blend = class:convert(2)
class.Additive = class:convert(3)
class.Modulate = class:convert(4)
class.Modulate2X = class:convert(5)