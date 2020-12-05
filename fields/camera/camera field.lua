---@class CameraField:ClassConvert
CameraField = extendedClass(ClassConvert)
local class = CameraField

---@param i integer
---@return camerafield
function class:convert(i)
    return ConvertCameraField(i)
end

class.TargetDistance = class:convert(0)
class.Farz = class:convert(1)
class.AngleOfAttack = class:convert(2)
class.FieldOfView = class:convert(3)
class.Roll = class:convert(4)
class.Rotation = class:convert(5)
class.ZOffset = class:convert(6)
class.Nearz = class:convert(7)
class.LocalPitch = class:convert(8)
class.LocalYaw = class:convert(9)
class.LocalRoll = class:convert(10)