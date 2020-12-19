---@class Rawcode
RawCode = newClass()
local class = RawCode

function class:new(id)
    self.id = formatIntCC(id)
    self.stringId = formatStringCC(id)
    return newObject(self)
end

function class:formatInt(id)
    if instanceof(id, class) then
        return id.id
    else
        return formatIntCC(id)
    end
end

function class:formatString(stringId)
    if instanceof(stringId, class) then
        return stringId.stringId
    else
        return formatStringCC(stringId)
    end
end