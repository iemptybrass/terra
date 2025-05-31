ffi.cdef ( [[ char *getcwd ( char *buf, size_t size ); ]] )

return ( function ( )
  return ffi.string ( ffi.C.getcwd ( ffi.new ( "char[?]", 4096 ), 4096 ) )
end ) ( )