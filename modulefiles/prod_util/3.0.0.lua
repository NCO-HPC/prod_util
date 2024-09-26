help([[Set environment variables for production utilities
]])

local pkgName = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()
local hierA        = hierarchyA(pkgNameVer,1)
local compNameVer  = hierA[1]
local opt = os.getenv("PROD_UTIL") 
local optdir = pathJoin(opt)
conflict(pkgName)

if ( isDir(opt) ) then
        base = opt
        if ( mode() == "show" ) then
                LmodMessage("PROD_UTIL",base)
        end
else
        base = myFileName():gsub("/modulefiles.*","")
end

if ( isDir("/lfs/h1/ops/prod") ) then 
        --[ Verify if system is WCOSS, dogwood or cactus, and set root dirs. --]
        setenv("COMDATEROOT","/lfs/h1/ops/prod/com")
        setenv("COMLISTROOT","/lfs/h1/ops/prod/config")
        setenv("COMLOGSROOT","/lfs/h1/ops/prod/com")
end

setenv("UTILROOT", base)
setenv("MDATE",pathJoin(base,"exec/mdate"))
setenv("NDATE",pathJoin(base,"exec/ndate"))
setenv("NHOUR",pathJoin(base,"exec/nhour"))
setenv("FSYNC",pathJoin(base,"exec/fsync_file"))
prepend_path("PATH",pathJoin(base,"ush"))
prepend_path("PYTHONPATH",pathJoin(base,"ush"))

whatis("Name: ".. pkgName)
whatis("Version: " .. pkgVersion)
whatis("Category: library")
whatis("Description: " .. pkgName .. " library")
whatis("This module loads and sets environment variables for the NCEP Central Operations production utilities. ")
