--============================================================================
-- Item API
---@class Item:Widget
Item = extendedClass(Widget)
local class = Item

function class:new(itemHandle)
    self.handle = itemHandle
    return newObject(self)
end

function class:coordsCreate(itemid, x, y)
    return self:new(CreateItem(FormatCC(itemid), x, y))
end

function class:pointCreate(itemid, p)
    return self:coordsCreate(itemid, p:getX(), p:getY())
end

function class:locCreate(itemid, loc)
    return self:coordsCreate(itemid, loc:getX(), loc:getY())
end

function class:remove()
    RemoveItem(self.handle)
    return self
end

function class:getPlayer()
    return ClassPlayer:fromItem(self)
end

function class:getTypeId()
    return GetItemTypeId(self.handle)
end

function class:getX()
    return GetItemX(self.handle)
end

function class:getY()
    return GetItemY(self.handle)
end

function class:setPos(x, y)
    SetItemPosition(self.handle, x, y)
    return self
end

function class:setLocPos(loc)
    return self:setPos(loc:getX(), loc:getY())
end

function class:setPointPos(p)
    return self:setPos(p:getX(), p:getY())
end

function class:setDropOnDeath(flag)
    SetItemDropOnDeath(self.handle, flag)
    return self
end

function class:setDroppable(flag)
    SetItemDroppable(self.handle, flag)
    return self
end

function class:setPawnable(flag)
    SetItemPawnable(self.handle, flag)
    return self
end

function class:setPlayer(whichPlayer, changeColor)
    SetItemPlayer(self.handle, whichPlayer.handle, changeColor)
    return self
end

function class:player(whichPlayer, changeColor)
    if  not whichPlayer then
        return self:getPlayer()
    else
        return self:setPlayer(whichPlayer, changeColor)
    end
end

function class:setInvulnerable(flag)
    SetItemInvulnerable(self.handle, flag)
    return self
end

function class:isInvulnerable()
    return IsItemInvulnerable(self.handle)
end

function class:setVisible(show)
    SetItemVisible(self.handle, show)
    return self
end

function class:isVisible()
    return IsItemVisible(self.handle)
end

function class:isOwned()
    return IsItemOwned(self.handle)
end

function class:isPowerup()
    return IsItemPowerup(self.handle)
end

function class:isSellable()
    return IsItemSellable(self.handle)
end

function class:isPawnable()
    return IsItemPawnable(self.handle)
end

function class:isIdPowerup(itemId)
    return IsItemIdPowerup(FormatCC(itemId))
end

function class:isIdSellable(itemId)
    return IsItemIdSellable(FormatCC(itemId))
end

function class:isIdPawnable(itemId)
    return IsItemIdPawnable(FormatCC(itemId))
end

function class:enumInRect(r, filter, actionFunc)
    EnumItemsInRect(r.handle, Condition(filter), actionFunc)
    return self
end

function class:getLevel()
    return GetItemLevel(self.handle)
end

function class:getType()
    return GetItemType(self.handle)
end

function class:setDropID(unitId)
    SetItemDropID(self.handle, FormatCC(unitId))
end

function class:name(name)
    if  not name then
        return GetItemName(self.handle)
    else
        BlzSetItemName(self.handle, name)
    end
    return self
end

function class:description(description)
    if  not description then
        return BlzGetItemDescription(self.handle)
    else
        BlzSetItemDescription(self.handle, description)
    end
    return self
end

function class:tooltip(tooltip)
    if  not tooltip then
        return BlzGetItemTooltip(self.handle)
    else
        BlzSetItemTooltip(self.handle, tooltip)
    end
    return self
end

function class:extendedTooltip(extendedTooltip)
    if  not extendedTooltip then
        return BlzGetItemExtendedTooltip(self.handle)
    else
        BlzSetItemExtendedTooltip(self.handle, extendedTooltip)
    end
    return self
end

function class:iconPath(iconPath)
    if  not iconPath then
        return BlzGetItemIconPath(self.handle)
    else
        BlzSetItemIconPath(self.handle, iconPath)
    end
    return self
end

function class:charges(charges)
    if  not charges then
        return GetItemCharges(self.handle)
    else
        SetItemCharges(self.handle, charges)
    end
    return self
end

function class:userData(data)
    if  not data then
        return GetItemUserData(self.handle)
    else
        SetItemUserData(self.handle, data)
    end
    return self
end

function class:getAbility(abilCode)
    return ClassAbility:fromItem(self, abilCode)
end

function class:getByIndexAbility(index)
    return ClassAbility:fromByIndexItem(self, index)
end

function class:addAbility(abilCode)
    return BlzItemAddAbility(self.handle, FormatCC(abilCode))
end

function class:removeAbility(abilCode)
    BlzItemRemoveAbility(self.handle, FormatCC(abilCode))
end

function class:getBooleanField(whichField)
    return BlzGetItemBooleanField(self.handle, whichField)
end

function class:setBooleanField(whichField, value)
    return BlzSetItemBooleanField(self.handle, whichField, value)
end

function class:booleanField(whichField, value)
    if  not value then
        return BlzGetItemBooleanField(self.handle, whichField)
    else
        return BlzSetItemBooleanField(self.handle, whichField, value)
    end
end

function class:getIntegerField(whichField)
    return BlzGetItemIntegerField(self.handle, whichField)
end

function class:setIntegerField(whichField, value)
    return BlzSetItemIntegerField(self.handle, whichField, value)
end

function class:integerField(whichField, value)
    if  not value then
        return BlzGetItemIntegerField(self.handle, whichField)
    else
        return BlzSetItemIntegerField(self.handle, whichField, value)
    end
end

function class:getRealField(whichField)
    return BlzGetItemRealField(self.handle, whichField)
end

function class:setRealField(whichField, value)
    return BlzSetItemRealField(self.handle, whichField, value)
end

function class:realField(whichField, value)
    if  not value then
        return BlzGetItemRealField(self.handle, whichField)
    else
        return BlzSetItemRealField(self.handle, whichField, value)
    end
end

function class:getStringField(whichField)
    return BlzGetItemStringField(self.handle, whichField)
end

function class:setStringField(whichField, value)
    return BlzSetItemStringField(self.handle, whichField, value)
end

function class:stringField(whichField, value)
    if  not value then
        return BlzGetItemStringField(self.handle, whichField)
    else
        return BlzSetItemStringField(self.handle, whichField, value)
    end
end