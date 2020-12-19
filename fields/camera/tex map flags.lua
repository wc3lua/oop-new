TexMapFlags = extendedClass(ClassConvert)
local class = TexMapFlags

function class:convert(i)
    return ConvertTexMapFlags(i)
end

class.None = class:convert(0)
class.WrapU = class:convert(1)
class.WrapV = class:convert(2)
class.WrapUV = class:convert(3)