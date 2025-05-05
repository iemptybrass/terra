ffi.cdef([[ DIR *opendir(const char *name); ]])

return function(input)
  return ffi.C.opendir(input)
end
