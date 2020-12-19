--============================================================================
-- Dialog API
---@class Dialog:Handle
Dialog = extendedClass(Handle)
local class = Dialog

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

function class:setMessage(messageText)
    DialogSetMessage(self.handle, messageText)
    return self
end

function class:addButton(buttonText, hotkey)
    return ClassButton:new(DialogAddButton(self.handle, buttonText, hotkey))
end

function class:addQuitButton(doScoreScreen, buttonText, hotkey)
    return ClassButton:new(DialogAddQuitButton(self.handle, doScoreScreen, buttonText, hotkey))
end

function class:display(whichPlayer, flag)
    DialogDisplay(whichPlayer.handle, self.handle, flag)
    return self
end