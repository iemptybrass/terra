lock()

local prefix = ...
local path = prefix and (prefix .. ".") or ""

local list = { "buffer", "imports" }
local tools = {}

for i = 1, #list do
  local name = list[i]
  tools[name] = require(path .. name)
end

return tools
