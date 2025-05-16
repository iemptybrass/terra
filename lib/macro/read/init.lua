return (function(input, arg)
  local result, buffer = {}, arg.open(input, "rb")
  local map = { ["4"] = "directory", ["8"] = "file" }
  while true do
    local dname, dtype = buffer:read("*a")
    if not (dname and dtype)
      then
        buffer:close()
        return dname or table.concat(result, " ")
    end
    if dname:sub(1, 1) ~= "."
      then
        local parts, dtype = {}, map[dtype]
        for _, item in ipairs({ { "name", dname }, { "type", dtype } }) do
          parts[#parts + 1] = ('"%s":"%s"'):format(item[1], item[2])
        end
        result[#result + 1] = "{" .. table.concat(parts, ", ") .. "}"
    end
  end
end)
