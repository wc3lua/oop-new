TypeTextAlign = extendedClass(ClassConvert)
local class = TypeTextAlign

function class:convert(i)
    return ConvertTextAlignType(i)
end

class.Top = class:convert(0)
class.Middle = class:convert(1)
class.Bottom = class:convert(2)
class.Left = class:convert(3)
class.Center = class:convert(4)
class.Right = class:convert(5)