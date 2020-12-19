Race = extendedClass(ClassConvert)
local class = Race

function class:convert(i)
    return ConvertRace(i)
end

class.Human = class:convert(1)
class.Orc = class:convert(2)
class.Undead = class:convert(3)
class.NightElf = class:convert(4)
class.Demon = class:convert(5)
class.Other = class:convert(7)