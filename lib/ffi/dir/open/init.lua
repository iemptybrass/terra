ffi.cdef ( [[ DIR *opendir ( const char *name ); ]] )

local fail =
  { "path is required",
    "failed to open path ", }

return ( function ( input )
  assert ( input, fail[1] )
  assert ( ffi.C.opendir ( input ) ~= nil, fail[2] .. input )
  return { _dir = ffi.C.opendir ( input ) }
end )
