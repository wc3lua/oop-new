---@class Cinematic
Cinematic = newClass()
local class = Cinematic

---@param portraitUnitId integer
---@param color playercolor
---@param speakerTitle string
---@param text string
---@param sceneDuration real
---@param voiceoverDuration real
function class:setScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
    SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
end

function class:EndScene()
    EndCinematicScene()
end

---@param flag boolean
function class:ForceSubtitles(flag)
    ForceCinematicSubtitles(flag)
end