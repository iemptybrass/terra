package.path = "./lib/?/init.lua;" .. package.path

local modules = {
  "core",
  "ffi",
  "tools" }

for _, name in ipairs(modules) do
  local ok, result = pcall(require, name)
  if type(result) == "function" 
    then
      result()
  end
end
