return function(input, arg)
  local buffer = arg.open(input)
  local result, map = {}, { ["4"] = "directory", ["8"] = "file" }
  while true do
    local dname, dtype = buffer:read()
    if not dname
      then
        break
    end
    if dname:sub(1, 1) ~= "." 
      then
        local ftype = map[dtype] or dtype
        result[#result+1] = string.format('{"name":"%s", "type":"%s"}', dname, ftype)
    end
  end
  buffer:close()
  return table.concat(result, " ")
end
