-- Automation Test
AutomationTest = newClass()
local class = AutomationTest

function class:setType(testType)
    AutomationSetTestType(testType)
end

function class:start(testName)
    AutomationTestStart(testName)
end

function class:End()
    AutomationTestEnd()
end

function class:finished()
    AutomationTestingFinished()
end