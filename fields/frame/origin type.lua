---@class TypeOriginFrame:ClassConvert
TypeOriginFrame = extendedClass(ClassConvert)
local class = TypeOriginFrame

---@param i integer
---@return originframetype
function class:convert(i)
    return ConvertOriginFrameType(i)
end

class.GameUI = class:convert(0)
class.CommandButton = class:convert(1)
class.HeroBar = class:convert(2)
class.HeroButton = class:convert(3)
class.HeroHPBar = class:convert(4)
class.HeroManaBar = class:convert(5)
class.HeroButtonIndicator = class:convert(6)
class.ItemButton = class:convert(7)
class.Minimap = class:convert(8)
class.ButtonMinimap = class:convert(9)
class.SystemButton = class:convert(10)
class.Tooltip = class:convert(11)
class.Ubertooltip = class:convert(12)
class.ChatMsg = class:convert(13)
class.UnitMsg = class:convert(14)
class.TopMsg = class:convert(15)
class.Portrait = class:convert(16)
class.World = class:convert(17)