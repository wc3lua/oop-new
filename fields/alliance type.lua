TypeAlliance = extendedClass(ClassConvert)
local class = TypeAlliance

function class:convert(i)
    return ConvertAllianceType(i)
end

class.Passive = class:convert(0)
class.HelpRequest = class:convert(1)
class.HelpResponse = class:convert(2)
class.SharedXP = class:convert(3)
class.SharedSpells = class:convert(4)
class.SharedVision = class:convert(5)
class.SharedControl = class:convert(6)
class.SharedAdvancedControl = class:convert(7)
class.Rescuable = class:convert(8)
class.SharedVisionForced = class:convert(9)