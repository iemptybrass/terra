ffi.cdef ( [[ char *getcwd ( char *buffer, size_t size ); ]] )

local fail =
  { "getcwd failed", }

return ( function ( )
  local buffer = ffi.new ( "char[?]", 4096 )
  local ok, cwd = pcall ( function ( )
    return ffi.C.getcwd ( buffer, 4096 )
  end )
  if not ok
    then
      error ( fail[1], 2 )
  end
  return ffi.string ( cwd )
end ) ( )