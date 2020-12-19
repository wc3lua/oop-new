--============================================================================
-- Item API
---@class Item:Widget
Item = extendedClass(Widget)
local class = Item

---@param itemHandle item
---@return Item
function class:new(itemHandle)
    self.handle = itemHandle
    return newObject(self)
end

---@param itemid integer|string
---@param x real
---@param y real
function class:coordsCreate(itemid, x, y)
    return self:new(CreateItem(FormatCC(itemid), x, y))
end

---@param itemid integer|string
---@param p Point
function class:pointCreate(itemid, p)
    return self:coordsCreate(itemid, p:getX(), p:getY())
end

---@param loc Location
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

---@return integer
function class:getTypeId()
    return GetItemTypeId(self.handle)
end

---@return real
function class:getX()
    return GetItemX(self.handle)
end

---@return real
function class:getY()
    return GetItemY(self.handle)
end

---@param x real
---@param y real
function class:setPos(x, y)
    SetItemPosition(self.handle, x, y)
    return self
end

---@param loc Location
function class:setLocPos(loc)
    return self:setPos(loc:getX(), loc:getY())
end

---@param p Point
function class:setPointPos(p)
    return self:setPos(p:getX(), p:getY())
end

---@param flag boolean
function class:setDropOnDeath(flag)
    SetItemDropOnDeath(self.handle, flag)
    return self
end

---@param flag boolean
function class:setDroppable(flag)
    SetItemDroppable(self.handle, flag)
    return self
end

---@param flag boolean
function class:setPawnable(flag)
    SetItemPawnable(self.handle, flag)
    return self
end

---@param whichPlayer Player
---@param changeColor boolean
function class:setPlayer(whichPlayer, changeColor)
    SetItemPlayer(self.handle, whichPlayer.handle, changeColor)
    return self
end

---@param whichPlayer Player
---@param changeColor boolean
function class:player(whichPlayer, changeColor)
    if  not whichPlayer then
        return self:getPlayer()
    else
        return self:setPlayer(whichPlayer, changeColor)
    end
end

---@param flag boolean
function class:setInvulnerable(flag)
    SetItemInvulnerable(self.handle, flag)
    return self
end

---@return boolean
function class:isInvulnerable()
    return IsItemInvulnerable(self.handle)
end

---@param show boolean
function class:setVisible(show)
    SetItemVisible(self.handle, show)
    return self
end

---@return boolean
function class:isVisible()
    return IsItemVisible(self.handle)
end

---@return boolean
function class:isOwned()
    return IsItemOwned(self.handle)
end

---@return boolean
function class:isPowerup()
    return IsItemPowerup(self.handle)
end

---@return boolean
function class:isSellable()
    return IsItemSellable(self.handle)
end

---@return boolean
function class:isPawnable()
    return IsItemPawnable(self.handle)
end

---@param itemId integer|string
function class:isIdPowerup(itemId)
    return IsItemIdPowerup(FormatCC(itemId))
end

---@param itemId integer|string
---@return boolean
function class:isIdSellable(itemId)
    return IsItemIdSellable(FormatCC(itemId))
end

---@param itemId integer|string
---@return boolean
function class:isIdPawnable(itemId)
    return IsItemIdPawnable(FormatCC(itemId))
end

---@param r Rect
---@param filter code
---@param actionFunc code
function class:enumInRect(r, filter, actionFunc)
    EnumItemsInRect(r.handle, Condition(filter), actionFunc)
    return self
end

---@return integer
function class:getLevel()
    return GetItemLevel(self.handle)
end

---@return itemtype
function class:getType()
    return GetItemType(self.handle)
end

---@param unitId integer|string
function class:setDropID(unitId)
    SetItemDropID(self.handle, FormatCC(unitId))
end

---@param name string
function class:name(name)
    if  not name then
        return GetItemName(self.handle)
    else
        BlzSetItemName(self.handle, name)
    end
    return self
end

---@param description string
function class:description(description)
    if  not description then
        return BlzGetItemDescription(self.handle)
    else
        BlzSetItemDescription(self.handle, description)
    end
    return self
end

---@param tooltip string
function class:tooltip(tooltip)
    if  not tooltip then
        return BlzGetItemTooltip(self.handle)
    else
        BlzSetItemTooltip(self.handle, tooltip)
    end
    return self
end

---@param extendedTooltip string
function class:extendedTooltip(extendedTooltip)
    if  not extendedTooltip then
        return BlzGetItemExtendedTooltip(self.handle)
    else
        BlzSetItemExtendedTooltip(self.handle, extendedTooltip)
    end
    return self
end

---@param iconPath string
function class:iconPath(iconPath)
    if  not iconPath then
        return BlzGetItemIconPath(self.handle)
    else
        BlzSetItemIconPath(self.handle, iconPath)
    end
    return self
end

---@param charges integer
function class:charges(charges)
    if  not charges then
        return GetItemCharges(self.handle)
    else
        SetItemCharges(self.handle, charges)
    end
    return self
end

---@param data integer
function class:userData(data)
    if  not data then
        return GetItemUserData(self.handle)
    else
        SetItemUserData(self.handle, data)
    end
    return self
end

---@param abilCode integer|string
function class:getAbility(abilCode)
    return ClassAbility:fromItem(self, abilCode)
end

---@param index integer
function class:getByIndexAbility(index)
    return ClassAbility:fromByIndexItem(self, index)
end

---@param abilCode integer|string
---@return boolean
function class:addAbility(abilCode)
    return BlzItemAddAbility(self.handle, FormatCC(abilCode))
end

---@param abilCode integer|string
---@return boolean
function class:removeAbility(abilCode)
    BlzItemRemoveAbility(self.handle, FormatCC(abilCode))
end

---@param whichField itembooleanfield
---@return boolean
function class:getBooleanField(whichField)
    return BlzGetItemBooleanField(self.handle, whichField)
end

---@param whichField itembooleanfield
---@param value boolean
---@return boolean
function class:setBooleanField(whichField, value)
    return BlzSetItemBooleanField(self.handle, whichField, value)
end

---@param whichField itembooleanfield
---@param value boolean|nil
---@return boolean
function class:booleanField(whichField, value)
    if  not value then
        return BlzGetItemBooleanField(self.handle, whichField)
    else
        return BlzSetItemBooleanField(self.handle, whichField, value)
    end
end

---@param whichField itemintegerfield
---@return integer
function class:getIntegerField(whichField)
    return BlzGetItemIntegerField(self.handle, whichField)
end

---@param whichField itemintegerfield
---@param value integer
---@return boolean
function class:setIntegerField(whichField, value)
    return BlzSetItemIntegerField(self.handle, whichField, value)
end

---@param whichField itemintegerfield
---@param value integer|nil
---@return boolean
function class:integerField(whichField, value)
    if  not value then
        return BlzGetItemIntegerField(self.handle, whichField)
    else
        return BlzSetItemIntegerField(self.handle, whichField, value)
    end
end

---@param whichField itemrealfield
---@return real
function class:getRealField(whichField)
    return BlzGetItemRealField(self.handle, whichField)
end

---@param whichField itemrealfield
---@param value real
---@return boolean
function class:setRealField(whichField, value)
    return BlzSetItemRealField(self.handle, whichField, value)
end

---@param whichField itemrealfield
---@param value real|nil
---@return boolean
function class:realField(whichField, value)
    if  not value then
        return BlzGetItemRealField(self.handle, whichField)
    else
        return BlzSetItemRealField(self.handle, whichField, value)
    end
end

---@param whichField itemstringfield
---@return boolean
function class:getStringField(whichField)
    return BlzGetItemStringField(self.handle, whichField)
end

---@param whichField itemstringfield
---@param value string
---@return boolean
function class:setStringField(whichField, value)
    return BlzSetItemStringField(self.handle, whichField, value)
end

---@param whichField itemstringfield
---@param value string|nil
---@return boolean
function class:stringField(whichField, value)
    if  not value then
        return BlzGetItemStringField(self.handle, whichField)
    else
        return BlzSetItemStringField(self.handle, whichField, value)
    end
end