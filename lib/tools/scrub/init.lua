local path, modules =
((...).."."),
{ "literal" }
return (function (scrub)
  local all = { "target", unpack(modules) }
  for _, name in ipairs(all) do
    scrub[name] = require(path .. name)
  end
  local rawopen = scrub.target
  scrub.target = function(input)
    local handle = rawopen(input)
    for _, method in ipairs(modules) do
      handle[method] = function(self, ...)
        return scrub[method](self, ...)
      end
    end
    return handle
  end
  return scrub
end)({})