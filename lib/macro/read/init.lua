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
        return buffer:close(), dname
    end
    if dname:sub(1, 1) ~= "."
      then
        local dtype = map[dtype]
        result[#result + 1] = ('{"name":"%s","type":"%s"}'):format(dname, dtype)
    end
  end
  buffer:close()
  return table.concat(result, " ")
end)