---@class IdAbility:Rawcode
IdAbility = extendedClass(RawCode)
local class = IdAbility

function class:setTooltip(tooltip, level)
    BlzSetAbilityTooltip(self.id, tooltip, level)
    return self
end

function class:setActivatedTooltip(tooltip, level)
    BlzSetAbilityActivatedTooltip(self.id, tooltip, level)
    return self
end

function class:setExtendedTooltip(extendedTooltip, level)
    BlzSetAbilityExtendedTooltip(self.id, extendedTooltip, level)
    return self
end

function class:setActivatedExtendedToltip(extendedTooltip, level)
    BlzSetAbilityActivatedExtendedTooltip(self.id, extendedTooltip, level)
    return self
end

function class:setResearchTooltip(researchTooltip, level)
    BlzSetAbilityResearchTooltip(self.id, researchTooltip, level)
    return self
end

function class:setResearchExtendedTooltip(researchExtendedTooltip, level)
    BlzSetAbilityResearchExtendedTooltip(self.id, researchExtendedTooltip, level)
    return self
end

function class:getTooltip(level)
    return BlzGetAbilityTooltip(self.id, level)
end

function class:getActivatedTooltip(level)
    return BlzGetAbilityActivatedTooltip(self.id, level)
end

function class:getExtendedTooltip(level)
    return BlzGetAbilityExtendedTooltip(self.id, level)
end

function class:getActivatedExtendedTooltip(level)
    return BlzGetAbilityActivatedExtendedTooltip(self.id, level)
end

function class:getResearchTooltip(level)
    return BlzGetAbilityResearchTooltip(self.id, level)
end

function class:getResearchExtendedTooltip(level)
    return BlzGetAbilityResearchExtendedTooltip(self.id, level)
end

function class:setIcon(iconPath)
    BlzSetAbilityIcon(self.id, iconPath)
    return self
end

function class:getIcon()
    return BlzGetAbilityIcon(self.id)
end

function class:setActivatedIcon(iconPath)
    BlzSetAbilityActivatedIcon(self.id, iconPath)
    return self
end

function class:getActivatedIcon()
    return BlzGetAbilityActivatedIcon(self.id)
end

function class:getPosX()
    return BlzGetAbilityPosX(self.id)
end

function class:getPosY()
    return BlzGetAbilityPosY(self.id)
end

function class:setPosX(x)
    BlzSetAbilityPosX(self.id, x)
    return self
end

function class:setPosY(y)
    BlzSetAbilityPosY(self.id, y)
    return self
end

function class:getActivatedPosX()
    return BlzGetAbilityActivatedPosX(self.id)
end

function class:getActivatedPosY()
    return BlzGetAbilityActivatedPosY(self.id)
end

function class:setActivatedPosX(x)
    BlzSetAbilityActivatedPosX(self.id, x)
    return self
end

function class:setActivatedPosY(y)
    BlzSetAbilityActivatedPosY(self.id, y)
    return self
end

function class:getManaCost(level)
    return BlzGetAbilityManaCost(self.id, level)
end

function class:getCooldown(level)
    return BlzGetAbilityCooldown(self.id, level)
end