local modules =
  { "lib",
    "core",
    "ffi",
    "macro",
    "tools", }

local fail =
  { "Failed to require module ", }

for i = 2, #modules do
  local name = modules[1] .. "." .. modules[i]
  local ok, err = pcall ( require, name )
  if not ok then
    error ( fail[1] .. name .. ": " .. tostring ( err ), 2 )
  end
end
