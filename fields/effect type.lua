--===================================================
-- Effect API s
--===================================================

---@class TypeEffect:Convert
TypeEffect = extendedClass(ClassConvert)
local class = TypeEffect

---@param i integer
---@return effecttype
function class:convert(i)
    return ConvertEffectType(i)
end

class.Effect = class:convert(0)
class.Target = class:convert(1)
class.Caster = class:convert(2)
class.Special = class:convert(3)
class.AreaEffect = class:convert(4)
class.Missile = class:convert(5)
class.Lightning = class:convert(6)