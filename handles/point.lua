---@class Point
Point = newClass()
local class = Point

function class:new(x, y, z)
    self.coordX = defaultValue(x, 0)
    self.coordY = defaultValue(y, 0)
    self.coordZ = defaultValue(z, 0)
    return newObject(self)
end

function class:x(x)
    if  not x then
        return self.coordX
    else
        self.coordX = x
        return self
    end
end

function class:y(y)
    if  not y then
        return self.coordY
    else
        self.coordY = y
        return self
    end
end

function class:z(z)
    if  not z then
        return self.coordZ
    else
        self.coordZ = z
        return self
    end
end

function class:getX()
    return self.coordX
end

function class:getY()
    return self.coordY
end

function class:getZ()
    return self.coordZ
end

function class:setX(x)
    return self:x(x)
end

function class:setY(y)
    return self:y(y)
end

function class:move(x,y,z)
    self.coordX = x
    self.coordY = y
    self.coordZ = z
    return self
end

function class:isBlighted()
    return IsPointBlighted(self.coordX, self.coordY)
end