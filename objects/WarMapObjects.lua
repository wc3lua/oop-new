-- Encapsulates all objects of all types in a map.
---@class ClassWarMapObjects
local WarMapObjects = {}

---@class WarMapObjects
function WarMapObjects:new()
    local obj = {} ---@type WarMapObjects
    
    ---@type WarObject
    obj.ability = {} 

    ---@type WarObject
    obj.item = {}

    ---@type WarObject
    obj.unit = {}

    ---@type WarObject
    obj.destructable = {}

    ---@type WarObject
    obj.doodad = {}

    ---@type WarObject
    obj.buff = {}

    ---@type WarObject
    obj.upgrade = {}

    assignClass(obj, self)
    return obj
end

return WarMapObjects