  local type = {
    ["4"] = ( function ( ... )
      return ( '{"name":"%s","type":"directory"}' ):format ( ... )
    end ),
    ["8"] = ( function ( ... )
      return ( '{"name":"%s","type":"file"}' ):format ( ... )
    end ), }

local fail =
  { "both arguments are required", }

return ( function ( input, arg )
  assert ( arg, fail[1] )
  local buffer = arg.open ( input, "rb" )
  local result = { }
  repeat
    local dname, dtype = buffer:read ( "*a" )
    if not ( dname and dtype )
      then
        buffer:close ( )
        return dname or table.concat ( result, "\n" )
    end
    if dname:sub ( 1, 1 ) ~= "."
      then
        result[#result + 1] = type[dtype] ( dname )
    end
  until not ( dname and dtype )
end )