--============================================================================
-- Doodad API
--

Doodad = newClass()
local class = Doodad

function class:setAnimation(x, y, radius, doodadID, nearestOnly, animName, animRandom)
    SetDoodadAnimation(x, y, radius, doodadID, nearestOnly, animName, animRandom)
end

function class:setAnimationRect(r, doodadID, animName, animRandom)
    SetDoodadAnimationRect(r, doodadID, animName, animRandom)
end