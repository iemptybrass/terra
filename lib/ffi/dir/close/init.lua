ffi.cdef([[ int closedir(DIR *dirp); ]])

return function(input)
  return ffi.C.closedir(assert(input)) == 0
end
