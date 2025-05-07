ffi.cdef([[ typedef struct __dirstream DIR; ]])
local path, modules =
((...).."."),
{ "close",
  "read" }
return (function (dir)
  local all = { "open", unpack(modules) }
  for _, name in ipairs(all) do
    dir[name] = require(path .. name)
  end
  local rawopen = dir.open
  dir.open = function(input)
    local handle = rawopen(input)
    for _, method in ipairs(modules) do
      handle[method] = function(self, ...)
        return dir[method](self, ...)
      end
    end
    return handle
  end
  return dir
end)({})