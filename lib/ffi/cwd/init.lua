local ffi = require("ffi")
if not _G.getcwd
  then
    ffi.cdef([[char *getcwd(char *buf, size_t size);]])
    _G.getcwd = true
end
return function()
    local buffer = ffi.new("char[?]", 4096)
    return (ffi.C.getcwd(buffer, 4096)
        and ffi.string(buffer))
        or nil, "error"
end
