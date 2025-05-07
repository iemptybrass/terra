local path, modules =
((...).."."),
{ "literal",
  "whitespace" }
return (function (scrub)
  local all = { "target", unpack(modules) }
  for _, name in ipairs(all) do
    scrub[name] = require(path .. name)
  end
  local raw = scrub.target
  scrub.target = function(input)
    local handle = raw(input)
    for _, method in ipairs(modules) do
      handle[method] = function(self, ...)
        return scrub[method](self, ...)
      end
    end
    return handle
  end
  return scrub
end)({})