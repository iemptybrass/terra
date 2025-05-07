ffi.cdef([[ int closedir(DIR *dirp); ]])

return function(handle)
  return ffi.C.closedir(assert(handle._dir))
end
