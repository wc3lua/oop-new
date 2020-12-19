TypePointFrame = extendedClass(ClassConvert)
local class = TypePointFrame

function class:convert(i)
    return ConvertFramePointType(i)
end

class.LeftTop = class:convert(0)
class.Top = class:convert(1)
class.TopRight = class:convert(2)
class.Left = class:convert(3)
class.Center = class:convert(4)
class.Right = class:convert(5)
class.LeftBottom = class:convert(6)
class.Bottom = class:convert(7)
class.RightBottom = class:convert(8)