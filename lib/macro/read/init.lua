return function(input, arg)
  local buffer = arg.open(input)
  local content = { d_name = {}, d_type = {} }

  while true do
    local dname, dtype = buffer:read()
    if not dname then break end
    for i, value in ipairs({ dname, dtype or "" }) do
      table.insert(content[i == 1 and "d_name" or "d_type"], value)
    end
  end

  buffer:close()

  local result = {}
  for i = 1, #content.d_name do
    table.insert(result, content.d_name[i] .. " " .. content.d_type[i] .. ",")
  end
  return table.concat(result, " ")
end
