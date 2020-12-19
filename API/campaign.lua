--============================================================================
-- Campaign API

---@class Campaign
Campaign = newClass()
local class = Campaign

---@param cleared boolean
function class:setTutorialCleared(cleared)
    SetTutorialCleared(cleared)
end

---@param campaignNumber integer
---@param missionNumber integer
---@param available boolean
function class:setMissionAvailable(campaignNumber, missionNumber, available)
    SetMissionAvailable(campaignNumber, missionNumber, available)
end

---@param campaignNumber integer
---@param available boolean
function class:setCampaignAvailable(campaignNumber, available)
    SetCampaignAvailable(campaignNumber, available)
end

---@param campaignNumber integer
---@param available boolean
function class:setOpCinematicAvailable(campaignNumber, available)
    SetOpCinematicAvailable(campaignNumber, available)
end

---@param campaignNumber integer
---@param available boolean
function class:setEdCinematicAvailable(campaignNumber, available)
    SetEdCinematicAvailable(campaignNumber, available)
end

---@return gamedifficulty
function class:getDefaultDifficulty()
    return GetDefaultDifficulty()
end

---@param g gamedifficulty
function class:setDefaultDifficulty(g)
    SetDefaultDifficulty(g)
end

---@param whichButton integer
---@param visible boolean
function class:setCustomCampaignButtonVisible(whichButton, visible)
    SetCustomCampaignButtonVisible(whichButton, visible)
end

---@param whichButton integer
---@return boolean
function class:getCustomCampaignButtonVisible(whichButton)
    return GetCustomCampaignButtonVisible(whichButton)
end

function class:DoNotSaveReplay()
    DoNotSaveReplay()
end