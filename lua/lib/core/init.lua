local prefix = ...
local path = prefix and (prefix .. ".") or ""

local lock = require(path .. "lock")
lock()

rawset(_G, "lock", lock)

return {
  lock = lock,
}
