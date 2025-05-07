ffi.cdef([[ typedef struct __dirstream DIR; ]])
local path = ((...)..".")
return (function (dir)
  for _, name in ipairs({ "open" }) do
    dir[name] = require(path .. name)
  end
  local rawopen = dir.open
  dir.open = function(input)
    local handle = rawopen(input)
    for _, method in ipairs({ "read", "close" }) do
      handle[method] = function(self, ...)
        return dir[method](self, ...)
      end
    end
    return handle
  end
  return dir
end)({})