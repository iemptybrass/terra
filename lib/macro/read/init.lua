return (function(input, arg)
  local buffer = arg.open(input)
  local result, map = {}, { ["4"] = "directory", ["8"] = "file" }
  while true do
    local dname, dtype = buffer:read("*a")
    if not dname
      then
        break
    end
    if dtype == nil
      then
        buffer:close()
        return (dname)
    end
    if dname:sub(1, 1) ~= "." 
      then
        local dtype = map[dtype]
        local parts = {}
        for _, item in ipairs({ { "name", dname }, { "type", dtype } }) do
          parts[#parts + 1] = ('"%s":"%s"'):format(item[1], item[2])
        end
        result[#result + 1] = "{" .. table.concat(parts, ", ") .. "}"
    end
  end
  buffer:close()
  return table.concat(result, " ")
end)
