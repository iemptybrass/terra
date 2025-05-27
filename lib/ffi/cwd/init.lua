ffi.cdef ( [[ char *getcwd ( char *buf, size_t size ); ]] )

return ( function ( )
  local buffer = ffi.new ( "char[?]", 4096 )
  return ffi.string ( ffi.C.getcwd ( buffer, 4096 ) )
end ) ( )