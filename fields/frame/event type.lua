---@class TypeEventFrame:ClassConvert
TypeEventFrame = extendedClass(ClassConvert)
local class = TypeEventFrame

---@param i integer
---@return frameeventtype
function class:convert(i)
    return ConvertFrameEventType(i)
end

class.ControlClick = class:convert(1)
class.MouseEnter = class:convert(2)
class.MouseLeave = class:convert(3)
class.MouseUp = class:convert(4)
class.MouseDown = class:convert(5)
class.MouseWheel = class:convert(6)
class.CheckboxChecked = class:convert(7)
class.CheckboxUnchecked = class:convert(8)
class.EditboxTextChanged = class:convert(9)
class.PopupmenuItemChanged = class:convert(10)
class.MouseDoubleclick = class:convert(11)
class.SpiritAnimUpdate = class:convert(12)
class.SliderValueChanged = class:convert(13)
class.DialogCancel = class:convert(14)
class.DialogAccept = class:convert(15)
class.EditboxCenter = class:convert(16)