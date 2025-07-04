package.path = "./?/init.lua;./?.lua;" .. package.path

local modules =
  { "bootstrap",
    "src", }

local fail =
  { "Failed to require module ", }

return ( function ( )
  for _, name
    in ipairs ( modules ) do
      local ok, mod = pcall ( require, name )
      if not ok
        then
          error ( fail[1] .. name .. ": " .. tostring ( mod ), 2 )
      end
      require ( name )
  end
end ) ( )