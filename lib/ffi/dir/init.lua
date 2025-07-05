ffi.cdef ( [[ typedef struct __dirstream DIR; ]] )
ffi.cdef ( [[ typedef struct {
                uint64_t d_ino;
                int64_t  d_off;
                unsigned short d_reclen;
                unsigned char d_type;
                char d_name[256]; } dirent; ]] )

local path, modules =
  ( ( ... ) .. "." ),
  { "open",
    "close",
    "read", }

local fail =
  { "Failed to load module ", }

return ( function ( directory )
  for i = 1, #modules do
    local ok, mod = pcall ( require, path .. modules[i] )
    if not ok
      then
        error ( fail[1] .. path .. modules[i], 2 )
    end
    directory[modules[i]] = mod
  end
  local raw = directory[modules[1]]
  directory[modules[1]] = ( function ( input )
    local handle = raw ( input )
    for i = 2, #modules do
      handle[modules[i]] = function ( self, ... )
        return directory[modules[i]] ( self, ... )
      end
    end
    return handle
  end )
  return directory
end ) ( { } )
