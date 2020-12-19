--============================================================================
-- Computer AI interface
--

AI = newClass()
local class = AI

function class:startMelee(num, script)
    StartMeleeAI(num, script)
end

function class:startCampaign(num, script)
    StartCampaignAI(num, script)
end

function class:command(num, command, data)
    CommandAI(num, command, data)
end

function class:pauseComp(p, pause)
    PauseCompAI(p, pause)
end

function class:getDifficulty(num)
    GetAIDifficulty(num)
end


function class:removeGuardPosition(hUnit)
    RemoveGuardPosition(hUnit)
end

function class:recycleGuardPosition(hUnit)
    RecycleGuardPosition(hUnit)
end

function class:removeAllGuardPositions(num)
    RemoveAllGuardPositions(num)
end