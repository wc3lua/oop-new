Cinematic = newClass()
local class = Cinematic

function class:setScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
    SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
end

function class:EndScene()
    EndCinematicScene()
end

function class:ForceSubtitles(flag)
    ForceCinematicSubtitles(flag)
end