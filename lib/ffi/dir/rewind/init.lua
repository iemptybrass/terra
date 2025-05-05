ffi.cdef([[ void rewinddir(DIR *dirp); ]])

return function(input)
  return ffi.C.rewinddir(input)
end