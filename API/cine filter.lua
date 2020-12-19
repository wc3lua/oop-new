---@class CineFilter
CineFilter = newClass()
local class = CineFilter

---@param filename string
function class:setTexture(filename)
    SetCineFilterTexture(filename)
end

---@param whichMode blendmode
function class:setBlendMode(whichMode)
    SetCineFilterBlendMode(whichMode)
end

---@param whichFlags texmapflags
function class:setTexMapFlags(whichFlags)
    SetCineFilterTexMapFlags(whichFlags)
end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function class:setStartUV(minu, minv, maxu, maxv)
    SetCineFilterStartUV(minu, minv, maxu, maxv)
end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function class:setEndUV(minu, minv, maxu, maxv)
    SetCineFilterEndUV(minu, minv, maxu, maxv)
end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function class:setStartColor(red, green, blue, alpha)
    SetCineFilterStartColor(red, green, blue, alpha)
end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function class:setEndColor(red, green, blue, alpha)
    SetCineFilterEndColor(red, green, blue, alpha)
end

---@param duration real
function class:setDuration(duration)
    SetCineFilterDuration(duration)
end

---@param flag boolean
function class:display(flag)
    DisplayCineFilter(flag)
end

---@return boolean
function class:isDisplayed()
    IsCineFilterDisplayed()
end