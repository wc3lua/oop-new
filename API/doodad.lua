--============================================================================
-- Doodad API
--

---@class Doodad
Doodad = newClass()
local class = Doodad

---@param x real
---@param y real
---@param radius real
---@param doodadID integer
---@param nearestOnly boolean
---@param animName string
---@param animRandom boolean
function class:setAnimation(x, y, radius, doodadID, nearestOnly, animName, animRandom)
    SetDoodadAnimation(x, y, radius, doodadID, nearestOnly, animName, animRandom)
end

---@param r rect
---@param doodadID integer
---@param animName string
---@param animRandom boolean
function class:setAnimationRect(r, doodadID, animName, animRandom)
    SetDoodadAnimationRect(r, doodadID, animName, animRandom)
end