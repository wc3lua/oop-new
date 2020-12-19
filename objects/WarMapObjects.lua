-- Encapsulates all objects of all types in a map.
ClassWarMapObjects = newClass()

local class = ClassWarMapObjects

function class:new()
    return newObject(self)
end

class.ability = {}
class.item = {}
class.unit = {}
class.destructable = {}
class.doodad = {}
class.buff = {}
class.upgrade = {}