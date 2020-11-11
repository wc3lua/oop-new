--============================================================================
-- Unit API

---@class Unit:Widget
ClassUnit = extendedClass(ClassWidget)

local class = ClassUnit

---@param unitHandle unit
---@return Unit
function class:new(unitHandle)
    self.handle = unitHandle
    return newObject(self)
end

-- Facing arguments are specified in degrees
---@param id Player
---@param unitid integer|string
---@param x real
---@param y real
---@param face real
function class:atCoordsCreate(id, unitid, x, y, face)
    return self:new(CreateUnit(id.handle, FormatCC(unitid), x, y, face))
end

---@param whichPlayer Player
---@param unitname string
---@param x real
---@param y real
---@param face real
function class:atCoordsByNameCreate(whichPlayer, unitname, x, y, face)
    return self:new(CreateUnitByName(whichPlayer.handle, unitname, x, y, face))
end

---@param id Player
---@param unitid integer|string
---@param whichLocation Location
---@param face real
function class:atLocCreate(id, unitid, whichLocation, face)
    return self:new(CreateUnitAtLoc(id.handle, FormatCC(unitid), whichLocation.handle, face))
end

---@param id Player
---@param unitname string
---@param whichLocation Location
---@param face real
function class:atLocByNameCreate(id, unitname, whichLocation, face)
    return self:new(CreateUnitAtLocByName(id.handle, unitname, whichLocation.handle, face))
end

---@param id Player
---@param unitid integer|string
---@param whichPoint Point
---@param face real
function class:atCoordsCreate(id, unitid, whichPoint, face)
    return self:atCoordsCreate(id, unitid, whichPoint:getX(), whichPoint:getY(), face)
end

---@param whichPlayer Player
---@param unitid integer|string
---@param x real
---@param y real
---@param face real
function class:corpseCreate(whichPlayer, unitid, x, y, face)
    return self:new(CreateCorpse(whichPlayer.handle, FormatCC(unitid), x, y, face))
end

---@param whichPlayer Player
---@param unitid integer|string
---@param loc Location
---@param face real
function class:corpseLocCreate(whichPlayer, unitid, loc, face)
    return self:corpseCreate(whichPlayer, unitid, loc:getX(), loc:getY(), face)
end

---@param whichPlayer Player
---@param unitid integer|string
---@param point Point
---@param face real
function class:corpsePointCreate(whichPlayer, unitid, point, face)
    return self:corpseCreate(whichPlayer, unitid, point:getX(), point:getY(), face)
end

function class:kill()
    KillUnit(self.handle)
    return self
end

function class:remove()
    RemoveUnit(self.handle)
    return self
end

---@param show boolean
function class:show(show)
    ShowUnit(self.handle, show)
end

---@param whichUnitState unitstate
---@param newVal real|nil
function class:state(whichUnitState, newVal)
    if  not newVal then
        return GetUnitState(self.handle, whichUnitState)
    else
        SetUnitState(self.handle, whichUnitState, newVal)
    end
    return self
end

---@param newX real
function class:x(newX)
    if  not newX then
        return GetUnitX(self.handle)
    else
        SetUnitX(self.handle, newX)
    end
    return self
end

---@param newY real
function class:y(newY)
    if not newY then
        return GetUnitY(self.handle)
    else
        SetUnitY(self.handle, newY)
    end
    return self
end

---@param newX real
---@param newY real
function class:setPosition(newX, newY)
    SetUnitPosition(self.handle, newX, newY)
    return self
end

---@param whichLocation Location
function class:setLocPosition(whichLocation)
    SetUnitPositionLoc(self.handle, whichLocation.handle)
    return self
end

---@param whichPoint Point
function class:setPointPosition(whichPoint)
    return self:setPosition(whichPoint:getX(), whichPoint:getY())
end

---@param facingAngle real
function class:facing(facingAngle)
    if  not facingAngle then
        return GetUnitFacing(self.handle)
    else
        SetUnitFacing(self.handle, facingAngle)
    end
    return self
end

---@param facingAngle real
---@param duration real
function class:timedFacing(facingAngle, duration)
    SetUnitFacingTimed(self.handle, facingAngle, duration)
    return self
end

---@param newSpeed real
function class:moveSpeed(newSpeed)
    if  not newSpeed then
        return GetUnitMoveSpeed(self.handle)
    else
        SetUnitMoveSpeed(self.handle, newSpeed)
    end
    return self
end

---@param newHeight real
---@param rate real
function class:flyHeight(newHeight, rate)
    if  not newHeight then
        return GetUnitFlyHeight(self.handle)
    else
        SetUnitFlyHeight(self.handle, newHeight, rate)
    end
    return self
end

---@param newTurnSpeed real
function class:turnSpeed(newTurnSpeed)
    if  not newTurnSpeed then
        return GetUnitTurnSpeed(self.handle)
    else
        SetUnitTurnSpeed(self.handle, newTurnSpeed)
    end
    return self
end

---@param newPropWindowAngle real
function class:propWindow(newPropWindowAngle)
    if  not newPropWindowAngle then
        return GetUnitPropWindow(self.handle)
    else
        SetUnitPropWindow(self.handle, newPropWindowAngle)
    end
    return self
end

---@param newAcquireRange real
function class:acquireRange(newAcquireRange)
    if  not newAcquireRange then
        return GetUnitAcquireRange(self.handle)
    else
        SetUnitAcquireRange(self.handle, newAcquireRange)
    end
    return self
end

---@return real
function class:getDefaultAcquireRange()
    return GetUnitDefaultAcquireRange(self.handle)
end

---@param creepGuard boolean
function class:setCreepGuard(creepGuard)
    SetUnitCreepGuard(self.handle, creepGuard)
    return self
end

---@return real
function class:getDefaultTurnSpeed()
    return GetUnitDefaultTurnSpeed(self.handle)
end

---@return real
function class:getDefaultPropWindow()
    return GetUnitDefaultPropWindow(self.handle)
end

---@return real
function class:getDefaultFlyHeight()
    return GetUnitDefaultFlyHeight(self.handle)
end

---@param whichPlayer Player
---@param changeColor boolean
function class:owner(whichPlayer, changeColor)
    if  not whichPlayer then
        return ClassPlayer:owner(self)
    else
        SetUnitOwner(self.handle, whichPlayer.handle, changeColor)
    end
    return self
end

---@param whichColor playercolor
function class:setColor(whichColor)
    SetUnitColor(self.handle, whichColor)
    return self
end

---@param scaleX real
---@param scaleY real
---@param scaleZ real
function class:setScale(scaleX, scaleY, scaleZ)
    SetUnitScale(self.handle, scaleX, scaleY, scaleZ)
    return self
end

---@param timeScale real
function class:setTimeScale(timeScale)
    SetUnitTimeScale(self.handle, timeScale)
    return self
end

---@param blendTime real
function class:setBlendTime(blendTime)
    SetUnitBlendTime(self.handle, blendTime)
    return self
end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function class:setVertexColor(red, green, blue, alpha)
    SetUnitVertexColor(self.handle, red, green, blue, alpha)
    return self
end

---@param whichAnimation string
function class:queueAnimation(whichAnimation)
    QueueUnitAnimation(self.handle, whichAnimation)
    return self
end

---@param whichAnimation string
function class:setAnimation(whichAnimation)
    SetUnitAnimation(self.handle, whichAnimation)
    return self
end

---@param whichAnimation integer
function class:setByIndexAnimation(whichAnimation)
    SetUnitAnimationByIndex(self.handle, whichAnimation)
    return self
end

---@param whichAnimation string
---@param rarity raritycontrol
function class:setWithRarityAnimation(whichAnimation, rarity)
    SetUnitAnimationWithRarity(self.handle, whichAnimation, rarity)
    return self
end

---@param animProperties string
---@param add boolean
function class:addAnimationProperties(animProperties, add)
    AddUnitAnimationProperties(self.handle, animProperties, add)
    return self
end

---@param whichBone string
---@param lookAtTarget Unit
---@param offsetX real
---@param offsetY real
---@param offsetZ real
function class:setLookAt(whichBone, lookAtTarget, offsetX, offsetY, offsetZ)
    SetUnitLookAt(self.handle, whichBone, lookAtTarget.handle, offsetX, offsetY, offsetZ)
    return self
end

function class:resetLookAt()
    ResetUnitLookAt(self.handle)
    return self
end

---@param byWhichPlayer Player
---@param flag boolean
function class:setRescuable(byWhichPlayer, flag)
    SetUnitRescuable(self.handle, byWhichPlayer.handle, flag)
    return self
end

---@param range real
function class:setRescueRange(range)
    SetUnitRescueRange(self.handle, range)
    return self
end

---@param permanent_OR_includeBonuses boolean
---@param heroStr integer|nil
function class:heroStr(permanent_OR_includeBonuses, newStr)
    if  not heroStr then
        return GetHeroStr(self.handle, permanent_OR_includeBonuses)
    else
        SetHeroStr(self.handle, newStr, permanent_OR_includeBonuses)
    end
    return self
end

---@param permanent_OR_includeBonuses boolean
---@param newAgi integer|nil
function class:heroAgi(permanent_OR_includeBonuses, newAgi)
    if  not newAgi then
        return GetHeroAgi(self.handle, permanent_OR_includeBonuses)
    else
        SetHeroAgi(self.handle, newAgi, permanent_OR_includeBonuses)
    end
    return self
end

---@param permanent_OR_includeBonuses boolean
---@param newInt integer|nil
function class:heroInt(permanent_OR_includeBonuses, newInt)
    if  not newInt then
        return GetHeroInt(self.handle, permanent_OR_includeBonuses)
    else
        SetHeroInt(self.handle, newInt, permanent_OR_includeBonuses)
    end
    return self
end

---@param howManyLevels integer
---@return boolean
function class:stripHeroLevel(howManyLevels)
    return UnitStripHeroLevel(self.handle, howManyLevels)
end

---@param newXpVal integer|nil
---@param showEyeCandy boolean
function class:heroXP(newXpVal, showEyeCandy)
    if  not newXpVal then
        return GetHeroXP(self.handle)
    else
        SetHeroXP(self.handle, newXpVal, showEyeCandy)
    end
    return self
end

---@return integer
function class:getHeroSkillPoints()
    return GetHeroSkillPoints(self.handle)
end

---@param skillPointDelta integer
---@return boolean
function class:modifySkillPoints(skillPointDelta)
    UnitModifySkillPoints(self.handle, skillPointDelta)
    return self
end

---@param xpToAdd integer
---@param showEyeCandy boolean
function class:addHeroXP(xpToAdd, showEyeCandy)
    AddHeroXP(self.handle, xpToAdd, showEyeCandy)
    return self
end

---@param level integer|nil
---@param showEyeCandy boolean
function class:heroLevel(level, showEyeCandy)
    if  not level then
        return GetHeroLevel(self.handle)
    else
        SetHeroLevel(self.handle, level, showEyeCandy)
    end
    return self
end

---@return integer
function class:getLevel()
    return GetUnitLevel(self.handle)
end

---@param heroProperName string|nil
function class:heroProperName(heroProperName)
    if  not heroProperName then
        return GetHeroProperName(self.handle)
    else
        BlzSetHeroProperName(self.handle, heroProperName)
    end
    return self
end

---@param flag boolean
function class:suspendXP(flag)
    SuspendHeroXP(self.handle, flag)
    return self
end

---@return boolean
function class:isSuspendedXP()
    return IsSuspendedXP(self.handle)
end

---@param abilcode integer|string
function class:selectHeroSkill(abilcode)
    SelectHeroSkill(self.handle, FormatCC(abilcode))
    return self
end

---@param abilcode integer|string
---@param level integer|nil
function class:abilityLevel(abilcode, level)
    abilcode = FormatCC(abilcode)
    if  not level then
        return GetUnitAbilityLevel(self.handle, abilcode)
    else
        SetUnitAbilityLevel(self.handle, abilcode, level)
    end
    return self
end

---@param abilcode integer|nil
---@return integer
function class:decAbilityLevel(abilcode)
    return DecUnitAbilityLevel(self.handle, FormatCC(abilcode))
end

---@param abilcode integer|nil
---@return integer
function class:incAbilityLevel(abilcode)
    return IncUnitAbilityLevel(self.handle, FormatCC(abilcode))
end

---@param x real
---@param y real
---@param doEyecandy boolean
---@return boolean
function class:reviveHero(x, y, doEyecandy)
    return ReviveHero(self.handle, x, y, doEyecandy)
end

---@param p Point
---@param doEyecandy boolean
---@return boolean
function class:revivePointHero(p, doEyecandy)
    return self:reviveHero(p:getX(), p:getY(), doEyecandy)
end

---@param loc Location
---@param doEyecandy boolean
---@return boolean
function class:reviveLocHero(loc, doEyecandy)
    return ReviveHeroLoc(self.handle, loc.handle, doEyecandy)
end

---@param exploded boolean
function class:setExploded(exploded)
    SetUnitExploded(self.handle, exploded)
    return self
end

---@param flag boolean
function class:setInvulnerable(flag)
    SetUnitInvulnerable(self.handle, flag)
    return self
end

---@param flag boolean
function class:pause(flag)
    PauseUnit(self.handle, flag)
    return self
end

---@return boolean
function class:isPaused()
    return IsUnitPaused(self.handle)
end

---@param flag boolean
function class:setPathing(flag)
    SetUnitPathing(self.handle, flag)
    return self
end

local _ClearSelection = ClearSelection
function ClearSelection()
    _ClearSelection()
end
function class:clearSelection()
    ClearSelection()
end

---@param flag boolean
function class:select(flag)
    SelectUnit(self.handle, flag)
    return self
end

---@return integer
function class:getPointValue()
    return GetUnitPointValue(self.handle)
end

---@param unitType integer
---@return integer
function class:getByTypePointValue(unitType)
    return GetUnitPointValueByType(unitType)
end


--        function SetUnitPointValueByType(unitType, newPointValue)

---@param whichItem Item
---@return boolean
function class:addItem(whichItem)
    return UnitAddItem(self.handle, whichItem.handle)
end

---@param whichUnit unit
---@param whichItem item
---@return boolean
function UnitAddItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param itemId integer
---@return item
function UnitAddItemById(whichUnit, itemId) end

---@param whichUnit unit
---@param itemId integer
---@param itemSlot integer
---@return boolean
function UnitAddItemToSlotById(whichUnit, itemId, itemSlot) end

---@param whichUnit unit
---@param whichItem item
function UnitRemoveItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param itemSlot integer
---@return item
function UnitRemoveItemFromSlot(whichUnit, itemSlot) end

---@param whichUnit unit
---@param whichItem item
---@return boolean
function UnitHasItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param itemSlot integer
---@return item
function UnitItemInSlot(whichUnit, itemSlot) end

---@param whichUnit unit
---@return integer
function UnitInventorySize(whichUnit) end


---@param whichUnit unit
---@param whichItem item
---@param x real
---@param y real
---@return boolean
function UnitDropItemPoint(whichUnit, whichItem, x, y) end

---@param whichUnit unit
---@param whichItem item
---@param slot integer
---@return boolean
function UnitDropItemSlot(whichUnit, whichItem, slot) end

---@param whichUnit unit
---@param whichItem item
---@param target widget
---@return boolean
function UnitDropItemTarget(whichUnit, whichItem, target) end


---@param whichUnit unit
---@param whichItem item
---@return boolean
function UnitUseItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param whichItem item
---@param x real
---@param y real
---@return boolean
function UnitUseItemPoint(whichUnit, whichItem, x, y) end

---@param whichUnit unit
---@param whichItem item
---@param target widget
---@return boolean
function UnitUseItemTarget(whichUnit, whichItem, target) end


---@param whichUnit unit
---@return real
function GetUnitX(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitY(whichUnit) end

---@param whichUnit unit
---@return location
function GetUnitLoc(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitFacing(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitMoveSpeed(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitDefaultMoveSpeed(whichUnit) end

---@param whichUnit unit
---@param whichUnitState unitstate
---@return real
function GetUnitState(whichUnit, whichUnitState) end

---@param whichUnit unit
---@return player
function GetOwningPlayer(whichUnit) end

---@param whichUnit unit
---@return integer
function GetUnitTypeId(whichUnit) end

---@param whichUnit unit
---@return race
function GetUnitRace(whichUnit) end

---@param whichUnit unit
---@return string
function GetUnitName(whichUnit) end

---@param whichUnit unit
---@return integer
function GetUnitFoodUsed(whichUnit) end

---@param whichUnit unit
---@return integer
function GetUnitFoodMade(whichUnit) end

---@param unitId integer
---@return integer
function GetFoodMade(unitId) end

---@param unitId integer
---@return integer
function GetFoodUsed(unitId) end

---@param whichUnit unit
---@param useFood boolean
function SetUnitUseFood(whichUnit, useFood) end


---@param whichUnit unit
---@return location
function GetUnitRallyPoint(whichUnit) end

---@param whichUnit unit
---@return unit
function GetUnitRallyUnit(whichUnit) end

---@param whichUnit unit
---@return destructable
function GetUnitRallyDestructable(whichUnit) end


---@param whichUnit unit
---@param whichGroup group
---@return boolean
function IsUnitInGroup(whichUnit, whichGroup) end

---@param whichUnit unit
---@param whichForce force
---@return boolean
function IsUnitInForce(whichUnit, whichForce) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitOwnedByPlayer(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitAlly(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitEnemy(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitVisible(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitDetected(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitInvisible(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitFogged(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitMasked(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitSelected(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichRace race
---@return boolean
function IsUnitRace(whichUnit, whichRace) end

---@param whichUnit unit
---@param whichUnitType unittype
---@return boolean
function IsUnitType(whichUnit, whichUnitType) end

---@param whichUnit unit
---@param whichSpecifiedUnit unit
---@return boolean
function IsUnit(whichUnit, whichSpecifiedUnit) end

---@param whichUnit unit
---@param otherUnit unit
---@param distance real
---@return boolean
function IsUnitInRange(whichUnit, otherUnit, distance) end

---@param whichUnit unit
---@param x real
---@param y real
---@param distance real
---@return boolean
function IsUnitInRangeXY(whichUnit, x, y, distance) end

---@param whichUnit unit
---@param whichLocation location
---@param distance real
---@return boolean
function IsUnitInRangeLoc(whichUnit, whichLocation, distance) end

---@param whichUnit unit
---@return boolean
function IsUnitHidden(whichUnit) end

---@param whichUnit unit
---@return boolean
function IsUnitIllusion(whichUnit) end


---@param whichUnit unit
---@param whichTransport unit
---@return boolean
function IsUnitInTransport(whichUnit, whichTransport) end

---@param whichUnit unit
---@return boolean
function IsUnitLoaded(whichUnit) end


---@param unitId integer
---@return boolean
function IsHeroUnitId(unitId) end

---@param unitId integer
---@param whichUnitType unittype
---@return boolean
function IsUnitIdType(unitId, whichUnitType) end


---@param whichUnit unit
---@param whichPlayer player
---@param share boolean
function UnitShareVision(whichUnit, whichPlayer, share) end

---@param whichUnit unit
---@param suspend boolean
function UnitSuspendDecay(whichUnit, suspend) end

---@param whichUnit unit
---@param whichUnitType unittype
---@return boolean
function UnitAddType(whichUnit, whichUnitType) end

---@param whichUnit unit
---@param whichUnitType unittype
---@return boolean
function UnitRemoveType(whichUnit, whichUnitType) end


---@param whichUnit unit
---@param abilityId integer
---@return boolean
function UnitAddAbility(whichUnit, abilityId) end

---@param whichUnit unit
---@param abilityId integer
---@return boolean
function UnitRemoveAbility(whichUnit, abilityId) end

---@param whichUnit unit
---@param permanent boolean
---@param abilityId integer
---@return boolean
function UnitMakeAbilityPermanent(whichUnit, permanent, abilityId) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
function UnitRemoveBuffs(whichUnit, removePositive, removeNegative) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
function UnitRemoveBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
---@return boolean
function UnitHasBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
---@return integer
function UnitCountBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end

---@param whichUnit unit
---@param add boolean
function UnitAddSleep(whichUnit, add) end

---@param whichUnit unit
---@return boolean
function UnitCanSleep(whichUnit) end

---@param whichUnit unit
---@param add boolean
function UnitAddSleepPerm(whichUnit, add) end

---@param whichUnit unit
---@return boolean
function UnitCanSleepPerm(whichUnit) end

---@param whichUnit unit
---@return boolean
function UnitIsSleeping(whichUnit) end

---@param whichUnit unit
function UnitWakeUp(whichUnit) end

---@param whichUnit unit
---@param buffId integer
---@param duration real
function UnitApplyTimedLife(whichUnit, buffId, duration) end

---@param whichUnit unit
---@param flag boolean
---@return boolean
function UnitIgnoreAlarm(whichUnit, flag) end

---@param whichUnit unit
---@return boolean
function UnitIgnoreAlarmToggled(whichUnit) end

---@param whichUnit unit
function UnitResetCooldown(whichUnit) end

---@param whichUnit unit
---@param constructionPercentage integer
function UnitSetConstructionProgress(whichUnit, constructionPercentage) end

---@param whichUnit unit
---@param upgradePercentage integer
function UnitSetUpgradeProgress(whichUnit, upgradePercentage) end

---@param whichUnit unit
---@param flag boolean
function UnitPauseTimedLife(whichUnit, flag) end

---@param whichUnit unit
---@param flag boolean
function UnitSetUsesAltIcon(whichUnit, flag) end


---@param whichUnit unit
---@param delay real
---@param radius real
---@param x real
---@param y real
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function UnitDamagePoint(whichUnit, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType) end

---@param whichUnit unit
---@param target widget
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function UnitDamageTarget(whichUnit, target, amount, attack, ranged, attackType, damageType, weaponType) end


---@param whichUnit unit
---@param order string
---@return boolean
function IssueImmediateOrder(whichUnit, order) end

---@param whichUnit unit
---@param order integer
---@return boolean
function IssueImmediateOrderById(whichUnit, order) end

---@param whichUnit unit
---@param order string
---@param x real
---@param y real
---@return boolean
function IssuePointOrder(whichUnit, order, x, y) end

---@param whichUnit unit
---@param order string
---@param whichLocation location
---@return boolean
function IssuePointOrderLoc(whichUnit, order, whichLocation) end

---@param whichUnit unit
---@param order integer
---@param x real
---@param y real
---@return boolean
function IssuePointOrderById(whichUnit, order, x, y) end

---@param whichUnit unit
---@param order integer
---@param whichLocation location
---@return boolean
function IssuePointOrderByIdLoc(whichUnit, order, whichLocation) end

---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@return boolean
function IssueTargetOrder(whichUnit, order, targetWidget) end

---@param whichUnit unit
---@param order integer
---@param targetWidget widget
---@return boolean
function IssueTargetOrderById(whichUnit, order, targetWidget) end

---@param whichUnit unit
---@param order string
---@param x real
---@param y real
---@param instantTargetWidget widget
---@return boolean
function IssueInstantPointOrder(whichUnit, order, x, y, instantTargetWidget) end

---@param whichUnit unit
---@param order integer
---@param x real
---@param y real
---@param instantTargetWidget widget
---@return boolean
function IssueInstantPointOrderById(whichUnit, order, x, y, instantTargetWidget) end

---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@param instantTargetWidget widget
---@return boolean
function IssueInstantTargetOrder(whichUnit, order, targetWidget, instantTargetWidget) end

---@param whichUnit unit
---@param order integer
---@param targetWidget widget
---@param instantTargetWidget widget
---@return boolean
function IssueInstantTargetOrderById(whichUnit, order, targetWidget, instantTargetWidget) end

---@param whichPeon unit
---@param unitToBuild string
---@param x real
---@param y real
---@return boolean
function IssueBuildOrder(whichPeon, unitToBuild, x, y) end

---@param whichPeon unit
---@param unitId integer
---@param x real
---@param y real
---@return boolean
function IssueBuildOrderById(whichPeon, unitId, x, y) end


---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitToBuild string
---@return boolean
function IssueNeutralImmediateOrder(forWhichPlayer, neutralStructure, unitToBuild) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@return boolean
function IssueNeutralImmediateOrderById(forWhichPlayer,neutralStructure, unitId) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitToBuild string
---@param x real
---@param y real
---@return boolean
function IssueNeutralPointOrder(forWhichPlayer,neutralStructure, unitToBuild, x, y) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@param x real
---@param y real
---@return boolean
function IssueNeutralPointOrderById(forWhichPlayer,neutralStructure, unitId, x, y) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitToBuild string
---@param target widget
---@return boolean
function IssueNeutralTargetOrder(forWhichPlayer,neutralStructure, unitToBuild, target) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@param target widget
---@return boolean
function IssueNeutralTargetOrderById(forWhichPlayer,neutralStructure, unitId, target) end


---@param whichUnit unit
---@return integer
function GetUnitCurrentOrder(whichUnit) end


---@param whichUnit unit
---@param amount integer
function SetResourceAmount(whichUnit, amount) end

---@param whichUnit unit
---@param amount integer
function AddResourceAmount(whichUnit, amount) end

---@param whichUnit unit
---@return integer
function GetResourceAmount(whichUnit) end


---@param waygate unit
---@return real
function WaygateGetDestinationX(waygate) end

---@param waygate unit
---@return real
function WaygateGetDestinationY(waygate) end

---@param waygate unit
---@param x real
---@param y real
function WaygateSetDestination(waygate, x, y) end

---@param waygate unit
---@param activate boolean
function WaygateActivate(waygate, activate) end

---@param waygate unit
---@return boolean
function WaygateIsActive(waygate) end


---@param itemId integer
---@param currentStock integer
---@param stockMax integer
function AddItemToAllStock(itemId, currentStock, stockMax) end

---@param whichUnit unit
---@param itemId integer
---@param currentStock integer
---@param stockMax integer
function AddItemToStock(whichUnit, itemId, currentStock, stockMax) end

---@param unitId integer
---@param currentStock integer
---@param stockMax integer
function AddUnitToAllStock(unitId, currentStock, stockMax) end

---@param whichUnit unit
---@param unitId integer
---@param currentStock integer
---@param stockMax integer
function AddUnitToStock(whichUnit, unitId, currentStock, stockMax) end


---@param itemId integer
function RemoveItemFromAllStock(itemId) end

---@param whichUnit unit
---@param itemId integer
function RemoveItemFromStock(whichUnit, itemId) end

---@param unitId integer
function RemoveUnitFromAllStock(unitId) end

---@param whichUnit unit
---@param unitId integer
function RemoveUnitFromStock(whichUnit, unitId) end


---@param slots integer
function SetAllItemTypeSlots(slots) end

---@param slots integer
function SetAllUnitTypeSlots(slots) end

---@param whichUnit unit
---@param slots integer
function SetItemTypeSlots(whichUnit, slots) end

---@param whichUnit unit
---@param slots integer
function SetUnitTypeSlots(whichUnit, slots) end


---@param whichUnit unit
---@return integer
function GetUnitUserData(whichUnit) end

---@param whichUnit unit
---@param data integer
function SetUnitUserData(whichUnit, data) end

---@param whichUnit unit
---@return integer
function BlzGetUnitMaxHP(whichUnit) end

---@param whichUnit unit
---@param hp integer
function BlzSetUnitMaxHP(whichUnit, hp) end

---@param whichUnit unit
---@return integer
function BlzGetUnitMaxMana(whichUnit) end

---@param whichUnit unit
---@param mana integer
function BlzSetUnitMaxMana(whichUnit, mana) end



---@param whichUnit unit
---@param name string
function BlzSetUnitName(whichUnit, name) end

---@param whichUnit unit
---@param weaponIndex integer
---@return integer
function BlzGetUnitBaseDamage(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param baseDamage integer
---@param weaponIndex integer
function BlzSetUnitBaseDamage(whichUnit, baseDamage, weaponIndex) end

---@param whichUnit unit
---@param weaponIndex integer
---@return integer
function BlzGetUnitDiceNumber(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param diceNumber integer
---@param weaponIndex integer
function BlzSetUnitDiceNumber(whichUnit, diceNumber, weaponIndex) end

---@param whichUnit unit
---@param weaponIndex integer
---@return integer
function BlzGetUnitDiceSides(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param diceSides integer
---@param weaponIndex integer
function BlzSetUnitDiceSides(whichUnit, diceSides, weaponIndex) end

---@param whichUnit unit
---@param weaponIndex integer
---@return real
function BlzGetUnitAttackCooldown(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param cooldown real
---@param weaponIndex integer
function BlzSetUnitAttackCooldown(whichUnit, cooldown, weaponIndex) end

---@param whichUnit unit
---@return real
function BlzGetUnitArmor(whichUnit) end

---@param whichUnit unit
---@param armorAmount real
function BlzSetUnitArmor(whichUnit, armorAmount) end

---@param whichUnit unit
---@param abilId integer
---@param flag boolean
function BlzUnitHideAbility(whichUnit, abilId, flag) end

---@param whichUnit unit
---@param abilId integer
---@param flag boolean
---@param hideUI boolean
function BlzUnitDisableAbility(whichUnit, abilId, flag, hideUI) end

---@param whichUnit unit
function BlzUnitCancelTimedLife(whichUnit) end

---@param whichUnit unit
---@return boolean
function BlzIsUnitSelectable(whichUnit) end

---@param whichUnit unit
---@return boolean
function BlzIsUnitInvulnerable(whichUnit) end

---@param whichUnit unit
function BlzUnitInterruptAttack(whichUnit) end

---@param whichUnit unit
---@return real
function BlzGetUnitCollisionSize(whichUnit) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@param cooldown real
function BlzSetUnitAbilityCooldown(whichUnit, abilId, level, cooldown) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@return real
function BlzGetUnitAbilityCooldown(whichUnit, abilId, level) end

---@param whichUnit unit
---@param abilId integer
---@return real
function BlzGetUnitAbilityCooldownRemaining(whichUnit, abilId) end

---@param whichUnit unit
---@param abilCode integer
function BlzEndUnitAbilityCooldown(whichUnit, abilCode) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@return integer
function BlzGetUnitAbilityManaCost(whichUnit, abilId, level) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@param manaCost integer
function BlzSetUnitAbilityManaCost(whichUnit, abilId, level, manaCost) end

---@param whichUnit unit
---@return real
function BlzGetLocalUnitZ(whichUnit) end

-- Add this function to follow the style of GetUnitX and GetUnitY, it has the same result as BlzGetLocalUnitZ
---@param whichUnit unit
---@return real
function BlzGetUnitZ(whichUnit) end

---@param whichUnit unit
---@param abilId integer
---@return ability
function BlzGetUnitAbility(whichUnit, abilId) end

---@param whichUnit unit
---@param index integer
---@return ability
function BlzGetUnitAbilityByIndex(whichUnit, index) end

---@param whichUnit unit
---@param flag boolean
function BlzPauseUnitEx(whichUnit, flag) end

-- Unit
---@param whichUnit unit
---@param whichField unitbooleanfield
---@return boolean
function BlzGetUnitBooleanField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitintegerfield
---@return integer
function BlzGetUnitIntegerField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitrealfield
---@return real
function BlzGetUnitRealField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitstringfield
---@return string
function BlzGetUnitStringField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitbooleanfield
---@param value boolean
---@return boolean
function BlzSetUnitBooleanField(whichUnit, whichField, value) end

---@param whichUnit unit
---@param whichField unitintegerfield
---@param value integer
---@return boolean
function BlzSetUnitIntegerField(whichUnit, whichField, value) end

---@param whichUnit unit
---@param whichField unitrealfield
---@param value real
---@return boolean
function BlzSetUnitRealField(whichUnit, whichField, value) end

---@param whichUnit unit
---@param whichField unitstringfield
---@param value string
---@return boolean
function BlzSetUnitStringField(whichUnit, whichField, value) end


-- Unit Weapon
---@param whichUnit unit
---@param whichField unitweaponbooleanfield
---@param index integer
---@return boolean
function BlzGetUnitWeaponBooleanField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponintegerfield
---@param index integer
---@return integer
function BlzGetUnitWeaponIntegerField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponrealfield
---@param index integer
---@return real
function BlzGetUnitWeaponRealField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponstringfield
---@param index integer
---@return string
function BlzGetUnitWeaponStringField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponbooleanfield
---@param index integer
---@param value boolean
---@return boolean
function BlzSetUnitWeaponBooleanField(whichUnit, whichField, index, value) end

---@param whichUnit unit
---@param whichField unitweaponintegerfield
---@param index integer
---@param value integer
---@return boolean
function BlzSetUnitWeaponIntegerField(whichUnit, whichField, index, value) end

---@param whichUnit unit
---@param whichField unitweaponrealfield
---@param index integer
---@param value real
---@return boolean
function BlzSetUnitWeaponRealField(whichUnit, whichField, index, value) end

---@param whichUnit unit
---@param whichField unitweaponstringfield
---@param index integer
---@param value string
---@return boolean
function BlzSetUnitWeaponStringField(whichUnit, whichField, index, value) end