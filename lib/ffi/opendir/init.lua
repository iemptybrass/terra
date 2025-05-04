local ffi = require("ffi")
if not _G.opendir
  then
    ffi.cdef([[
      typedef struct __dirstream DIR;
      DIR *opendir(const char *name); ]])
    _G.opendir = true
end
return function(input)
  return assert(type(input) == "string", "error")
  and ffi.C.opendir(input)
end
