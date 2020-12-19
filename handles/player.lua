---@class Player:Handle
ClassPlayer = extendedClass(Handle)
local class = ClassPlayer

function class:new(playerHandle)
    self.handle = playerHandle
    return newObject(self)
end

function class:get(number)
    return self:new(Player(number))
end

-- function getPlayer(number)
--     return class:get(number)
-- end

function class:getLocal()
    return self:new(GetLocalPlayer())
end

-- function getLocalPlayer()
--     return class:getLocal()
-- end

function class:triggered()
    return self:new(GetTriggerPlayer())
end

-- function getTriggerPlayer()
--     return class:triggered()
-- end

function class:enumed()
    return self:new(GetEnumPlayer())
end

-- function getEnumPlayer()
--     return class:enumed()
-- end

function class:filtered()
    return self:new(GetFilterPlayer())
end

-- function getFilterPlayer()
--     return class:filtered()
-- end

function class:owner(whichUnit)
    return self:new(GetOwningPlayer(whichUnit.handle))
end

function class:fromItem(whichItem)
    return self:new(GetItemPlayer(whichItem.handle))
end


function class:isAlly(otherPlayer)
    return IsPlayerAlly(self.handle, otherPlayer.handle)
end

function class:isEnemy(otherPlayer)
    return IsPlayerEnemy(self.handle, otherPlayer.handle)
end

function class:isInForce(whichForce)
    return IsPlayerInForce(self.handle, whichForce.handle)
end

function class:isObserver()
    return IsPlayerObserver(self.handle)
end

function class:isCoordsVisible(x,y)
    return IsVisibleToPlayer(x,y,self.handle)
end

function class:isPointVisible(p)
    return self:isCoordsVisible(p:getX(), p:getY())
end

function class:isLocationVisible(whichLocation)
    return IsLocationVisibleToPlayer(whichLocation.handle, self.handle)
end

function class:isCoordsFogged(x, y)
    return IsFoggedToPlayer(x, y, self.handle)
end

function class:isPointFogged(p)
    return self:isCoordsFogged(p:getX(), p:getY())
end

function class:isLocationFogged(whichLocation)
    return IsLocationFoggedToPlayer(whichLocation.handle, self.handle)
end

function class:isCoordsMasked(x, y)
    return IsMaskedToPlayer(x, y, self.handle)    
end

function class:isLocationMasked(whichLocation)
    return IsLocationMaskedToPlayer(whichLocation.handle, self.handle)
end

function class:isPointMasked(p)
    return self:isCoordsMasked(p:getX(), p:getY())
end

function class:race()
    return GetPlayerRace(self.handle)
end

function class:id()
    return GetPlayerId(self.handle)
end

function class:unitCount(includeIncomplete)
    return GetPlayerUnitCount(self.handle, includeIncomplete)
end

function class:typedUnitCount(unitName, includeIncomplete, includeUpgrades)
    return GetPlayerTypedUnitCount(self.handle, unitName, includeIncomplete, includeUpgrades)
end

function class:structureCount(includeIncomplete)
    return GetPlayerStructureCount(self.handle, includeIncomplete)
end

function class:state(whichPlayerState, value)
    if  not value then
        return GetPlayerState(self.handle, whichPlayerState)
    else
        SetPlayerState(self.handle, whichPlayerState, value)
    end
    return self
end

function class:score(whichPlayerScore)
    return GetPlayerScore(self.handle, whichPlayerScore)
end

function class:alliance(otherPlayer, whichAllianceSetting)
    return GetPlayerAlliance(self.handle, whichAllianceSetting)
end

function class:handicap(handicap)
    if  not handicap then
        return GetPlayerHandicap(self.handle)
    else
        SetPlayerHandicap(self.handle, handicap)
    end
    return self
end

function class:XPHandicap(handicap)
    if  not handicap then
        return GetPlayerHandicapXP(self.handle)
    else
        SetPlayerHandicapXP(self.handle, handicap)
    end
    return self
end

function class:techMaxAllowed(techid, maximum)
    techid = formatIntCC(techid)
    if  not maximum then
        return GetPlayerTechMaxAllowed(self.handle, techid)
    else
        SetPlayerTechMaxAllowed(self.handle, techid, maximum)
    end
    return self
end

function class:addTechResearched(techid, levels)
    AddPlayerTechResearched(self.handle, formatIntCC(techid), levels)
    return self
end

function class:decTechResearched(techid, levels)
    BlzDecPlayerTechResearched(self.handle, formatIntCC(techid), levels)
    return self
end

function class:techResearched(techid, setToLevel_OR_specificOnly)
    techid = fourCC(techid)
    if  type(setToLevel_OR_specificOnly)=='boolean' then
        return GetPlayerTechResearched(self.handle, techid, setToLevel_OR_specificOnly)
    else
        SetPlayerTechResearched(self.handle, techid, setToLevel_OR_specificOnly)
    end
    return self
end

function class:techCount(techid, specificonly)
    return GetPlayerTechCount(self.handle, formatIntCC(techid), specificonly)
end

function class:unitsOwner(newOwner)
    SetPlayerUnitsOwner(self.handle, newOwner)
    return self
end

function class:cripple(toWhichPlayers, flag)
    CripplePlayer(self.handle, toWhichPlayers, flag)
    return self
end

function class:abilityAvailable(abilid, avail)
    SetPlayerAbilityAvailable(self.handle, fourCC(abilid), avail)
    return self
end

function class:remove(gameResult)
    RemovePlayer(self.handle, gameResult)
    return self
end

-- Used to store hero level data for the scorescreen
-- before units are moved to neutral passive in melee games
--
function class:cacheHeroData()
    CachePlayerHeroData(self.handle)
    return self
end

function class:requestExtraIntegerData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraIntegerData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end

function class:requestExtraBooleanData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraBooleanData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end

function class:requestExtraStringData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraStringData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end

function class:requestExtraRealData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraRealData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end