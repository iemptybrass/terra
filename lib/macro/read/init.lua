return ( function ( input, arg )
  local buffer = arg.open( input, "rb" )
  local type, result = {
    ["4"] = ( function ( ... )
      return ( '{"name":"%s","type":"directory"}' ):format ( ... )
    end ),
    ["8"] = ( function ( ... )
      return ( '{"name":"%s","type":"file"}' ):format ( ... )
    end ), }, { }
  while true do
    local dname, dtype = buffer:read ( "*a" )
    if not ( dname and dtype )
      then
        buffer:close ( )
        return dname or table.concat ( result, " " )
    end
    if dname:sub( 1, 1 ) ~= "."
      then
        result[#result + 1] = type[dtype] ( dname )
    end
  end
end )