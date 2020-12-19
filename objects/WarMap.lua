---@class ClassWarMap
ClassWarMap = newClass()
---@class WarMap

local class = ClassWarMap

-- Encapsulates a WC3 map during the compilation stage.
---@return WarMap
function class:new()
    return newObject(self)
end

-- /** Reference to all object storage in this map. */
class.objects = {} ---@type WarMapObjects

-- /**
-- * Reads a file from the map. Returns the file contents as a
-- * string upon success, or false + an error message upon failure.
-- *
-- * This function will also "see" any files previously added to the map
-- * via `addFileString`, `addFileDisk` or `addDir`.
-- *
-- * @tupleReturn
-- */
---@param path string
---@return string|table
function class:readFile(path) end

-- /**
-- * Adds a directory to the map, preserving the file hierarcy.
-- * Note: the directory will only be written when writeToDir() or writeToMpq() has been called.
-- */
---@param path string
function class:addDir(path) end

-- /**
-- * Adds a file to the map with the specified content as a string.
-- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
-- */
---@param archivePath string
---@param contents string
function class:addFileString(archivePath, contents) end

-- /**
-- * Adds a file to the map, reading it from disk at the specified lcoation.
-- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
-- */
---@param archivePath string
---@param diskPath string
function class:addFileDisk(archivePath,diskPath) end

-- /**
-- * Writes the map and all manually added files to the specified directory.
-- */
---@param path string
function class:writeToDir(path) end

-- /**
-- * Writes the map and all manually added files to an MPQ archive at the specified path.
-- */
---@param path string
function class:writeToMpq(path) end

-- /**
-- * Initializes an object storage for the specified extension type.
-- * This will read objects already present in the map if appropriate.
-- */
---@param ext string
function class:initObjectStorage(ext) end

-- /**
-- * Initializes all object storages in the map.
-- */
function class:initObjects() end

-- /**
-- * Writes out all the object storages to their respective files in the map.
-- */
---@param objects WarObjects
function class:commitObjectStorage(objects) end

currentMap = ClassWarMap:new()