return ( function ( ... )
  local required = { ... }
  for i, name
    in ipairs ( required ) do
      _G[name] = require ( name )
      required[i] = _G[name]
  end
  return unpack ( required )
end ) ( "ffi", "bit" )
