---@class Point
ClassPoint = newClass()

local class = ClassPoint

---@param x real
---@param y real
---@param z real
---@return Point
function class:new(x, y, z)
    self.coordX = defaultValue(x, 0)
    self.coordY = defaultValue(y, 0)
    self.coordZ = defaultValue(z, 0)
    return newObject(self)
end

---@param x real
function class:x(x)
    if  not x then
        return self.coordX
    else
        self.coordX = x
        return self
    end
end

---@param y real
function class:y(y)
    if  not y then
        return self.coordY
    else
        self.coordY = y
        return self
    end
end

---@param z real
function class:z(z)
    if  not z then
        return self.coordZ
    else
        self.coordZ = z
        return self
    end
end

---@return real
function class:getX()
    return self.coordX
end

---@return real
function class:getY()
    return self.coordY
end

---@return real
function class:getZ()
    return self.coordZ
end

---@param x real
function class:setX(x)
    return self:x(x)
end

---@param y real
function class:setY(y)
    return self:y(y)
end

---@param x real
---@param y real
---@param z real
function class:move(x,y,z)
    self.coordX = x
    self.coordY = y
    self.coordZ = z
    return self
end

---@return boolean
function class:isBlighted()
    return IsPointBlighted(self.coordX, self.coordY)
end