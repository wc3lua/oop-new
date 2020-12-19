ClassWarMap = newClass()

local class = ClassWarMap

-- Encapsulates a WC3 map during the compilation stage.
function class:new()
    return newObject(self)
end

-- /** Reference to all object storage in this map. */
class.objects = {}

-- /**
-- * Reads a file from the map. Returns the file contents as a
-- * string upon success, or false + an error message upon failure.
-- *
-- * This function will also "see" any files previously added to the map
-- * via `addFileString`, `addFileDisk` or `addDir`.
-- *
-- * @tupleReturn
-- */
function class:readFile(path) end

-- /**
-- * Adds a directory to the map, preserving the file hierarcy.
-- * Note: the directory will only be written when writeToDir() or writeToMpq() has been called.
-- */
function class:addDir(path) end

-- /**
-- * Adds a file to the map with the specified content as a string.
-- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
-- */
function class:addFileString(archivePath, contents) end

-- /**
-- * Adds a file to the map, reading it from disk at the specified lcoation.
-- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
-- */
function class:addFileDisk(archivePath,diskPath) end

-- /**
-- * Writes the map and all manually added files to the specified directory.
-- */
function class:writeToDir(path) end

-- /**
-- * Writes the map and all manually added files to an MPQ archive at the specified path.
-- */
function class:writeToMpq(path) end

-- /**
-- * Initializes an object storage for the specified extension type.
-- * This will read objects already present in the map if appropriate.
-- */
function class:initObjectStorage(ext) end

-- /**
-- * Initializes all object storages in the map.
-- */
function class:initObjects() end

-- /**
-- * Writes out all the object storages to their respective files in the map.
-- */
function class:commitObjectStorage(objects) end

currentMap = ClassWarMap:new()