return ( function ( input )
  local queue, result, target = { { input, 1 } }, { }, { }
  local type = {
    directory = ( function ( full, depth, queue )
      queue[#queue + 1] = { full, depth + 1 }
    end ),
    file = ( function ( )
    end ), }
  while #queue > 0 do
    local path, depth = unpack ( table.remove ( queue, 1 ) )
    for block 
      in read ( path, dir ):gmatch ( '{.-}' ) do
        for _, key 
          in ipairs ( { "name", "type" } ) do
            result[key] = block:match ( '"' .. key .. '":"(.-)"' )
        end
        local full = path .. "/" .. result.name
        type[result.type] ( full, depth, queue )
        table.insert ( target, full )
    end
  end
  return table.concat ( target, "\n" )
end )