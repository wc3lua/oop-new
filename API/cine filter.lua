CineFilter = newClass()
local class = CineFilter

function class:setTexture(filename)
    SetCineFilterTexture(filename)
end

function class:setBlendMode(whichMode)
    SetCineFilterBlendMode(whichMode)
end

function class:setTexMapFlags(whichFlags)
    SetCineFilterTexMapFlags(whichFlags)
end

function class:setStartUV(minu, minv, maxu, maxv)
    SetCineFilterStartUV(minu, minv, maxu, maxv)
end

function class:setEndUV(minu, minv, maxu, maxv)
    SetCineFilterEndUV(minu, minv, maxu, maxv)
end

function class:setStartColor(red, green, blue, alpha)
    SetCineFilterStartColor(red, green, blue, alpha)
end

function class:setEndColor(red, green, blue, alpha)
    SetCineFilterEndColor(red, green, blue, alpha)
end

function class:setDuration(duration)
    SetCineFilterDuration(duration)
end

function class:display(flag)
    DisplayCineFilter(flag)
end

function class:isDisplayed()
    IsCineFilterDisplayed()
end