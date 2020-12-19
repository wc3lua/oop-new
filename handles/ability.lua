---@class Ability:Handle
Ability = extendedClass(Handle)
local class = Ability

function class:new(abilityHandle)
    self.handle = abilityHandle
    return newObject(self)
end

function class:fromItem(whichItem, abilCode)
    return self:new(BlzGetItemAbility(whichItem.handle, formatIntCC(abilCode)))
end

function class:fromByIndexItem(whichItem, index)
    return self:new(BlzGetItemAbilityByIndex(whichItem.handle, index))
end

function class:fromUnit(whichUnit, abilCode)
    return self:new(BlzGetUnitAbility(whichUnit.handle, formatIntCC(abilCode)))
end

function class:fromByIndexUnit(whichUnit, index)
    return self:new(BlzGetUnitAbilityByIndex(whichUnit.handle, index))
end

-- Intanced Object Operations
-- Ability
function class:getBooleanField(whichField)
    return BlzGetAbilityBooleanField(self.handle, whichField)
end

function class:getIntegerField(whichField)
    return BlzGetAbilityIntegerField(self.handle, whichField)
end

function class:getRealField(whichField)
    return BlzGetAbilityRealField(self.handle, whichField)
end

function class:getStringField(whichField)
    return BlzGetAbilityStringField(self.handle, whichField)
end

function class:getLevelBooleanField(whichField, level)
    return BlzGetAbilityBooleanLevelField(self.handle, whichField, level)
end

function class:getLevelIntegerField(whichField, level)
    return BlzGetAbilityIntegerLevelField(self.handle, whichField, level)
end

function class:getLevelRealField(whichField, level)
    return BlzGetAbilityRealLevelField(self.handle, whichField, level)
end

function class:getLevelStringField(whichField, level)
    return BlzGetAbilityStringLevelField(self.handle, whichField, level)
end

function class:getArrayLevelBooleanField(whichField, level, index)
    return BlzGetAbilityBooleanLevelArrayField(self.handle, whichField, level, index)
end

function class:getArrayLevelIntegerField(whichField, level, index)
    return BlzGetAbilityIntegerLevelArrayField(self.handle, whichField, level, index)
end

function class:getArrayLevelRealField(whichField, level, index)
    return BlzGetAbilityRealLevelArrayField(self.handle, whichField, level, index)
end

function class:getArrayLevelStringField(whichField, level, index)
    return BlzGetAbilityStringLevelArrayField(self.handle, whichField, level, index)
end

function class:setBooleanField(whichField, value)
    return BlzSetAbilityBooleanField(self.handle, whichField, value)
end

function class:setIntegerField(whichField, value)
    return BlzSetAbilityIntegerField(self.handle, whichField, value)
end

function class:setRealField(whichField, value)
    return BlzSetAbilityRealField(self.handle, whichField, value)
end

function class:setStringField(whichField, value)
    return BlzSetAbilityStringField(self.handle, whichField, value)
end

function class:setLevelBooleanField(whichField, level, value)
    return BlzSetAbilityBooleanLevelField(self.handle, whichField, level, value)
end

function class:setLevelIntegerField(whichField, level, value)
    return BlzSetAbilityIntegerLevelField(self.handle, whichField, level, value)
end

function class:setLevelRealField(whichField, level, value)
    return BlzSetAbilityRealLevelField(self.handle, whichField, level, value)
end

function class:setLevelStringField(whichField, level, value)
    return BlzSetAbilityStringLevelField(self.handle, whichField, level, value)
end

function class:setArrayLevelBooleanField(whichField, level, index, value)
    return BlzSetAbilityBooleanLevelArrayField(self.handle, whichField, level, index, value)
end

function class:setArrayLevelIntegerField(whichField, level, index, value)
    return BlzSetAbilityIntegerLevelArrayField(self.handle, whichField, level, index, value)
end

function class:setArrayLevelRealField(whichField, level, index, value)
    return BlzSetAbilityRealLevelArrayField(self.handle, whichField, level, index, value)
end

function class:setArrayLevelStringField(whichField, level, index, value)
    return BlzSetAbilityStringLevelArrayField(self.handle, whichField, level, index, value)
end

function class:addArrayLevelBooleanField(whichField, level, value)
    return BlzAddAbilityBooleanLevelArrayField(self.handle, whichField, level, value)
end

function class:addArrayLevelIntegerField(whichField, level, value)
    return BlzAddAbilityIntegerLevelArrayField(self.handle, whichField, level, value)
end

function class:addArrayLevelRealField(whichField, level, value)
    return BlzAddAbilityRealLevelArrayField(self.handle, whichField, level, value)
end

function class:addArrayLevelStringField(whichField, level, value)
    return BlzAddAbilityStringLevelArrayField(self.handle, whichField, level, value)
end

function class:removeArrayLevelBooleanField(whichField, level, value)
    return BlzRemoveAbilityBooleanLevelArrayField(self.handle, whichField, level, value)
end

function class:removeArrayLevelIntegerField(whichField, level, value)
    return BlzRemoveAbilityIntegerLevelArrayField(self.handle, whichField, level, value)
end

function class:removeArrayLevelRealField(whichField, level, value)
    return BlzRemoveAbilityRealLevelArrayField(self.handle, whichField, level, value)
end

function class:removeArrayLevelStringField(whichField, level, value)
    return BlzRemoveAbilityStringLevelArrayField(self.handle, whichField, level, value)
end