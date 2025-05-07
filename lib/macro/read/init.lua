return function(input, arg)
  local buffer = arg.open(input)
  local names, types = {}, {}
  local map = { ["4"] = "directory", ["8"] = "file" }
  while true do
    local dname, dtype = buffer:read()
    if not dname
      then
        break
    end
    for i, value in ipairs({ dname, dtype }) do
      if dname:sub(1, 1) == "."
        then
          break
      end
      local target = i == 1 and names or types
      target[#target+1] = i == 2 and map[value] or value
    end
  end
  buffer:close()
  local result = {}
  for i = 1, #names do
    result[#result+1] = string.format('{"name":"%s", "type":"%s"}', names[i], types[i])
  end
  return table.concat(result, " ")
end
