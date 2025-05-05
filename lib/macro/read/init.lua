return function(input, arg)
  local buffer, content = arg.open(input), {}
  if arg == dir
    then
      while true do
        local entry = arg.read(buffer)
        if entry == nil then break end
        local read = ffi.string(entry.d_name)
        table.insert(content, read)
      end
      arg.rewind(buffer)
  end
  if arg == io
    then
      local read = buffer:read("*all")
      table.insert(content, read)
  end
  arg.close(buffer)
  return table.concat(content, " ")
end
