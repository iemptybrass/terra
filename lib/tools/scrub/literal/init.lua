return function(self)
  local text = self.input
  local out, captures = {}, {}
  local i, len = 1, #text
  local mode, start, index = nil, 0, 1

  while i <= len do
    local c = text:sub(i, i)
    local next2 = text:sub(i, i + 1)

    if not mode then
      if next2 == "''" then
        mode = "long"
        start = i + 2
        table.insert(out, "<" .. index .. ">")
        i = i + 2
      elseif c == "'" or c == '"' then
        mode = c
        start = i + 1
        table.insert(out, "<" .. index .. ">")
        i = i + 1
      else
        table.insert(out, c)
        i = i + 1
      end
    else
      if mode == "long" and next2 == "''" then
        captures[index] = text:sub(start, i - 1)
        mode = nil
        index = index + 1
        i = i + 2
      elseif mode ~= "long" and c == mode then
        captures[index] = text:sub(start, i - 1)
        mode = nil
        index = index + 1
        i = i + 1
      else
        i = i + 1
      end
    end
  end

  self.input = table.concat(out)
  self.content = captures
  return self
end
