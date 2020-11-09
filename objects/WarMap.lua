---@class ClassWarMap
WarMap = {}

-- Encapsulates a WC3 map during the compilation stage.
---@class WarMap
function WarMap:new()
    local obj = {} ---@type WarMap

    -- /** Reference to all object storage in this map. */
    obj.objects = {} ---@type WarMapObjects

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
    function obj:readFile(path) end

    -- /**
    -- * Adds a directory to the map, preserving the file hierarcy.
    -- * Note: the directory will only be written when writeToDir() or writeToMpq() has been called.
    -- */
    ---@param path string
    function obj:addDir(path) end

    -- /**
    -- * Adds a file to the map with the specified content as a string.
    -- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
    -- */
    ---@param archivePath string
    ---@param contents string
    function obj:addFileString(archivePath,contents) end

    -- /**
    -- * Adds a file to the map, reading it from disk at the specified lcoation.
    -- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
    -- */
    ---@param archivePath string
    ---@param diskPath string
    function obj:addFileDisk(archivePath,diskPath) end

    -- /**
    -- * Writes the map and all manually added files to the specified directory.
    -- */
    ---@param path string
    function obj:writeToDir(path) end

    -- /**
    -- * Writes the map and all manually added files to an MPQ archive at the specified path.
    -- */
    ---@param path string
    function obj:writeToMpq(path) end

    -- /**
    -- * Initializes an object storage for the specified extension type.
    -- * This will read objects already present in the map if appropriate.
    -- */
    ---@param ext string
    function obj:initObjectStorage(ext) end

    -- /**
    -- * Initializes all object storages in the map.
    -- */
    function obj:initObjects() end

    -- /**
    -- * Writes out all the object storages to their respective files in the map.
    -- */
    ---@param objects WarObjects
    function obj:commitObjectStorage(objects) end

    assignClass(obj, self)
    return obj
end

currentMap = WarMap:new()