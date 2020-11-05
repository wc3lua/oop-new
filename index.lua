-- зависимости
require 'OtherFunctions.index'
require 'Lua-OOP-template.index'

-- содержимое

-- объекты РО
---@param func function
---@return boolean
function compiletime(func) end

require 'OOP-New.objects.WarObject'
require 'OOP-New.objects.WarObjects'
require 'OOP-New.objects.WarMapObjects'
require 'OOP-New.objects.WarMap'

WarObject = require 'OOP-New.objects.WarObject'
WarObjects = require 'OOP-New.objects.WarObjects'
WarMapObjects = require 'OOP-New.objects.WarMapObjects'
WarMap = require 'OOP-New.objects.WarMap'