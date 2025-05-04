local ffi = require("ffi")
if not _G.readdir
  then
    ffi.cdef([[
      struct dirent {
        unsigned long d_ino;
        unsigned long d_off;
        unsigned short d_reclen;
        unsigned char d_type;
        char d_name[256]; };
      struct dirent *readdir(void *dirp); ]])
    _G.readdir = true
end
return function(input)
  assert(input, "error")
  local entry = ffi.C.readdir(input)
  if entry == nil
    then
      return nil
    else
      return ffi.string(entry.d_name), entry.d_type
  end
end
