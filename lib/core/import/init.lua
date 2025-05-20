return ( function ( ... )
  local prefix = debug.getinfo ( 2, "S" ).source
    :gsub("^@%./(.-/?)[^/]+%..+$", function ( string )
    return ( string ):gsub( "/", "." ) end )
  for _, name in ipairs( { ... } ) do
    rawset ( getfenv (2), name, require ( prefix .. name ) )
  end
end )
