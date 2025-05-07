ffi.cdef([[ DIR *opendir(const char *name); ]])

return (function(input)
  return { _dir = ffi.C.opendir(assert(input)) }
end)
