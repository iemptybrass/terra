local fail =
  { "Failed to require module ", }

return ( function ( ... )
  local required = { ... }
  for i, name
    in ipairs ( required ) do
      local ok, mod = pcall ( require, name )
      if not ok
        then
          error ( fail[1] .. name .. ": " .. tostring ( mod ), 2 )
      end
      _G[name] = mod
      required[i] = mod
  end
  return unpack ( required )
end ) ( "ffi", "bit" )
