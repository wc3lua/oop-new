---@class RarityControl:ClassConvert
RarityControl = extendedClass(ClassConvert)
local class = RarityControl

---@param i integer
---@return raritycontrol
function class:convert(i)
    return ConvertRarityControl(i)    
end

class.Frequent = class:convert(0)
class.Rare = class:convert(1)