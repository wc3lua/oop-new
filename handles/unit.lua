--============================================================================
-- Unit API

Unit = extendedClass(Widget)
local class = Unit

function class:new(unitHandle)
    self.handle = unitHandle
    return newObject(self)
end

function class:atCoordsCreate(id, unitid, x, y, face)
    return self:new(CreateUnit(id.handle, formatIntCC(unitid), x, y, face))
end

function class:atCoordsByNameCreate(whichPlayer, unitname, x, y, face)
    return self:new(CreateUnitByName(whichPlayer.handle, unitname, x, y, face))
end

function class:atLocCreate(id, unitid, whichLocation, face)
    return self:new(CreateUnitAtLoc(id.handle, formatIntCC(unitid), whichLocation.handle, face))
end

function class:atLocByNameCreate(id, unitname, whichLocation, face)
    return self:new(CreateUnitAtLocByName(id.handle, unitname, whichLocation.handle, face))
end

function class:atCoordsCreate(id, unitid, whichPoint, face)
    return self:atCoordsCreate(id, unitid, whichPoint:getX(), whichPoint:getY(), face)
end

function class:corpseCreate(whichPlayer, unitid, x, y, face)
    return self:new(CreateCorpse(whichPlayer.handle, formatIntCC(unitid), x, y, face))
end

function class:corpseLocCreate(whichPlayer, unitid, loc, face)
    return self:corpseCreate(whichPlayer, unitid, loc:getX(), loc:getY(), face)
end

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

function class:show(show)
    ShowUnit(self.handle, show)
end

function class:state(whichUnitState, newVal)
    if  not newVal then
        return GetUnitState(self.handle, whichUnitState)
    else
        SetUnitState(self.handle, whichUnitState, newVal)
    end
    return self
end

function class:x(newX)
    if  not newX then
        return GetUnitX(self.handle)
    else
        SetUnitX(self.handle, newX)
    end
    return self
end

function class:y(newY)
    if not newY then
        return GetUnitY(self.handle)
    else
        SetUnitY(self.handle, newY)
    end
    return self
end

function class:setPosition(newX, newY)
    SetUnitPosition(self.handle, newX, newY)
    return self
end

function class:setLocPosition(whichLocation)
    SetUnitPositionLoc(self.handle, whichLocation.handle)
    return self
end

function class:setPointPosition(whichPoint)
    return self:setPosition(whichPoint:getX(), whichPoint:getY())
end

function class:facing(facingAngle)
    if  not facingAngle then
        return GetUnitFacing(self.handle)
    else
        SetUnitFacing(self.handle, facingAngle)
    end
    return self
end

function class:timedFacing(facingAngle, duration)
    SetUnitFacingTimed(self.handle, facingAngle, duration)
    return self
end

function class:moveSpeed(newSpeed)
    if  not newSpeed then
        return GetUnitMoveSpeed(self.handle)
    else
        SetUnitMoveSpeed(self.handle, newSpeed)
    end
    return self
end

function class:flyHeight(newHeight, rate)
    if  not newHeight then
        return GetUnitFlyHeight(self.handle)
    else
        SetUnitFlyHeight(self.handle, newHeight, rate)
    end
    return self
end

function class:turnSpeed(newTurnSpeed)
    if  not newTurnSpeed then
        return GetUnitTurnSpeed(self.handle)
    else
        SetUnitTurnSpeed(self.handle, newTurnSpeed)
    end
    return self
end

function class:propWindow(newPropWindowAngle)
    if  not newPropWindowAngle then
        return GetUnitPropWindow(self.handle)
    else
        SetUnitPropWindow(self.handle, newPropWindowAngle)
    end
    return self
end

function class:acquireRange(newAcquireRange)
    if  not newAcquireRange then
        return GetUnitAcquireRange(self.handle)
    else
        SetUnitAcquireRange(self.handle, newAcquireRange)
    end
    return self
end

function class:getDefaultAcquireRange()
    return GetUnitDefaultAcquireRange(self.handle)
end

function class:setCreepGuard(creepGuard)
    SetUnitCreepGuard(self.handle, creepGuard)
    return self
end

function class:getDefaultTurnSpeed()
    return GetUnitDefaultTurnSpeed(self.handle)
end

function class:getDefaultPropWindow()
    return GetUnitDefaultPropWindow(self.handle)
end

function class:getDefaultFlyHeight()
    return GetUnitDefaultFlyHeight(self.handle)
end

function class:owner(whichPlayer, changeColor)
    if  not whichPlayer then
        return ClassPlayer:owner(self)
    else
        SetUnitOwner(self.handle, whichPlayer.handle, changeColor)
    end
    return self
end

function class:setColor(whichColor)
    SetUnitColor(self.handle, whichColor)
    return self
end

function class:setScale(scaleX, scaleY, scaleZ)
    SetUnitScale(self.handle, scaleX, scaleY, scaleZ)
    return self
end

function class:setTimeScale(timeScale)
    SetUnitTimeScale(self.handle, timeScale)
    return self
end

function class:setBlendTime(blendTime)
    SetUnitBlendTime(self.handle, blendTime)
    return self
end

function class:setVertexColor(red, green, blue, alpha)
    SetUnitVertexColor(self.handle, red, green, blue, alpha)
    return self
end

function class:queueAnimation(whichAnimation)
    QueueUnitAnimation(self.handle, whichAnimation)
    return self
end

function class:setAnimation(whichAnimation)
    SetUnitAnimation(self.handle, whichAnimation)
    return self
end

function class:setByIndexAnimation(whichAnimation)
    SetUnitAnimationByIndex(self.handle, whichAnimation)
    return self
end

function class:setWithRarityAnimation(whichAnimation, rarity)
    SetUnitAnimationWithRarity(self.handle, whichAnimation, rarity)
    return self
end

function class:addAnimationProperties(animProperties, add)
    AddUnitAnimationProperties(self.handle, animProperties, add)
    return self
end

function class:setLookAt(whichBone, lookAtTarget, offsetX, offsetY, offsetZ)
    SetUnitLookAt(self.handle, whichBone, lookAtTarget.handle, offsetX, offsetY, offsetZ)
    return self
end

function class:resetLookAt()
    ResetUnitLookAt(self.handle)
    return self
end

function class:setRescuable(byWhichPlayer, flag)
    SetUnitRescuable(self.handle, byWhichPlayer.handle, flag)
    return self
end

function class:setRescueRange(range)
    SetUnitRescueRange(self.handle, range)
    return self
end

function class:heroStr(permanent_OR_includeBonuses, newStr)
    if  not heroStr then
        return GetHeroStr(self.handle, permanent_OR_includeBonuses)
    else
        SetHeroStr(self.handle, newStr, permanent_OR_includeBonuses)
    end
    return self
end

function class:heroAgi(permanent_OR_includeBonuses, newAgi)
    if  not newAgi then
        return GetHeroAgi(self.handle, permanent_OR_includeBonuses)
    else
        SetHeroAgi(self.handle, newAgi, permanent_OR_includeBonuses)
    end
    return self
end

function class:heroInt(permanent_OR_includeBonuses, newInt)
    if  not newInt then
        return GetHeroInt(self.handle, permanent_OR_includeBonuses)
    else
        SetHeroInt(self.handle, newInt, permanent_OR_includeBonuses)
    end
    return self
end

function class:stripHeroLevel(howManyLevels)
    return UnitStripHeroLevel(self.handle, howManyLevels)
end

function class:heroXP(newXpVal, showEyeCandy)
    if  not newXpVal then
        return GetHeroXP(self.handle)
    else
        SetHeroXP(self.handle, newXpVal, showEyeCandy)
    end
    return self
end

function class:getHeroSkillPoints()
    return GetHeroSkillPoints(self.handle)
end

function class:modifySkillPoints(skillPointDelta)
    UnitModifySkillPoints(self.handle, skillPointDelta)
    return self
end

function class:addHeroXP(xpToAdd, showEyeCandy)
    AddHeroXP(self.handle, xpToAdd, showEyeCandy)
    return self
end

function class:heroLevel(level, showEyeCandy)
    if  not level then
        return GetHeroLevel(self.handle)
    else
        SetHeroLevel(self.handle, level, showEyeCandy)
    end
    return self
end

function class:getLevel()
    return GetUnitLevel(self.handle)
end

function class:heroProperName(heroProperName)
    if  not heroProperName then
        return GetHeroProperName(self.handle)
    else
        BlzSetHeroProperName(self.handle, heroProperName)
    end
    return self
end

function class:suspendXP(flag)
    SuspendHeroXP(self.handle, flag)
    return self
end

function class:isSuspendedXP()
    return IsSuspendedXP(self.handle)
end

function class:selectHeroSkill(abilcode)
    SelectHeroSkill(self.handle, formatIntCC(abilcode))
    return self
end

function class:abilityLevel(abilcode, level)
    abilcode = formatIntCC(abilcode)
    if  not level then
        return GetUnitAbilityLevel(self.handle, abilcode)
    else
        SetUnitAbilityLevel(self.handle, abilcode, level)
    end
    return self
end

function class:decAbilityLevel(abilcode)
    return DecUnitAbilityLevel(self.handle, formatIntCC(abilcode))
end

function class:incAbilityLevel(abilcode)
    return IncUnitAbilityLevel(self.handle, formatIntCC(abilcode))
end

function class:reviveHero(x, y, doEyecandy)
    return ReviveHero(self.handle, x, y, doEyecandy)
end

function class:revivePointHero(p, doEyecandy)
    return self:reviveHero(p:getX(), p:getY(), doEyecandy)
end

function class:reviveLocHero(loc, doEyecandy)
    return ReviveHeroLoc(self.handle, loc.handle, doEyecandy)
end

function class:setExploded(exploded)
    SetUnitExploded(self.handle, exploded)
    return self
end

function class:setInvulnerable(flag)
    SetUnitInvulnerable(self.handle, flag)
    return self
end

function class:pause(flag)
    PauseUnit(self.handle, flag)
    return self
end

function class:isPaused()
    return IsUnitPaused(self.handle)
end

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

function class:select(flag)
    SelectUnit(self.handle, flag)
    return self
end

function class:getPointValue()
    return GetUnitPointValue(self.handle)
end

function class:getByTypePointValue(unitType)
    return GetUnitPointValueByType(unitType)
end


--        function SetUnitPointValueByType(unitType, newPointValue)

function class:addItem(whichItem)
    return UnitAddItem(self.handle, whichItem.handle)
end

function class:addByIdItem(itemId)
    return ClassItem:new(UnitAddItemById(self.handle, formatIntCC(itemId)))
end

function class:addToSlotByIdItem(itemId, itemSlot)
    return UnitAddItemToSlotById(self.handle, formatIntCC(itemId), itemSlot)
end

function class:removeItem(whichItem)
    UnitRemoveItem(self.handle, whichItem.handle)
    return self
end

function class:removeFromSlotItem(itemSlot)
    return ClassItem:new(UnitRemoveItemFromSlot(self.handle, itemSlot))
end

function class:hasItem(whichItem)
    return UnitHasItem(self.handle, whichItem.handle)
end

function class:itemInSlot(itemSlot)
    return ClassItem:new(UnitItemInSlot(self.handle, itemSlot))
end

function class:inventorySize()
    return UnitInventorySize(self.handle)
end

function class:dropItemCoords(whichItem, x, y)
    return UnitDropItemPoint(self.handle, whichItem.handle, x, y)
end

function class:dropItemPoint(whichItem, point)
    return self:dropItemCoords(whichItem, point:getX(), point:getY())
end

function class:dropItemLoc(whichItem, loc)
    return self:dropItemCoords(whichItem, loc:getX(), loc:getY())
end

function class:dropItemSlot(whichItem, slot)
    UnitDropItemSlot(self.handle, whichItem.handle, slot)
end

function class:dropItemTarget(whichItem, target)
    UnitDropItemTarget(self.handle, whichItem.handle, target.handle)
end

function class:useItem(whichItem)
    return UnitUseItem(self.handle, whichItem.handle)
end

function class:useCoordsItem(whichItem, x, y)
    return UnitUseItemPoint(self.handle, whichItem.handle, x, y)
end

function class:usePointItem(whichItem, p)
    return self:useCoordsItem(whichItem, p:getX(), p:getY())
end

function class:useLocItem(whichItem, loc)
    return self:useCoordsItem(whichItem, loc:getX(), loc:getY())
end

function class:useTargetItem(whichItem, target)
    return UnitUseItemTarget(self.handle, whichItem.handle, target.handle)
end

function class:getX()
    return GetUnitX(self.handle)
end

function class:getY()
    return GetUnitY(self.handle)
end

function class:getLoc()
    return ClassLocation:new(GetUnitLoc(self.handle))
end

function class:getFacing()
    return GetUnitFacing(self.handle)
end

function class:getMoveSpeed()
    return GetUnitMoveSpeed(self.handle)
end

function class:getDefaultMoveSpeed()
    return GetUnitDefaultMoveSpeed(self.handle)
end

function class:getState(whichUnitState)
    return GetUnitState(self.handle, whichUnitState)
end

function class:owner()
    return ClassPlayer:owner(self.handle)
end

function class:getTypeId()
    return GetUnitTypeId(self.handle)
end

function class:getRace()
    return GetUnitRace(self.handle)
end

function class:getName()
    return GetUnitName(self.handle)
end

function class:getFoodUsed()
    return GetUnitFoodUsed(self.handle)
end

function class:getFoodMade()
    return GetUnitFoodMade(self.handle)
end

function class:getFoodMade(unitId)
    return GetFoodMade(formatIntCC(unitId))
end

function class:getFoodUsed(unitId)
    return GetFoodUsed(formatIntCC(unitId))
end

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

function class:isInGroup(whichGroup)
    return IsUnitInGroup(self.handle, whichGroup.handle)
end

function class:isInForce(whichForce)
    return IsUnitInForce(self.handle, whichForce.handle)
end

function class:isOwnedByPlayer(whichPlayer)
    return IsUnitOwnedByPlayer(self.handle, whichPlayer.handle)
end

function class:isAlly(whichPlayer)
    return IsUnitAlly(self.handle, whichPlayer.handle)
end

function class:isEnemy(whichPlayer)
    return IsUnitEnemy(self.handle, whichPlayer.handle)
end

function class:isVisible(whichPlayer)
    return IsUnitVisible(self.handle, whichPlayer.handle)
end

function class:isDetected(whichPlayer)
    return IsUnitDetected(self.handle, whichPlayer.handle)
end

function class:isInvisible(whichPlayer)
    return IsUnitInvisible(self.handle, whichPlayer.handle)
end

function class:isFogged(whichPlayer)
    return IsUnitFogged(self.handle, whichPlayer.handle)
end

function class:isMasked(whichPlayer)
    return IsUnitMasked(self.handle, whichPlayer.handle)
end

function class:isSelected(whichPlayer)
    return IsUnitSelected(self.handle, whichPlayer.handle)
end

function class:isRace(whichRace)
    return IsUnitRace(self.handle, whichRace)
end

function class:isType(whichUnitType)
    return IsUnitType(self.handle, whichUnitType)
end

function class:is(whichSpecifiedUnit)
    return IsUnit(self.handle, whichSpecifiedUnit.handle)
end

function class:isInRangeOfUnit(otherUnit, distance)
    return IsUnitInRange(self.handle, otherUnit.handle, distance)
end

function class:isInRangeOfCoords(x, y, distance)
    return IsUnitInRangeXY(self.handle, x, y, distance)
end

function class:isInRangeOfPoint(p, distance)
    return self:isInRangeOfCoords(p:getX(), p:getY(), distance)
end

function class:isInRangeOfLoc(whichLocation, distance)
    return IsUnitInRangeLoc(self.handle, whichLocation.handle, distance)
end

function class:isHidden()
    return IsUnitHidden(self.handle)
end

function class:isIllusion()
    return IsUnitIllusion(self.handle)
end

function class:isInTransport(whichTransport)
    return IsUnitInTransport(self.handle, whichTransport.handle)
end

function class:isLoaded()
    return IsUnitLoaded(self.handle)
end

function class:isHeroId(unitId)
    return IsHeroUnitId(formatIntCC(unitId))
end

function class:isIdType(unitId, whichUnitType)
    return IsUnitIdType(formatIntCC(unitId), whichUnitType)
end

function class:shareVision(whichPlayer, share)
    UnitShareVision(self.handle, whichPlayer.handle, share)
    return self
end

function class:suspendDecay(suspend)
    UnitSuspendDecay(self.handle, suspend)
    return self
end

function class:addType(whichUnitType)
    return UnitAddType(self.handle, whichUnitType)
end

function class:removeType(whichUnitType)
    return UnitRemoveType(self.handle, whichUnitType)
end

function class:addAbility(abilityId)
    return UnitAddAbility(self.handle, formatIntCC(abilityId))
end

function class:removeAbility(abilityId)
    return UnitRemoveAbility(self.handle, formatIntCC(abilityId))
end

function class:makeAbilityPermanent(abilityId, permanent)
    return UnitMakeAbilityPermanent(self.handle, permanent, formatIntCC(abilityId))
end

function class:removeBuffs(removePositive, removeNegative)
    UnitRemoveBuffs(self.handle, removePositive, removeNegative)
    return self
end

function class:removeExBuffs(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    UnitRemoveBuffsEx(self.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return self
end

function class:hasBuffsEx(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return UnitHasBuffsEx(self.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
end

function class:countBuffsEx(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
    return UnitCountBuffsEx(self.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel)
end

function class:addSleep(add)
    UnitAddSleep(self.handle, add)
    return self
end

function class:canSleep()
    return UnitCanSleep(self.handle)
end

function class:addPermSleep(add)
    UnitAddSleepPerm(self.handle, add)
    return self
end

function class:canPermSleep()
    return UnitCanSleepPerm(self.handle)
end

function class:isSleeping()
    return UnitIsSleeping(self.handle)
end

function class:wakeUp()
    UnitWakeUp(self.handle)
    return self
end

function class:applyTimedLife(buffId, duration)
    UnitApplyTimedLife(self.handle, formatIntCC(buffId), duration)
    return self
end

function class:ignoreAlarm(flag)
    return UnitIgnoreAlarm(self.handle, flag)
end

function class:ignoreToggledAlarm()
    return UnitIgnoreAlarmToggled(self.handle)
end

function class:resetCooldown()
    UnitResetCooldown(self.handle)
    return self
end

function class:setConstructionProgress(constructionPercentage)
    UnitSetConstructionProgress(self.handle, constructionPercentage)
    return self
end

function class:setUpgradeProgress(upgradePercentage)
    UnitSetUpgradeProgress(self.handle, upgradePercentage)
    return self
end

function class:pauseTimedLife(flag)
    UnitPauseTimedLife(self.handle, flag)
    return self
end

function class:setUsesAltIcon(flag)
    UnitSetUsesAltIcon(self.handle, flag)
    return self
end

function class:damageCoords(x, y, delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
    return UnitDamagePoint(self.handle, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType)
end

function class:damagePoint(p, delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
    return self:damageCoords(p:getX(), p:getY(), delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
end

function class:damageLoc(loc, delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
    return self:damageCoords(loc:getX(), loc:getY(), delay, radius, amount, attack, ranged, attackType, damageType, weaponType)
end

function class:damageTarget(target, amount, attack, ranged, attackType, damageType, weaponType)
    return UnitDamageTarget(self.handle, target.handle, amount, attack, ranged, attackType, damageType, weaponType)
end

function class:issueImmediateOrder(order)
    return IssueImmediateOrder(self.handle, formatStringOrder(order))
end

function class:issueImmediateByIdOrder(order)
    return IssueImmediateOrderById(self.handle, formatIntOrder(order))
end

function class:issueCoordsOrder(order, x, y)
    return IssuePointOrder(self.handle, formatStringOrder(order), x, y)
end

function class:issuePointOrder(order, whichPoint)
    return self:issueCoordsOrder(order, whichPoint:getX(), whichPoint:getY())
end

function class:issueLocOrder(order, whichLocation)
    return IssuePointOrderLoc(self.handle, formatStringOrder(order), whichLocation.handle)
end

function class:issueCoordsByIdOrder(order, x, y)
    return IssuePointOrderById(self.handle, formatIntOrder(order), x, y)
end

function class:issuePointByIdOrder(order, whichPoint)
    return self:issueCoordsByIdOrder(order, whichPoint:getX(), whichPoint:getY())
end

function class:issueLocByIdOrder(order, whichLocation)
    return IssuePointOrderByIdLoc(self.handle, formatIntOrder(order), whichLocation.handle)
end

function class:issueTargetOrder(order, targetWidget)
    return IssueTargetOrder(self.handle, formatStringOrder(order), targetWidget.handle)
end

function class:issueTargetByIdOrder(order, targetWidget)
    return IssueTargetOrderById(self.handle, formatIntOrder(order), targetWidget.handle)
end

function class:issueInstantCoordsOrder(order, x, y, instantTargetWidget)
    return IssueInstantPointOrder(self.handle, formatStringOrder(order), x, y, instantTargetWidget.handle)
end

function class:issueInstantPointOrder(order, whichPoint, instantTargetWidget)
    return self:issueInstantCoordsOrder(order, whichPoint:getX(), whichPoint:getY(), instantTargetWidget)
end

function class:issueInstantLocOrder(order, whichLocation, instantTargetWidget)
    return self:issueInstantCoordsOrder(order, whichLocation:getX(), whichLocation:getY(), instantTargetWidget)
end

function class:issueInstantCoordsByIdOrder(order, x, y, instantTargetWidget)
    return IssueInstantPointOrderById(self.handle, formatIntOrder(order), x, y, instantTargetWidget.handle)
end

function class:issueInstantPointByIdOrder(order, whichPoint, instantTargetWidget)
    return self:issueInstantCoordsByIdOrder(order, whichPoint:getX(), whichPoint:getY(), instantTargetWidget)
end

function class:issueInstantLocByIdOrder(order, whichLocation, instantTargetWidget)
    return self:issueInstantCoordsByIdOrder(order, whichLocation:getX(), whichLocation:getY(), instantTargetWidget)
end

function class:issueInstantTargetOrder(order, targetWidget, instantTargetWidget)
    return IssueInstantTargetOrder(self.handle, formatStringOrder(order), targetWidget.handle, instantTargetWidget.handle)
end

function class:issueInstantTargetByIdOrder(order, targetWidget, instantTargetWidget)
    return IssueInstantTargetOrderById(self.handle, formatIntOrder(order), targetWidget.handle, instantTargetWidget.handle)
end

function class:issueBuildCoordsOrder(unitToBuild, x, y)
    return IssueBuildOrder(self.handle, formatStringOrder(unitToBuild), x, y)
end

function class:issueBuildPointOrder(unitToBuild, whichPoint)
    return self:issueBuildCoordsOrder(unitToBuild, whichPoint:getX(), whichPoint:getY())
end

function class:issueBuildLocOrder(unitToBuild, whichLocation)
    return self:issueBuildCoordsOrder(unitToBuild, whichLocation:getX(), whichLocation:getY())
end

function class:issueBuildCoordsByIdOrder(unitId, x, y)
    return IssueBuildOrderById(self.handle, formatIntOrder(unitId), x, y)
end

function class:issueBuildPointByIdOrder(unitId, whichPoint)
    return self:issueBuildCoordsByIdOrder(unitId, whichPoint:getX(), whichPoint:getY())
end

function class:issueBuildLocByIdOrder(unitId, whichLocation)
    return self:issueBuildCoordsByIdOrder(unitId, whichLocation:getX(), whichLocation:getY())
end

function class:issueNeutralImmediateOrder(forWhichPlayer, unitToBuild)
    return IssueNeutralImmediateOrder(forWhichPlayer.handle, self.handle, formatStringOrder(unitToBuild))
end

function class:issueNeutralImmediateByIdOrder(forWhichPlayer, unitId)
    return IssueNeutralImmediateOrderById(forWhichPlayer.handle, self.handle, formatIntOrder(unitId))
end

function class:issueNeutralCoordsOrder(forWhichPlayer, unitToBuild, x, y)
    IssueNeutralPointOrder(forWhichPlayer.handle, self.handle, formatStringOrder(unitToBuild), x, y)
end

function class:issueNeutralPointOrder(forWhichPlayer, unitToBuild, whichPoint)
    return self:issueNeutralCoordsOrder(forWhichPlayer, unitToBuild, whichPoint:getX(), whichPoint:getY())
end

function class:issueNeutralLocOrder(forWhichPlayer, unitToBuild, whichLocation)
    return self:issueNeutralCoordsOrder(forWhichPlayer, unitToBuild, whichLocation:getX(), whichLocation:getY())
end

function class:issueNeutralCoordsByIdOrder(forWhichPlayer, unitId, x, y)
    return IssueNeutralPointOrderById(forWhichPlayer.handle, self.handle, formatIntOrder(unitId), x, y)
end

function class:issueNeutralPointByIdOrder(forWhichPlayer, unitId, whichPoint)
    return self:issueNeutralCoordsByIdOrder(forWhichPlayer, unitId, whichPoint:getX(), whichPoint:getY())
end

function class:issueNeutralLocByIdOrder(forWhichPlayer, unitId, whichLocation)
    return self:issueNeutralCoordsByIdOrder(forWhichPlayer, unitId, whichLocation:getX(), whichLocation:getY())
end

function class:issueNeutralTargetOrder(forWhichPlayer, unitToBuild, target)
    return IssueNeutralTargetOrder(forWhichPlayer.handle, self.handle, formatStringOrder(unitToBuild), target.handle)
end

function class:issueNeutralTargetByIdOrder(forWhichPlayer, unitId, target)
    return IssueNeutralTargetOrderById(forWhichPlayer.handle, self.handle, formatIntOrder(unitId), target.handle)
end

function class:getCurrentOrder()
    return GetUnitCurrentOrder(self.handle)
end

function class:setResourceAmount(amount)
    SetResourceAmount(self.handle, amount)
    return self
end

function class:addResourceAmount(amount)
    AddResourceAmount(self.handle, amount)
    return self
end

function class:getResourceAmount()
    return GetResourceAmount(self.handle)
end

function class:getWaygateDestinationX()
    return WaygateGetDestinationX(self.handle)
end

function class:getWaygateDestinationY()
    return WaygateGetDestinationY(self.handle)
end

function class:waygateSetDestination(x, y)
    WaygateSetDestination(self.handle, x, y)
    return self
end

function class:waygateActivate(activate)
    WaygateActivate(self.handle, activate)
    return self
end

function class:waygateIsActive()
    return WaygateIsActive(self.handle)
end

function class:addItemToAllStock(itemId, currentStock, stockMax)
    AddItemToAllStock(formatIntCC(itemId), currentStock, stockMax)
end

function class:addItemToStock(itemId, currentStock, stockMax)
    AddItemToStock(self.handle, formatIntCC(itemId), currentStock, stockMax)
    return self
end

function class:addToAllStock(unitId, currentStock, stockMax)
    AddUnitToAllStock(formatIntCC(unitId), currentStock, stockMax)
end

function class:addToStock(unitId, currentStock, stockMax)
    AddUnitToStock(self.handle, formatIntCC(unitId), currentStock, stockMax)
    return self
end

function class:removeItemFromAllStock(itemId)
    RemoveItemFromAllStock(formatIntCC(itemId))
end

function class:removeItemFromStock(itemId)
    RemoveItemFromStock(self.handle, formatIntCC(itemId))
    return self
end

function class:removeFromAllStock(unitId)
    RemoveUnitFromAllStock(formatIntCC(unitId))
end

function class:removeFromStock(unitId)
    RemoveUnitFromStock(self.handle, formatIntCC(unitId))
end

function class:setAllItemTypeSlots(slots)
    SetAllItemTypeSlots(slots)
end

function class:setAllUnitTypeSlots(slots)
    SetAllUnitTypeSlots(slots)
end

function class:setItemTypeSlots(slots)
    SetItemTypeSlots(self.handle, slots)
    return self
end

function class:setUnitTypeSlots(slots)
    SetUnitTypeSlots(self.handle, slots)
    return self
end

function class:getUserData()
    return GetUnitUserData(self.handle)
end

function class:setUserData(data)
    SetUnitUserData(self.handle, data)
    return self
end

function class:getMaxHP()
    return BlzGetUnitMaxHP(self.handle)
end

function class:setMaxHP(hp)
    BlzSetUnitMaxHP(self.handle, hp)
    return self
end

function class:getMaxMana()
    return BlzGetUnitMaxMana(self.handle)
end

function class:setMaxMana(mana)
    BlzSetUnitMaxMana(self.handle, mana)
    return self
end

function class:setName(name)
    BlzSetUnitName(self.handle, name)
    return self
end

function class:getBaseDamage(weaponIndex)
    return BlzGetUnitBaseDamage(self.handle, weaponIndex)
end

function class:setBaseDamage(weaponIndex, baseDamage)
    BlzSetUnitBaseDamage(self.handle, baseDamage, weaponIndex)
    return self
end

function class:getDiceNumber(weaponIndex)
    return BlzGetUnitDiceNumber(self.handle, weaponIndex)
end

function class:setDiceNumber(weaponIndex, diceNumber)
    BlzSetUnitDiceNumber(self.handle, diceNumber, weaponIndex)
    return self
end

function class:getDiceSides(weaponIndex)
    return BlzGetUnitDiceSides(self.handle, weaponIndex)
end

function class:setDiceSides(weaponIndex, diceSides)
    BlzSetUnitDiceSides(self.handle, diceSides, weaponIndex)
    return self
end

function class:getAttackCooldown(weaponIndex)
    return BlzGetUnitAttackCooldown(self.handle, weaponIndex)
end

function class:setAttackCooldown(weaponIndex, cooldown)
    BlzSetUnitAttackCooldown(self.handle, cooldown, weaponIndex)
    return self
end

function class:getArmor()
    return BlzGetUnitArmor(self.handle)
end

function class:setArmor(armorAmount)
    BlzSetUnitArmor(self.handle, armorAmount)
    return self
end

function class:hideAbility(abilId, flag)
    BlzUnitHideAbility(self.handle, formatIntCC(abilId), flag)
    return self
end

function class:disableAbility(abilId, flag, hideUI)
    BlzUnitDisableAbility(self.handle, formatIntCC(abilId), flag, hideUI)
    return self
end

function class:cancelTimedLife()
    BlzUnitCancelTimedLife(self.handle)
    return self
end

function class:isSelectable()
    return BlzIsUnitSelectable(self.handle)
end

function class:isInvulnerable()
    return BlzIsUnitInvulnerable(self.handle)
end

function class:interruptAttack()
    BlzUnitInterruptAttack(self.handle)
    return self
end

function class:getCollisionSize()
    return BlzGetUnitCollisionSize(self.handle)
end

function class:setAbilityCooldown(abilId, level, cooldown)
    BlzSetUnitAbilityCooldown(self.handle, formatIntCC(abilId), level, cooldown)
    return self
end

function class:getAbilityCooldown(abilId, level)
    return BlzGetAbilityCooldown(formatIntCC(abilId), level)
end

function class:getAbilityCooldownRemaining(abilId)
    return BlzGetUnitAbilityCooldownRemaining(self.handle, formatIntCC(abilId))
end

function class:EndAbilityCooldown(abilCode)
    BlzEndUnitAbilityCooldown(self.handle, formatIntCC(abilCode))
    return self
end

function class:getAbilityManaCost(abilId, level)
    return BlzGetAbilityManaCost(formatIntCC(abilId), level)
end

function class:setAbilityManaCost(abilId, level, manaCost)
    BlzSetUnitAbilityManaCost(self.handle, formatIntCC(abilId), level, manaCost)
    return self
end

function class:getLocalZ()
    return BlzGetLocalUnitZ(self.handle)
end

-- Add this function to follow the style of GetUnitX and GetUnitY, it has the same result as BlzGetLocalUnitZ
function class:getZ()
    return BlzGetUnitZ(self.handle)
end

function class:exPause(flag)
    BlzPauseUnitEx(self.handle, flag)
    return self
end

-- Unit
function class:getBooleanField(whichField)
    return BlzGetUnitBooleanField(self.handle, whichField)
end

function class:getIntegerField(whichField)
    return BlzGetUnitIntegerField(self.handle, whichField)
end

function class:getRealField(whichField)
    return BlzGetUnitRealField(self.handle, whichField)
end

function class:getStringField(whichField)
    return BlzGetUnitStringField(self.handle, whichField)
end

function class:setBooleanField(whichField, value)
    return BlzSetUnitBooleanField(self.handle, whichField, value)
end

function class:setIntegerField(whichField, value)
    return BlzSetUnitIntegerField(self.handle, whichField, value)
end

function class:setRealField(whichField, value)
    return BlzSetUnitRealField(self.handle, whichField, value)
end

function class:setStringField(whichField, value)
    return BlzSetUnitStringField(self.handle, whichField, value)
end

-- Unit Weapon
function class:getWeaponBooleanField(whichField, index)
    return BlzGetUnitWeaponBooleanField(self.handle, whichField, index)
end

function class:getWeaponIntegerField(whichField, index)
    return BlzGetUnitWeaponIntegerField(self.handle, whichField, index)
end

function class:getWeaponRealField(whichField, index)
    return BlzGetUnitWeaponRealField(self.handle, whichField, index)
end

function class:getWeaponStringField(whichField, index)
    return BlzGetUnitWeaponStringField(self.handle, whichField, index)
end

function class:setWeaponBooleanField(whichField, index, value)
    return BlzSetUnitWeaponBooleanField(self.handle, whichField, index, value)
end

function class:setWeaponIntegerField(whichField, index, value)
    return BlzSetUnitWeaponIntegerField(self.handle, whichField, index, value)
end

function class:setWeaponRealField(whichField, index, value)
    return BlzSetUnitWeaponRealField(self.handle, whichField, index, value)
end

function class:setWeaponStringField(whichField, index, value)
    return BlzSetUnitWeaponStringField(self.handle, whichField, index, value)
end