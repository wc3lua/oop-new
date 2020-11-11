--============================================================================
-- Dialog API

---@class Dialog:Handle
ClassDialog = extendedClass(ClassHandle)

local class = ClassDialog

---@param dialogHandle dialog
---@return Dialog
function class:new(dialogHandle)
    self.handle = dialogHandle
    return newObject(self)
end

function class:create()
    return self:new(DialogCreate())
end

function class:destroy()
    DialogDestroy(self.handle)
    return self
end

function class:clear()
    DialogClear(self.handle)
    return self
end

---@param messageText string
function class:setMessage(messageText)
    DialogSetMessage(self.handle, messageText)
    return self
end

---@param buttonText string
---@param hotkey integer
function class:addButton(buttonText, hotkey)
    return ClassButton:new(DialogAddButton(self.handle, buttonText, hotkey))
end

---@param doScoreScreen boolean
---@param buttonText string
---@param hotkey integer
function class:addQuitButton(doScoreScreen, buttonText, hotkey)
    return ClassButton:new(DialogAddQuitButton(self.handle, doScoreScreen, buttonText, hotkey))
end

---@param whichPlayer Player
---@param flag boolean
function class:display(whichPlayer, flag)
    DialogDisplay(whichPlayer.handle, self.handle, flag)
    return self
end