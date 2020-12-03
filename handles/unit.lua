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
    return self:new(CreateUnit(id.handle, formatCC(unitid), x, y, face))
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
    return self:new(CreateUnitAtLoc(id.handle, formatCC(unitid), whichLocation.handle, face))
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
    return self:new(CreateCorpse(whichPlayer.handle, formatCC(unitid), x, y, face))
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
    SelectHeroSkill(self.handle, formatCC(abilcode))
    return self
end

---@param abilcode integer|string
---@param level integer|nil
function class:abilityLevel(abilcode, level)
    abilcode = formatCC(abilcode)
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
    return DecUnitAbilityLevel(self.handle, formatCC(abilcode))
end

---@param abilcode integer|nil
---@return integer
function class:incAbilityLevel(abilcode)
    return IncUnitAbilityLevel(self.handle, formatCC(abilcode))
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

---@param itemId integer|string
---@return item
function class:addByIdItem(itemId)
    return ClassItem:new(UnitAddItemById(self.handle, formatCC(itemId)))
end

---@param itemId integer|string
---@param itemSlot integer
---@return boolean
function class:addToSlotByIdItem(itemId, itemSlot)
    return UnitAddItemToSlotById(self.handle, formatCC(itemId), itemSlot)
end

---@param whichItem Item
function class:removeItem(whichItem)
    UnitRemoveItem(self.handle, whichItem.handle)
    return self
end

---@param itemSlot integer
function class:removeFromSlotItem(itemSlot)
    return ClassItem:new(UnitRemoveItemFromSlot(self.handle, itemSlot))
end

---@param whichItem Item
---@return boolean
function class:hasItem(whichItem)
    return UnitHasItem(self.handle, whichItem.handle)
end

---@param itemSlot integer
function class:itemInSlot(itemSlot)
    return ClassItem:new(UnitItemInSlot(self.handle, itemSlot))
end

---@return integer
function class:inventorySize()
    return UnitInventorySize(self.handle)
end

---@param whichItem Item
---@param x real
---@param y real
---@return boolean
function class:dropItemCoords(whichItem, x, y)
    return UnitDropItemPoint(self.handle, whichItem.handle, x, y)
end

---@param whichItem Item
---@param point Point
---@return boolean
function class:dropItemPoint(whichItem, point)
    return self:dropItemCoords(whichItem, point:getX(), point:getY())
end

---@param whichItem Item
---@param loc Location
---@return boolean
function class:dropItemLoc(whichItem, loc)
    return self:dropItemCoords(whichItem, loc:getX(), loc:getY())
end

---@param whichItem Item
---@param slot integer
---@return boolean
function class:dropItemSlot(whichItem, slot)
    UnitDropItemSlot(self.handle, whichItem.handle, slot)
end

---@param whichItem Item
---@param target Widget
---@return boolean
function class:dropItemTarget(whichItem, target)
    UnitDropItemTarget(self.handle, whichItem.handle, target.handle)
end

---@param whichItem Item
---@return boolean
function class:useItem(whichItem)
    return UnitUseItem(self.handle, whichItem.handle)
end

---@param whichItem Item
---@param x real
---@param y real
---@return boolean
function class:useCoordsItem(whichItem, x, y)
    return UnitUseItemPoint(self.handle, whichItem.handle, x, y)
end

---@param whichItem Item
---@param p Point
---@return boolean
function class:usePointItem(whichItem, p)
    return self:useCoordsItem(whichItem, p:getX(), p:getY())
end

---@param whichItem Item
---@param loc Location
---@return boolean
function class:useLocItem(whichItem, loc)
    return self:useCoordsItem(whichItem, loc:getX(), loc:getY())
end

---@param whichItem Item
---@param target Widget
---@return boolean
function class:useTargetItem(whichItem, target)
    return UnitUseItemTarget(self.handle, whichItem.handle, target.handle)
end

---@return real
function class:getX()
    return GetUnitX(self.handle)
end

---@return real
function class:getY()
    return GetUnitY(self.handle)
end

function class:getLoc()
    return ClassLocation:new(GetUnitLoc(self.handle))
end

---@return real
function class:getFacing()
    return GetUnitFacing(self.handle)
end

---@return real
function class:getMoveSpeed()
    return GetUnitMoveSpeed(self.handle)
end

---@return real
function class:getDefaultMoveSpeed()
    return GetUnitDefaultMoveSpeed(self.handle)
end

---@param whichUnitState unitstate
---@return real
function class:getState(whichUnitState)
    return GetUnitState(self.handle, whichUnitState)
end

function class:owner()
    return ClassPlayer:owner(self.handle)
end

---@return integer
function class:getTypeId()
    return GetUnitTypeId(self.handle)
end

---@return race
function class:getRace()
    return GetUnitRace(self.handle)
end

---@return string
function class:getName()
    return GetUnitName(self.handle)
end

---@return integer
function class:getFoodUsed()
    return GetUnitFoodUsed(self.handle)
end

---@return integer
function class:getFoodMade()
    return GetUnitFoodMade(self.handle)
end

---@param unitId integer|string
---@return integer
function class:getFoodMade(unitId)
    return GetFoodMade(formatCC(unitId))
end

---@param unitId integer|string
---@return integer
function class:getFoodUsed(unitId)
    return GetFoodUsed(formatCC(unitId))
end

---@param useFood boolean
function class:setUseFood(useFood)
    SetUnitUseFood(self.handle, useFood)
end

function class:getRallyPoint()
    return ClassLocation:new(GetUnitRallyPoint(self.handle))
end

function class:getRallyUnit()
    return class:new(GetUnitRallyUnit(self.handle))
end

function class:getRallyDestructable()
    return ClassDestructable:new(GetUnitRallyDestructable(self.handle))
end

---@param whichGroup Group
---@return boolean
function class:isInGroup(whichGroup)
    return IsUnitInGroup(self.handle, whichGroup.handle)
end

---@param whichForce Force
---@return boolean
function class:isInForce(whichForce)
    return IsUnitInForce(self.handle, whichForce.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isOwnedByPlayer(whichPlayer)
    return IsUnitOwnedByPlayer(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isAlly(whichPlayer)
    return IsUnitAlly(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isEnemy(whichPlayer)
    return IsUnitEnemy(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isVisible(whichPlayer)
    return IsUnitVisible(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isDetected(whichPlayer)
    return IsUnitDetected(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isInvisible(whichPlayer)
    return IsUnitInvisible(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isFogged(whichPlayer)
    return IsUnitFogged(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isMasked(whichPlayer)
    return IsUnitMasked(self.handle, whichPlayer.handle)
end

---@param whichPlayer Player
---@return boolean
function class:isSelected(whichPlayer)
    return IsUnitSelected(self.handle, whichPlayer.handle)
end

---@param whichRace race
---@return boolean
function class:isRace(whichRace)
    return IsUnitRace(self.handle, whichRace)
end

---@param whichUnitType unittype
---@return boolean
function class:isType(whichUnitType)
    return IsUnitType(self.handle, whichUnitType)
end

---@param whichSpecifiedUnit Unit
---@return boolean
function class:is(whichSpecifiedUnit)
    return IsUnit(self.handle, whichSpecifiedUnit.handle)
end

---@param otherUnit Unit
---@param distance real
---@return boolean
function class:isInRangeOfUnit(otherUnit, distance)
    return IsUnitInRange(self.handle, otherUnit.handle, distance)
end

---@param x real
---@param y real
---@param distance real
---@return boolean
function class:isInRangeOfCoords(x, y, distance)
    return IsUnitInRangeXY(self.handle, x, y, distance)
end

---@param p Point
---@param distance real
---@return boolean
function class:isInRangeOfPoint(p, distance)
    return self:isInRangeOfCoords(p:getX(), p:getY(), distance)
end

---@param whichLocation Location
---@param distance real
---@return boolean
function class:isInRangeOfLoc(whichLocation, distance)
    return IsUnitInRangeLoc(self.handle, whichLocation.handle, distance)
end

---@return boolean
function class:isHidden()
    return IsUnitHidden(self.handle)
end

---@return boolean
function class:isIllusion()
    return IsUnitIllusion(self.handle)
end

---@param whichTransport Unit
---@return boolean
function class:isInTransport(whichTransport)
    return IsUnitInTransport(self.handle, whichTransport.handle)
end

---@return boolean
function class:isLoaded()
    return IsUnitLoaded(self.handle)
end

---@param unitId integer|string
---@return boolean
function class:isHeroId(unitId)
    return IsHeroUnitId(formatCC(unitId))
end

---@param unitId integer|string
---@param whichUnitType unittype
---@return boolean
function class:isIdType(unitId, whichUnitType)
    return IsUnitIdType(formatCC(unitId), whichUnitType)
end

---@param whichPlayer Player
---@param share boolean
function class:shareVision(whichPlayer, share)
    UnitShareVision(self.handle, whichPlayer.handle, share)
    return self
end

---@param suspend boolean
function class:suspendDecay(suspend)
    UnitSuspendDecay(self.handle, suspend)
    return self
end

---@param whichUnitType unittype
---@return boolean
function class:addType(whichUnitType)
    return UnitAddType(self.handle, whichUnitType)
end

---@param whichUnitType unittype
---@return boolean
function class:removeType(whichUnitType)
    return UnitRemoveType(self.handle, whichUnitType)
end

---@param abilityId integer|string
---@return boolean
function class:addAbility(abilityId)
    return UnitAddAbility(self.handle, formatCC(abilityId))
end

---@param abilityId integer|string
---@return boolean
function class:removeAbility(abilityId)
    return UnitRemoveAbility(self.handle, formatCC(abilityId))
end

---@param abilityId integer|string
---@param permanent boolean
---@return boolean
function class:makeAbilityPermanent(abilityId, permanent)
    return UnitMakeAbilityPermanent(self.handle, permanent, formatCC(abilityId))
end

---@param removePositive boolean
---@param removeNegative boolean
function class:removeBuffs(removePositive, removeNegative)
    UnitRemoveBuffs(self.handle, removePositive, removeNegative)
    return self
end

---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
function class:removeExBuffs(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    UnitRemoveBuffsEx(self.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return self
end

---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
---@return boolean
function class:hasBuffsEx(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return UnitHasBuffsEx(self.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
end

---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
---@return integer
function class:countBuffsEx(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return UnitCountBuffsEx(self.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
end

---@param add boolean
function class:addSleep(add)
    UnitAddSleep(self.handle, add)
    return self
end

---@return boolean
function class:canSleep()
    return UnitCanSleep(self.handle)
end

---@param add boolean
function class:addPermSleep(add)
    UnitAddSleepPerm(self.handle, add)
    return self
end

---@return boolean
function class:canPermSleep()
    return UnitCanSleepPerm(self.handle)
end

---@return boolean
function class:isSleeping()
    return UnitIsSleeping(self.handle)
end

function class:wakeUp()
    UnitWakeUp(self.handle)
    return self
end

---@param buffId integer|string
---@param duration real
function class:applyTimedLife(buffId, duration)
    UnitApplyTimedLife(self.handle, formatCC(buffId), duration)
    return self
end

---@param flag boolean
---@return boolean
function class:ignoreAlarm(flag)
    return UnitIgnoreAlarm(self.handle, flag)
end

---@return boolean
function class:ignoreToggledAlarm()
    return UnitIgnoreAlarmToggled(self.handle)
end

function class:resetCooldown()
    UnitResetCooldown(self.handle)
    return self
end

---@param constructionPercentage integer
function class:setConstructionProgress(constructionPercentage)
    UnitSetConstructionProgress(self.handle, constructionPercentage)
    return self
end

---@param upgradePercentage integer
function class:setUpgradeProgress(upgradePercentage)
    UnitSetUpgradeProgress(self.handle, upgradePercentage)
    return self
end

---@param flag boolean
function class:pauseTimedLife(flag)
    UnitPauseTimedLife(self.handle, flag)
    return self
end

---@param flag boolean
function class:setUsesAltIcon(flag)
    UnitSetUsesAltIcon(self.handle, flag)
    return self
end

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
function class:damageCoords(x, y, delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
    return UnitDamagePoint(self.handle, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType)
end

---@param p Point
---@param delay real
---@param radius real
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function class:damagePoint(p, delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
    return self:damageCoords(p:getX(), p:getY(), delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
end

---@param loc Location
---@param delay real
---@param radius real
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function class:damageLoc(loc, delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
    return self:damageCoords(loc:getX(), loc:getY(), delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
end

---@param target Widget
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function class:damageTarget(target, amount, attack, ranged, attackType, damageType, weaponType)
    return UnitDamageTarget(self.handle, target.handle, amount, attack, ranged, attackType, damageType, weaponType)
end

---@param order integer|string
---@return boolean
function class:issueImmediateOrder(order)
    return IssueImmediateOrder(self.handle, formatStringOrder(order))
end

---@param order integer|string
---@return boolean
function class:issueImmediateByIdOrder(order)
    return IssueImmediateOrderById(self.handle, formatIntOrder(order))
end

---@param order integer|string
---@param x real
---@param y real
---@return boolean
function class:issueCoordsOrder(order, x, y)
    return IssuePointOrder(self.handle, formatStringOrder(order), x, y)
end

---@param order integer|string
---@param whichPoint Point
---@return boolean
function class:issuePointOrder(order, whichPoint)
    return self:issueCoordsOrder(order, whichPoint:getX(), whichPoint:getY())
end

---@param order integer|string
---@param whichLocation Location
---@return boolean
function class:issueLocOrder(order, whichLocation)
    return IssuePointOrderLoc(self.handle, formatStringOrder(order), whichLocation.handle)
end

---@param order integer|string
---@param x real
---@param y real
---@return boolean
function class:issueCoordsByIdOrder(order, x, y)
    return IssuePointOrderById(self.handle, formatIntOrder(order), x, y)
end

---@param order integer|string
---@param whichPoint Point
---@return boolean
function class:issuePointByIdOrder(order, whichPoint)
    return self:issueCoordsByIdOrder(order, whichPoint:getX(), whichPoint:getY())
end

---@param order integer|string
---@param whichLocation Location
---@return boolean
function class:issueLocByIdOrder(order, whichLocation)
    return IssuePointOrderByIdLoc(self.handle, formatIntOrder(order), whichLocation.handle)
end

---@param order integer|string
---@param targetWidget Widget
---@return boolean
function class:issueTargetOrder(order, targetWidget)
    return IssueTargetOrder(self.handle, formatStringOrder(order), targetWidget.handle)
end

---@param order integer|string
---@param targetWidget Widget
---@return boolean
function class:issueTargetByIdOrder(order, targetWidget)
    return IssueTargetOrderById(self.handle, formatIntOrder(order), targetWidget.handle)
end

---@param order integer|string
---@param x real
---@param y real
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantCoordsOrder(order, x, y, instantTargetWidget)
    return IssueInstantPointOrder(self.handle, formatStringOrder(order), x, y, instantTargetWidget.handle)
end

---@param order integer|string
---@param whichPoint Point
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantPointOrder(order, whichPoint, instantTargetWidget)
    return self:issueInstantCoordsOrder(order, whichPoint:getX(), whichPoint:getY(), instantTargetWidget)
end

---@param order integer|string
---@param whichLocation Location
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantLocOrder(order, whichLocation, instantTargetWidget)
    return self:issueInstantCoordsOrder(order, whichLocation:getX(), whichLocation:getY(), instantTargetWidget)
end

---@param order integer|string
---@param x real
---@param y real
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantCoordsByIdOrder(order, x, y, instantTargetWidget)
    return IssueInstantPointOrderById(self.handle, formatIntOrder(order), x, y, instantTargetWidget.handle)
end

---@param order integer|string
---@param whichPoint Point
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantPointByIdOrder(order, whichPoint, instantTargetWidget)
    return self:issueInstantCoordsByIdOrder(order, whichPoint:getX(), whichPoint:getY(), instantTargetWidget)
end

---@param order integer|string
---@param whichLocation Location
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantLocByIdOrder(order, whichLocation, instantTargetWidget)
    return self:issueInstantCoordsByIdOrder(order, whichLocation:getX(), whichLocation:getY(), instantTargetWidget)
end

---@param order integer|string
---@param targetWidget Widget
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantTargetOrder(order, targetWidget, instantTargetWidget)
    return IssueInstantTargetOrder(self.handle, formatStringOrder(order), targetWidget.handle, instantTargetWidget.handle)
end

---@param order integer|string
---@param targetWidget Widget
---@param instantTargetWidget Widget
---@return boolean
function class:issueInstantTargetByIdOrder(order, targetWidget, instantTargetWidget)
    return IssueInstantTargetOrderById(self.handle, formatIntOrder(order), targetWidget.handle, instantTargetWidget.handle)
end

---@param unitToBuild string|integer
---@param x real
---@param y real
---@return boolean
function class:issueBuildCoordsOrder(unitToBuild, x, y)
    return IssueBuildOrder(self.handle, formatStringOrder(unitToBuild), x, y)
end

---@param unitToBuild string|integer
---@param whichPoint Point
---@return boolean
function class:issueBuildPointOrder(unitToBuild, whichPoint)
    return self:issueBuildCoordsOrder(unitToBuild, whichPoint:getX(), whichPoint:getY())
end

---@param unitToBuild string|integer
---@param whichLocation Location
---@return boolean
function class:issueBuildLocOrder(unitToBuild, whichLocation)
    return self:issueBuildCoordsOrder(unitToBuild, whichLocation:getX(), whichLocation:getY())
end

---@param unitId integer|string
---@param x real
---@param y real
---@return boolean
function class:issueBuildCoordsByIdOrder(unitId, x, y)
    return IssueBuildOrderById(self.handle, formatIntOrder(unitId), x, y)
end

---@param unitId integer|string
---@param whichPoint Point
---@return boolean
function class:issueBuildPointByIdOrder(unitId, whichPoint)
    return self:issueBuildCoordsByIdOrder(unitId, whichPoint:getX(), whichPoint:getY())
end

---@param unitId integer|string
---@param whichLocation Location
---@return boolean
function class:issueBuildLocByIdOrder(unitId, whichLocation)
    return self:issueBuildCoordsByIdOrder(unitId, whichLocation:getX(), whichLocation:getY())
end

---@param forWhichPlayer Player
---@param unitToBuild string|integer
---@return boolean
function class:issueNeutralImmediateOrder(forWhichPlayer, unitToBuild)
    return IssueNeutralImmediateOrder(forWhichPlayer.handle, self.handle, formatStringOrder(unitToBuild))
end

---@param forWhichPlayer Player
---@param unitId integer|string
---@return boolean
function class:issueNeutralImmediateByIdOrder(forWhichPlayer, unitId)
    return IssueNeutralImmediateOrderById(forWhichPlayer.handle, self.handle, formatIntOrder(unitId))
end

---@param forWhichPlayer Player
---@param unitToBuild integer|string
---@param x real
---@param y real
---@return boolean
function class:issueNeutralCoordsOrder(forWhichPlayer, unitToBuild, x, y)
    IssueNeutralPointOrder(forWhichPlayer.handle, self.handle, formatStringOrder(unitToBuild), x, y)
end

---@param forWhichPlayer Player
---@param unitToBuild integer|string
---@param whichPoint Point
---@return boolean
function class:issueNeutralPointOrder(forWhichPlayer, unitToBuild, whichPoint)
    return self:issueNeutralCoordsOrder(forWhichPlayer, unitToBuild, whichPoint:getX(), whichPoint:getY())
end

---@param forWhichPlayer Player
---@param unitToBuild integer|string
---@param whichLocation Location
---@return boolean
function class:issueNeutralLocOrder(forWhichPlayer, unitToBuild, whichLocation)
    return self:issueNeutralCoordsOrder(forWhichPlayer, unitToBuild, whichLocation:getX(), whichLocation:getY())
end

---@param forWhichPlayer Player
---@param unitId integer|string
---@param x real
---@param y real
---@return boolean
function class:issueNeutralCoordsByIdOrder(forWhichPlayer, unitId, x, y)
    return IssueNeutralPointOrderById(forWhichPlayer.handle, self.handle, formatIntOrder(unitId), x, y)
end

---@param forWhichPlayer Player
---@param unitId integer|string
---@param whichPoint Point
---@return boolean
function class:issueNeutralPointByIdOrder(forWhichPlayer, unitId, whichPoint)
    return self:issueNeutralCoordsByIdOrder(forWhichPlayer, unitId, whichPoint:getX(), whichPoint:getY())
end

---@param forWhichPlayer Player
---@param unitId integer|string
---@param whichLocation Location
---@return boolean
function class:issueNeutralLocByIdOrder(forWhichPlayer, unitId, whichLocation)
    return self:issueNeutralCoordsByIdOrder(forWhichPlayer, unitId, whichLocation:getX(), whichLocation:getY())
end

---@param forWhichPlayer Player
---@param unitToBuild integer|string
---@param target Widget
---@return boolean
function class:issueNeutralTargetOrder(forWhichPlayer, unitToBuild, target)
    return IssueNeutralTargetOrder(forWhichPlayer.handle, self.handle, formatStringOrder(unitToBuild), target.handle)
end

---@param forWhichPlayer Player
---@param unitId integer|string
---@param target Widget
---@return boolean
function class:issueNeutralTargetByIdOrder(forWhichPlayer, unitId, target)
    return IssueNeutralTargetOrderById(forWhichPlayer.handle, self.handle, formatIntOrder(unitId), target.handle)
end

---@return integer
function class:getCurrentOrder()
    return GetUnitCurrentOrder(self.handle)
end

---@param amount integer
function class:setResourceAmount(amount)
    SetResourceAmount(self.handle, amount)
    return self
end

---@param amount integer
function class:addResourceAmount(amount)
    AddResourceAmount(self.handle, amount)
    return self
end

---@return integer
function class:getResourceAmount()
    return GetResourceAmount(self.handle)
end

---@return real
function class:getWaygateDestinationX()
    return WaygateGetDestinationX(self.handle)
end

---@return real
function class:getWaygateDestinationY()
    return WaygateGetDestinationY(self.handle)
end

---@param x real
---@param y real
function class:waygateSetDestination(x, y)
    WaygateSetDestination(self.handle, x, y)
    return self
end

---@param activate boolean
function class:waygateActivate(activate)
    WaygateActivate(self.handle, activate)
    return self
end

---@return boolean
function class:waygateIsActive()
    return WaygateIsActive(self.handle)
end

---@param itemId integer|string
---@param currentStock integer
---@param stockMax integer
function class:addItemToAllStock(itemId, currentStock, stockMax)
    AddItemToAllStock(formatCC(itemId), currentStock, stockMax)
end

---@param itemId integer|string
---@param currentStock integer
---@param stockMax integer
function class:addItemToStock(itemId, currentStock, stockMax)
    AddItemToStock(self.handle, formatCC(itemId), currentStock, stockMax)
    return self
end

---@param unitId integer|string
---@param currentStock integer
---@param stockMax integer
function class:addToAllStock(unitId, currentStock, stockMax)
    AddUnitToAllStock(formatCC(unitId), currentStock, stockMax)
end

---@param unitId integer|string
---@param currentStock integer
---@param stockMax integer
function class:addToStock(unitId, currentStock, stockMax)
    AddUnitToStock(self.handle, formatCC(unitId), currentStock, stockMax)
    return self
end

---@param itemId integer|string
function class:removeItemFromAllStock(itemId)
    RemoveItemFromAllStock(formatCC(itemId))
end

---@param itemId integer|string
function class:removeItemFromStock(itemId)
    RemoveItemFromStock(self.handle, formatCC(itemId))
    return self
end

---@param unitId integer|string
function class:removeFromAllStock(unitId)
    RemoveUnitFromAllStock(formatCC(unitId))
end

---@param unitId integer|string
function class:removeFromStock(unitId)
    RemoveUnitFromStock(self.handle, formatCC(unitId))
end

---@param slots integer
function class:setAllItemTypeSlots(slots)
    SetAllItemTypeSlots(slots)
end

---@param slots integer
function class:setAllUnitTypeSlots(slots)
    SetAllUnitTypeSlots(slots)
end

---@param slots integer
function class:setItemTypeSlots(slots)
    SetItemTypeSlots(self.handle, slots)
    return self
end

---@param slots integer
function class:setUnitTypeSlots(slots)
    SetUnitTypeSlots(self.handle, slots)
    return self
end

---@return integer
function class:getUserData()
    return GetUnitUserData(self.handle)
end

---@param data integer
function class:setUserData(data)
    SetUnitUserData(self.handle, data)
    return self
end

---@return integer
function class:getMaxHP()
    return BlzGetUnitMaxHP(self.handle)
end

---@param hp integer
function class:setMaxHP(hp)
    BlzSetUnitMaxHP(self.handle, hp)
    return self
end

---@return integer
function class:getMaxMana()
    return BlzGetUnitMaxMana(self.handle)
end

---@param mana integer
function class:setMaxMana(mana)
    BlzSetUnitMaxMana(self.handle, mana)
    return self
end

---@param name string
function class:setName(name)
    BlzSetUnitName(self.handle, name)
    return self
end

---@param weaponIndex integer
---@return integer
function class:getBaseDamage(weaponIndex)
    return BlzGetUnitBaseDamage(self.handle, weaponIndex)
end

---@param weaponIndex integer
---@param baseDamage integer
function class:setBaseDamage(weaponIndex, baseDamage)
    BlzSetUnitBaseDamage(self.handle, baseDamage, weaponIndex)
    return self
end

---@param weaponIndex integer
---@return integer
function class:getDiceNumber(weaponIndex)
    return BlzGetUnitDiceNumber(self.handle, weaponIndex)
end

---@param weaponIndex integer
---@param diceNumber integer
function class:setDiceNumber(weaponIndex, diceNumber)
    BlzSetUnitDiceNumber(self.handle, diceNumber, weaponIndex)
    return self
end

---@param weaponIndex integer
---@return integer
function class:getDiceSides(weaponIndex)
    return BlzGetUnitDiceSides(self.handle, weaponIndex)
end

---@param weaponIndex integer
---@param diceSides integer
function class:setDiceSides(weaponIndex, diceSides)
    BlzSetUnitDiceSides(self.handle, diceSides, weaponIndex)
    return self
end

---@param weaponIndex integer
---@return real
function class:getAttackCooldown(weaponIndex)
    return BlzGetUnitAttackCooldown(self.handle, weaponIndex)
end

---@param weaponIndex integer
---@param cooldown real
function class:setAttackCooldown(weaponIndex, cooldown)
    BlzSetUnitAttackCooldown(self.handle, cooldown, weaponIndex)
    return self
end

---@return real
function class:getArmor()
    return BlzGetUnitArmor(self.handle)
end

---@param armorAmount real
function class:setArmor(armorAmount)
    BlzSetUnitArmor(self.handle, armorAmount)
    return self
end

---@param abilId integer|string
---@param flag boolean
function class:hideAbility(abilId, flag)
    BlzUnitHideAbility(self.handle, formatCC(abilId), flag)
    return self
end

---@param abilId integer|string
---@param flag boolean
---@param hideUI boolean
function class:disableAbility(abilId, flag, hideUI)
    BlzUnitDisableAbility(self.handle, formatCC(abilId), flag, hideUI)
    return self
end

function class:cancelTimedLife()
    BlzUnitCancelTimedLife(self.handle)
    return self
end

---@return boolean
function class:isSelectable()
    return BlzIsUnitSelectable(self.handle)
end

---@return boolean
function class:isInvulnerable()
    return BlzIsUnitInvulnerable(self.handle)
end

function class:interruptAttack()
    BlzUnitInterruptAttack(self.handle)
    return self
end

---@return real
function class:getCollisionSize()
    return BlzGetUnitCollisionSize(self.handle)
end

---@param abilId integer|string
---@param level integer
---@param cooldown real
function class:setAbilityCooldown(abilId, level, cooldown)
    BlzSetUnitAbilityCooldown(self.handle, formatCC(abilId), level, cooldown)
    return self
end

---@param abilId integer|string
---@param level integer
---@return real
function class:getAbilityCooldown(abilId, level)
    return BlzGetAbilityCooldown(formatCC(abilId), level)
end

---@param abilId integer|string
---@return real
function class:getAbilityCooldownRemaining(abilId)
    return BlzGetUnitAbilityCooldownRemaining(self.handle, formatCC(abilId))
end

---@param abilCode integer|string
function class:EndAbilityCooldown(abilCode)
    BlzEndUnitAbilityCooldown(self.handle, formatCC(abilCode))
    return self
end

---@param abilId integer|string
---@param level integer
---@return integer
function class:getAbilityManaCost(abilId, level)
    return BlzGetAbilityManaCost(formatCC(abilId), level)
end

---@param abilId integer|string
---@param level integer
---@param manaCost integer
function class:setAbilityManaCost(abilId, level, manaCost)
    BlzSetUnitAbilityManaCost(self.handle, formatCC(abilId), level, manaCost)
    return self
end

---@return real
function class:getLocalZ()
    return BlzGetLocalUnitZ(self.handle)
end

-- Add this function to follow the style of GetUnitX and GetUnitY, it has the same result as BlzGetLocalUnitZ
---@return real
function class:getZ()
    return BlzGetUnitZ(self.handle)
end

---@param flag boolean
function class:exPause(flag)
    BlzPauseUnitEx(self.handle, flag)
    return self
end

-- Unit
---@param whichField unitbooleanfield
---@return boolean
function class:getBooleanField(whichField)
    return BlzGetUnitBooleanField(self.handle, whichField)
end

---@param whichField unitintegerfield
---@return integer
function class:getIntegerField(whichField)
    return BlzGetUnitIntegerField(self.handle, whichField)
end

---@param whichField unitrealfield
---@return real
function class:getRealField(whichField)
    return BlzGetUnitRealField(self.handle, whichField)
end

---@param whichField unitstringfield
---@return string
function class:getStringField(whichField)
    return BlzGetUnitStringField(self.handle, whichField)
end

---@param whichField unitbooleanfield
---@param value boolean
---@return boolean
function class:setBooleanField(whichField, value)
    return BlzSetUnitBooleanField(self.handle, whichField, value)
end

---@param whichField unitintegerfield
---@param value integer
---@return boolean
function class:setIntegerField(whichField, value)
    return BlzSetUnitIntegerField(self.handle, whichField, value)
end

---@param whichField unitrealfield
---@param value real
---@return boolean
function class:setRealField(whichField, value)
    return BlzSetUnitRealField(self.handle, whichField, value)
end

---@param whichField unitstringfield
---@param value string
---@return boolean
function class:setStringField(whichField, value)
    return BlzSetUnitStringField(self.handle, whichField, value)
end

-- Unit Weapon
---@param whichField unitweaponbooleanfield
---@param index integer
---@return boolean
function class:getWeaponBooleanField(whichField, index)
    return BlzGetUnitWeaponBooleanField(self.handle, whichField, index)
end

---@param whichField unitweaponintegerfield
---@param index integer
---@return integer
function class:getWeaponIntegerField(whichField, index)
    return BlzGetUnitWeaponIntegerField(self.handle, whichField, index)
end

---@param whichField unitweaponrealfield
---@param index integer
---@return real
function class:getWeaponRealField(whichField, index)
    return BlzGetUnitWeaponRealField(self.handle, whichField, index)
end

---@param whichField unitweaponstringfield
---@param index integer
---@return string
function class:getWeaponStringField(whichField, index)
    return BlzGetUnitWeaponStringField(self.handle, whichField, index)
end

---@param whichField unitweaponbooleanfield
---@param index integer
---@param value boolean
---@return boolean
function class:setWeaponBooleanField(whichField, index, value)
    return BlzSetUnitWeaponBooleanField(self.handle, whichField, index, value)
end

---@param whichField unitweaponintegerfield
---@param index integer
---@param value integer
---@return boolean
function class:setWeaponIntegerField(whichField, index, value)
    return BlzSetUnitWeaponIntegerField(self.handle, whichField, index, value)
end

---@param whichField unitweaponrealfield
---@param index integer
---@param value real
---@return boolean
function class:setWeaponRealField(whichField, index, value)
    return BlzSetUnitWeaponRealField(self.handle, whichField, index, value)
end

---@param whichField unitweaponstringfield
---@param index integer
---@param value string
---@return boolean
function class:setWeaponStringField(whichField, index, value)
    return BlzSetUnitWeaponStringField(self.handle, whichField, index, value)
end