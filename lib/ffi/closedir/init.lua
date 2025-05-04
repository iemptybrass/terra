local ffi = require("ffi")
if not _G.closedir
  then
    ffi.cdef([[ int closedir(DIR *dirp); ]])
    _G.closedir = true
end
return function(input)
  return assert(input, "error")
  and ffi.C.closedir(input) == 0
end