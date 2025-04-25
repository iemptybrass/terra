local lib = {}

local prefix = ...
local path = prefix and (prefix .. ".") or ""

local function add(input)
  for key, value in pairs(input) do
    rawset(_G, key, value)
    lib[key] = value
  end
end

local core = require(path .. "core")
add(core)

lock()

local tools = require(path .. "tools")
add(tools)

return lib
