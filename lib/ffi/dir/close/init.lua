ffi.cdef ( [[ int closedir ( DIR *dirp ); ]] )

local fail =
  { "invalid handle",
    "invalid directory pointer", }

return ( function ( handle )
  assert ( handle, fail[1] )
  assert ( handle._dir, fail[2] )
  return ffi.C.closedir ( handle._dir )
end )
