--============================================================================
-- Campaign API

Campaign = newClass()
local class = Campaign

function class:setTutorialCleared(cleared)
    SetTutorialCleared(cleared)
end

function class:setMissionAvailable(campaignNumber, missionNumber, available)
    SetMissionAvailable(campaignNumber, missionNumber, available)
end

function class:setCampaignAvailable(campaignNumber, available)
    SetCampaignAvailable(campaignNumber, available)
end

function class:setOpCinematicAvailable(campaignNumber, available)
    SetOpCinematicAvailable(campaignNumber, available)
end

function class:setEdCinematicAvailable(campaignNumber, available)
    SetEdCinematicAvailable(campaignNumber, available)
end

function class:getDefaultDifficulty()
    return GetDefaultDifficulty()
end

function class:setDefaultDifficulty(g)
    SetDefaultDifficulty(g)
end

function class:setCustomCampaignButtonVisible(whichButton, visible)
    SetCustomCampaignButtonVisible(whichButton, visible)
end

function class:getCustomCampaignButtonVisible(whichButton)
    return GetCustomCampaignButtonVisible(whichButton)
end

function class:DoNotSaveReplay()
    DoNotSaveReplay()
end