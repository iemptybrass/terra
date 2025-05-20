local path, modules =
  ( ( ... ) .. "." ),
  { "import",
    "ffi" }
return ( function ()
  for _, name in ipairs ( modules ) do
    rawset ( _G, name, require ( path .. name ) )
  end
end ) ()