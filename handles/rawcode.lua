---@class Rawcode
RawCode = newClass()
local class = RawCode

---@param id rawcode
---@return Rawcode
function class:new(id)
    self.id = formatIntCC(id)
    self.stringId = formatStringCC(id)
    return newObject(self)
end

---@param id Rawcode|rawcode
---@return integer
function class:formatInt(id)
    if instanceof(id, class) then
        return id.id
    else
        return formatIntCC(id)
    end
end

---@param stringId Rawcode|rawcode
---@return string
function class:formatString(stringId)
    if instanceof(stringId, class) then
        return stringId.stringId
    else
        return formatStringCC(stringId)
    end
end