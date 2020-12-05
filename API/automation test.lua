-- Automation Test
---@class AutomationTest
AutomationTest = newClass()
local class = AutomationTest

---@param testType string
function class:setType(testType)
    AutomationSetTestType(testType)
end

---@param testName string
function class:start(testName)
    AutomationTestStart(testName)
end

function class:End()
    AutomationTestEnd()
end

function class:finished()
    AutomationTestingFinished()
end