ffi.cdef([[
  struct dirent {
    unsigned long d_ino;
    unsigned long d_off;
    unsigned short d_reclen;
    unsigned char d_type;
    char d_name[256]; };
  struct dirent *readdir(void *dirp); ]])

return function(input)
  return ffi.C.readdir(assert(input))
end
