-- Encapsulates all objects of all types in a map.
---@class ClassWarMapObjects
ClassWarMapObjects = newClass()
---@class WarMapObjects

local class = ClassWarMapObjects

---@return WarMapObjects
function class:new()
    return newObject(self)
end

---@type WarObject
class.ability = {}

---@type WarObject
class.item = {}

---@type WarObject
class.unit = {}

---@type WarObject
class.destructable = {}

---@type WarObject
class.doodad ={}

---@type WarObject
class.buff = {}

---@type WarObject
class.upgrade = {}