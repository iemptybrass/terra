ffi.cdef ( [[ typedef struct __dirstream DIR; ]] )

local path, modules =
( (...) .. "." ),
{ "open",
  "close",
  "read" }
return ( function ( directory )
  for i = 1, #modules do
    directory[ modules[i] ] = require ( path .. modules[i] )
  end
  local raw = directory[ modules[1] ]
  directory[ modules[1] ] = function ( input )
    local handle = raw ( input )
    for i = 2, #modules do
      handle[ modules[i] ] = function ( self, ... )
        return directory[ modules[i] ] ( self, ... )
      end
    end
    return handle
  end
  return directory
end ) ( {} )
