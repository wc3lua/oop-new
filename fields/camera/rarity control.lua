RarityControl = extendedClass(ClassConvert)
local class = RarityControl

function class:convert(i)
    return ConvertRarityControl(i)    
end

class.Frequent = class:convert(0)
class.Rare = class:convert(1)