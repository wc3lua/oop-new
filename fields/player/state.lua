PlayerState = extendedClass(ClassConvert)
local class = PlayerState

function class:convert(i)
    return ConvertPlayerState(i)
end

class.ResourceGold = class:convert(1)
class.ResourceLumber = class:convert(2)
class.ResourceHeroTokens = class:convert(3)
class.ResourceFoodCap = class:convert(4)
class.ResourceFoodUsed = class:convert(5)
class.FoodCapCeiling = class:convert(6)

class.GivesBounty = class:convert(7)
class.AlliedVictory = class:convert(8)
class.Placed = class:convert(9)
class.OnDeathObserver = class:convert(10)
class.Observer = class:convert(11)
class.Unfollowable = class:convert(12)
-- taxation rate for each resource
--
class.GoldUpkeepRate = class:convert(13)
class.LumberUpkeepRate = class:convert(14)
-- cumulative resources collected by the player during the mission
--
class.GoldGathered = class:convert(15)
class.LumberGathered = class:convert(16)
class.NoCreepSleep = class:convert(25)