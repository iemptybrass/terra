local path, modules =
  ( ( ... ) .. "." ),
  { "cwd",
    "dir", }

local fail =
  { "Failed to require module ", }

return ( function ( )
  for _, name
    in ipairs ( modules ) do
      local ok, mod = pcall ( require, path .. name )
      if not ok
        then
          error ( fail[1] .. path .. name .. ": " .. tostring ( mod ), 2 )
      end
      rawset ( _G, name, mod )
  end
end ) ( )