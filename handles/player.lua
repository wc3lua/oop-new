---@class Player:Handle
ClassPlayer = extendedClass(ClassHandle)

local class = ClassPlayer

---@param playerHandle player
---@return Player
function class:new(playerHandle)
    self.handle = playerHandle
    return newObject(self)
end

---@param number integer
function class:get(number)
    return self:new(Player(number))
end

function class:getLocal()
    return self:new(GetLocalPlayer())
end

function class:triggered()
    return self:new(GetTriggerPlayer())
end

function class:enumed()
    return self:new(GetEnumPlayer())
end

function class:filtered()
    return self:new(GetFilterPlayer())
end

---@param whichUnit Unit
function class:owner(whichUnit)
    return self:new(GetOwningPlayer(whichUnit.handle))
end

---@param whichItem Item
function class:fromItem(whichItem)
    return self:new(GetItemPlayer(whichItem.handle))
end


---@param otherPlayer Player
---@return boolean
function class:isAlly(otherPlayer)
    return IsPlayerAlly(self.handle, otherPlayer.handle)
end

---@param otherPlayer Player
---@return boolean
function class:isEnemy(otherPlayer)
    return IsPlayerEnemy(self.handle, otherPlayer.handle)
end

---@param whichForce Force
---@return boolean
function class:isInForce(whichForce)
    return IsPlayerInForce(self.handle, whichForce.handle)
end

---@return boolean
function class:isObserver()
    return IsPlayerObserver(self.handle)
end

---@param x real
---@param y real
---@return boolean
function class:isCoordsVisible(x,y)
    return IsVisibleToPlayer(x,y,self.handle)
end

---@param p Point
---@return boolean
function class:isPointVisible(p)
    return self:isCoordsVisible(p:getX(), p:getY())
end

---@param whichLocation Location
---@return boolean
function class:isLocationVisible(whichLocation)
    return IsLocationVisibleToPlayer(whichLocation.handle, self.handle)
end

---@param x real
---@param y real
---@return boolean
function class:isCoordsFogged(x, y)
    return IsFoggedToPlayer(x, y, self.handle)
end

---@param p Point
---@return boolean
function class:isPointFogged(p)
    return self:isCoordsFogged(p:getX(), p:getY())
end

---@param whichLocation Location
---@return boolean
function class:isLocationFogged(whichLocation)
    return IsLocationFoggedToPlayer(whichLocation.handle, self.handle)
end

---@param x real
---@param y real
---@return boolean
function class:isCoordsMasked(x, y)
    return IsMaskedToPlayer(x, y, self.handle)    
end

---@param whichLocation Location
---@return boolean
function class:isLocationMasked(whichLocation)
    return IsLocationMaskedToPlayer(whichLocation.handle, self.handle)
end

---@param p Point
---@return boolean
function class:isPointMasked(p)
    return self:isCoordsMasked(p:getX(), p:getY())
end

---@return race
function class:race()
    return GetPlayerRace(self.handle)
end

---@return integer
function class:id()
    return GetPlayerId(self.handle)
end

---@param includeIncomplete boolean
---@return integer
function class:unitCount(includeIncomplete)
    return GetPlayerUnitCount(self.handle, includeIncomplete)
end

---@param unitName string
---@param includeIncomplete boolean
---@param includeUpgrades boolean
---@return integer
function class:typedUnitCount(unitName, includeIncomplete, includeUpgrades)
    return GetPlayerTypedUnitCount(self.handle, unitName, includeIncomplete, includeUpgrades)
end

---@param includeIncomplete boolean
---@return integer
function class:structureCount(includeIncomplete)
    return GetPlayerStructureCount(self.handle, includeIncomplete)
end

---@param whichPlayerState playerstate
---@param value integer|nil
function class:state(whichPlayerState, value)
    if  not value then
        return GetPlayerState(self.handle, whichPlayerState)
    else
        SetPlayerState(self.handle, whichPlayerState, value)
    end
    return self
end

---@param whichPlayerScore playerscore
---@return integer
function class:score(whichPlayerScore)
    return GetPlayerScore(self.handle, whichPlayerScore)
end

---@param otherPlayer Player
---@param whichAllianceSetting alliancetype
---@return boolean
function class:alliance(otherPlayer, whichAllianceSetting)
    return GetPlayerAlliance(self.handle, whichAllianceSetting)
end

---@param handicap real|nil
function class:handicap(handicap)
    if  not handicap then
        return GetPlayerHandicap(self.handle)
    else
        SetPlayerHandicap(self.handle, handicap)
    end
    return self
end

---@param handicap real
function class:XPHandicap(handicap)
    if  not handicap then
        return GetPlayerHandicapXP(self.handle)
    else
        SetPlayerHandicapXP(self.handle, handicap)
    end
    return self
end

---@param techid integer|string
---@param maximum integer|nil
function class:techMaxAllowed(techid, maximum)
    techid = FormatCC(techid)
    if  not maximum then
        return GetPlayerTechMaxAllowed(self.handle, techid)
    else
        SetPlayerTechMaxAllowed(self.handle, techid, maximum)
    end
    return self
end

---@param techid integer|string
---@param levels integer
function class:addTechResearched(techid, levels)
    AddPlayerTechResearched(self.handle, FormatCC(techid), levels)
    return self
end

---@param techid integer|string
---@param levels integer
function class:decTechResearched(techid, levels)
    BlzDecPlayerTechResearched(self.handle, FormatCC(techid), levels)
    return self
end

---@param techid integer|string
---@param setToLevel_OR_specificOnly integer|boolean
function class:techResearched(techid, setToLevel_OR_specificOnly)
    techid = FourCC(techid)
    if  type(setToLevel_OR_specificOnly)=='boolean' then
        return GetPlayerTechResearched(self.handle, techid, setToLevel_OR_specificOnly)
    else
        SetPlayerTechResearched(self.handle, techid, setToLevel_OR_specificOnly)
    end
    return self
end

---@param techid integer|string
---@param specificonly boolexpr
---@return integer
function class:techCount(techid, specificonly)
    return GetPlayerTechCount(self.handle, FormatCC(techid), specificonly)
end

---@param newOwner integer
function class:unitsOwner(newOwner)
    SetPlayerUnitsOwner(self.handle, newOwner)
    return self
end

---@param toWhichPlayers Force
---@param flag boolean
function class:cripple(toWhichPlayers, flag)
    CripplePlayer(self.handle, toWhichPlayers, flag)
    return self
end

---@param abilid integer|string
---@param avail boolean
function class:abilityAvailable(abilid, avail)
    SetPlayerAbilityAvailable(self.handle, FourCC(abilid), avail)
    return self
end

---@param gameResult playergameresult
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

---@param dataType integer
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return integer
function class:requestExtraIntegerData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraIntegerData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end


---@param dataType integer
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return boolean
function class.requestExtraBooleanData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraBooleanData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end

---@param dataType integer
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return string
function class.requestExtraStringData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraStringData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end

---@param dataType integer
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return real
function class.requestExtraRealData(dataType, param1, param2, param3, param4, param5, param6)
    return RequestExtraRealData(dataType, self.handle, param1, param2, param3, param4, param5, param6)
end


-- ---@param number integer
-- function ClassPlayer:get(number)
--     return self:new(Player(number))
-- end

-- function ClassPlayer:Local()
--     return self:new(GetLocalPlayer())
-- end

-- function ClassPlayer:triggered()
--     return self:new(GetTriggerPlayer())
-- end