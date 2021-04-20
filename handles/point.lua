---@class Point
Point = newClass()
local class = Point

---@param x real
---@param y real
---@param z real
---@return Point
function class:new(x, y, z)
    self.x = x
    self.y = y
    self.z = z
    return newObject(self)
end

---@return real
function class:getX()
    return self.x
end

---@return real
function class:getY()
    return self.y
end

---@return real
function class:getZ()
    return self.z
end

---@param x real
function class:setX(x)
    self.x = x
    return self
end

---@param y real
function class:setY(y)
    self.y = y
    return self
end

---@param z real
function class:setZ(z)
    self.z = z
    return self
end

---@param x real
---@param y real
---@param z real
function class:moveCoords(x, y, z)
    self:setX(x)
    self:setY(y)
    self:setZ(z)
    return self
end

---@alias Pointable Location|Point

---@param p Pointable
function class:movePos(p)
    return self:moveCoords(p:getX(), p:getY(), p:getZ())
end

---@return boolean
function class:isBlighted()
    return IsPointBlighted(self.x, self.y)
end