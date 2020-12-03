---@class IdAbility
ClassIdAbility = newClass()
local class = ClassIdAbility

---@param id integer|string
---@return IdAbility
function class:new(id)
    self.id = formatIntCC(id)
    self.stringId = formatStringCC(id)
    return newObject(self)
end

---@param tooltip string
---@param level integer
function class:setTooltip(tooltip, level)
    BlzSetAbilityTooltip(self.id, tooltip, level)
    return self
end

---@param tooltip string
---@param level integer
function class:setActivatedTooltip(tooltip, level)
    BlzSetAbilityActivatedTooltip(self.id, tooltip, level)
    return self
end

---@param extendedTooltip string
---@param level integer
function class:setExtendedTooltip(extendedTooltip, level)
    BlzSetAbilityExtendedTooltip(self.id, extendedTooltip, level)
    return self
end

---@param extendedTooltip string
---@param level integer
function class:setActivatedExtendedToltip(extendedTooltip, level)
    BlzSetAbilityActivatedExtendedTooltip(self.id, extendedTooltip, level)
    return self
end

---@param researchTooltip string
---@param level integer
function class:setResearchTooltip(researchTooltip, level)
    BlzSetAbilityResearchTooltip(self.id, researchTooltip, level)
    return self
end

---@param researchExtendedTooltip string
---@param level integer
function class:setResearchExtendedTooltip(researchExtendedTooltip, level)
    BlzSetAbilityResearchExtendedTooltip(self.id, researchExtendedTooltip, level)
    return self
end

---@param level integer
---@return string
function class:getTooltip(level)
    return BlzGetAbilityTooltip(self.id, level)
end

---@param level integer
---@return string
function class:getActivatedTooltip(level)
    return BlzGetAbilityActivatedTooltip(self.id, level)
end

---@param level integer
---@return string
function class:getExtendedTooltip(level)
    return BlzGetAbilityExtendedTooltip(self.id, level)
end

---@param level integer
---@return string
function class:getActivatedExtendedTooltip(level)
    return BlzGetAbilityActivatedExtendedTooltip(self.id, level)
end

---@param level integer
---@return string
function class:getResearchTooltip(level)
    return BlzGetAbilityResearchTooltip(self.id, level)
end

---@param level integer
---@return string
function class:getResearchExtendedTooltip(level)
    return BlzGetAbilityResearchExtendedTooltip(self.id, level)
end

---@param iconPath string
function class:setIcon(iconPath)
    BlzSetAbilityIcon(self.id, iconPath)
    return self
end

---@return string
function class:getIcon()
    return BlzGetAbilityIcon(self.id)
end

---@param iconPath string
function class:setActivatedIcon(iconPath)
    BlzSetAbilityActivatedIcon(self.id, iconPath)
    return self
end

---@return string
function class:getActivatedIcon()
    return BlzGetAbilityActivatedIcon(self.id)
end

---@return integer
function class:getPosX()
    return BlzGetAbilityPosX(self.id)
end

---@return integer
function class:getPosY()
    return BlzGetAbilityPosY(self.id)
end

---@param x integer
function class:setPosX(x)
    BlzSetAbilityPosX(self.id, x)
    return self
end

---@param y integer
function class:setPosY(y)
    BlzSetAbilityPosY(self.id, y)
    return self
end

---@return integer
function class:getActivatedPosX()
    return BlzGetAbilityActivatedPosX(self.id)
end

---@return integer
function class:getActivatedPosY()
    return BlzGetAbilityActivatedPosY(self.id)
end

---@param x integer
function class:setActivatedPosX(x)
    BlzSetAbilityActivatedPosX(self.id, x)
    return self
end

---@param y integer
function class:setActivatedPosY(y)
    BlzSetAbilityActivatedPosY(self.id, y)
    return self
end

---@param level integer
---@return integer
function class:getManaCost(level)
    return BlzGetAbilityManaCost(self.id, level)
end

---@param level integer
---@return real
function class:getCooldown(level)
    return BlzGetAbilityCooldown(self.id, level)
end