---@class Ability:Handle
ClassAbility = extendedClass(Handle)

local class = ClassAbility

---@param abilityHandle ability
---@return Ability
function class:new(abilityHandle)
    self.handle = abilityHandle
    return newObject(self)
end

---@param whichItem Item
---@param abilCode integer|string
function class:fromItem(whichItem, abilCode)
    return self:new(BlzGetItemAbility(whichItem.handle, formatIntCC(abilCode)))
end

---@param whichItem Item
---@param index integer
function class:fromByIndexItem(whichItem, index)
    return self:new(BlzGetItemAbilityByIndex(whichItem.handle, index))
end

---@param whichUnit Unit
---@param abilCode integer|string
function class:fromUnit(whichUnit, abilCode)
    return self:new(BlzGetUnitAbility(whichUnit.handle, formatIntCC(abilCode)))
end

---@param whichUnit Unit
---@param index integer
function class:fromByIndexUnit(whichUnit, index)
    return self:new(BlzGetUnitAbilityByIndex(whichUnit.handle, index))
end

-- Intanced Object Operations
-- Ability
---@param whichField abilitybooleanfield
---@return boolean
function class:getBooleanField(whichField)
    return BlzGetAbilityBooleanField(self.handle, whichField)
end

---@param whichField abilityintegerfield
---@return integer
function class:getIntegerField(whichField)
    return BlzGetAbilityIntegerField(self.handle, whichField)
end

---@param whichField abilityrealfield
---@return real
function class:getRealField(whichField)
    return BlzGetAbilityRealField(self.handle, whichField)
end

---@param whichField abilitystringfield
---@return string
function class:getStringField(whichField)
    return BlzGetAbilityStringField(self.handle, whichField)
end

---@param whichField abilitybooleanlevelfield
---@param level integer
---@return boolean
function class:getLevelBooleanField(whichField, level)
    return BlzGetAbilityBooleanLevelField(self.handle, whichField, level)
end

---@param whichField abilityintegerlevelfield
---@param level integer
---@return integer
function class:getLevelIntegerField(whichField, level)
    return BlzGetAbilityIntegerLevelField(self.handle, whichField, level)
end

---@param whichField abilityreallevelfield
---@param level integer
---@return integer
function class:getLevelRealField(whichField, level)
    return BlzGetAbilityRealLevelField(self.handle, whichField, level)
end

---@param whichField abilitystringlevelfield
---@param level integer
---@return string
function class:getLevelStringField(whichField, level)
    return BlzGetAbilityStringLevelField(self.handle, whichField, level)
end

---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param index integer
---@return boolean
function class:getArrayLevelBooleanField(whichField, level, index)
    return BlzGetAbilityBooleanLevelArrayField(self.handle, whichField, level, index)
end

---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param index integer
---@return integer
function class:getArrayLevelIntegerField(whichField, level, index)
    return BlzGetAbilityIntegerLevelArrayField(self.handle, whichField, level, index)
end

---@param whichField abilityreallevelarrayfield
---@param level integer
---@param index integer
---@return real
function class:getArrayLevelRealField(whichField, level, index)
    return BlzGetAbilityRealLevelArrayField(self.handle, whichField, level, index)
end

---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param index integer
---@return string
function class:getArrayLevelStringField(whichField, level, index)
    return BlzGetAbilityStringLevelArrayField(self.handle, whichField, level, index)
end

---@param whichField abilitybooleanfield
---@param value boolean
---@return boolean
function class:setBooleanField(whichField, value)
    return BlzSetAbilityBooleanField(self.handle, whichField, value)
end

---@param whichField abilityintegerfield
---@param value integer
---@return boolean
function class:setIntegerField(whichField, value)
    return BlzSetAbilityIntegerField(self.handle, whichField, value)
end

---@param whichField abilityrealfield
---@param value real
---@return boolean
function class:setRealField(whichField, value)
    return BlzSetAbilityRealField(self.handle, whichField, value)
end

---@param whichField abilitystringfield
---@param value string
---@return boolean
function class:setStringField(whichField, value)
    return BlzSetAbilityStringField(self.handle, whichField, value)
end

---@param whichField abilitybooleanlevelfield
---@param level integer
---@param value boolean
---@return boolean
function class:setLevelBooleanField(whichField, level, value)
    return BlzSetAbilityBooleanLevelField(self.handle, whichField, level, value)
end

---@param whichField abilityintegerlevelfield
---@param level integer
---@param value integer
---@return boolean
function class:setLevelIntegerField(whichField, level, value)
    return BlzSetAbilityIntegerLevelField(self.handle, whichField, level, value)
end

---@param whichField abilityreallevelfield
---@param level integer
---@param value real
---@return boolean
function class:setLevelRealField(whichField, level, value)
    return BlzSetAbilityRealLevelField(self.handle, whichField, level, value)
end

---@param whichField abilitystringlevelfield
---@param level integer
---@param value string
---@return boolean
function class:setLevelStringField(whichField, level, value)
    return BlzSetAbilityStringLevelField(self.handle, whichField, level, value)
end

---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param index integer
---@param value boolean
---@return boolean
function class:setArrayLevelBooleanField(whichField, level, index, value)
    return BlzSetAbilityBooleanLevelArrayField(self.handle, whichField, level, index, value)
end

---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param index integer
---@param value integer
---@return boolean
function class:setArrayLevelIntegerField(whichField, level, index, value)
    return BlzSetAbilityIntegerLevelArrayField(self.handle, whichField, level, index, value)
end

---@param whichField abilityreallevelarrayfield
---@param level integer
---@param index integer
---@param value real
---@return boolean
function class:setArrayLevelRealField(whichField, level, index, value)
    return BlzSetAbilityRealLevelArrayField(self.handle, whichField, level, index, value)
end

---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param index integer
---@param value string
---@return boolean
function class:setArrayLevelStringField(whichField, level, index, value)
    return BlzSetAbilityStringLevelArrayField(self.handle, whichField, level, index, value)
end

---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param value boolean
---@return boolean
function class:addArrayLevelBooleanField(whichField, level, value)
    return BlzAddAbilityBooleanLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param value integer
---@return boolean
function class:addArrayLevelIntegerField(whichField, level, value)
    return BlzAddAbilityIntegerLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilityreallevelarrayfield
---@param level integer
---@param value real
---@return boolean
function class:addArrayLevelRealField(whichField, level, value)
    return BlzAddAbilityRealLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param value string
---@return boolean
function class:addArrayLevelStringField(whichField, level, value)
    return BlzAddAbilityStringLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param value boolean
---@return boolean
function class:removeArrayLevelBooleanField(whichField, level, value)
    return BlzRemoveAbilityBooleanLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param value integer
---@return boolean
function class:removeArrayLevelIntegerField(whichField, level, value)
    return BlzRemoveAbilityIntegerLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilityreallevelarrayfield
---@param level integer
---@param value real
---@return boolean
function class:removeArrayLevelRealField(whichField, level, value)
    return BlzRemoveAbilityRealLevelArrayField(self.handle, whichField, level, value)
end

---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param value string
---@return boolean
function class:removeArrayLevelStringField(whichField, level, value)
    return BlzRemoveAbilityStringLevelArrayField(self.handle, whichField, level, value)
end