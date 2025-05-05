local path, modules =
((...).."."),
{ "open",
  "close",
  "read",
  "rewind" }
ffi.cdef([[typedef struct __dirstream DIR;]])
return (function (dir)
  for _, name in ipairs(modules) do
    dir[name] = require(path .. name)
  end
  return dir
end)({})