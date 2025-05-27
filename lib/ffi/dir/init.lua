ffi.cdef ( [[ typedef struct __dirstream DIR; ]] )

local path, modules =
  ( (...) .. "." ),
  { "open",
    "close",
    "read", }
return ( function ( directory )
  for i = 1, #modules do
    directory[modules[i]] = require ( path .. modules[i] )
  end
  local raw = directory[modules[1]]
  local handle = {
    open = ( function ( input )
      local handle = raw ( input )
      for i = 2, #modules do
        local name = modules[i]
        handle[name] = function ( self, ... )
          return directory[name] ( self, ... )
        end
      end
      return handle
    end ), }
  directory[modules[1]] = handle.open
  return directory
end ) ( { } )
