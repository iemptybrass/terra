lock()

local getinfo = debug.getinfo
local rawset = rawset
local getfenv = getfenv
local require = require

function get()
  local info = getinfo(3, "S")
  local path = info and info.source
  if not path or not path:sub(1, 1) == "@"
    then 
      return "" 
  end

  path = path:sub(2)
    :gsub("^%./", "")
    :gsub("/", ".")
    :gsub("%.lua$", "")
  return path:match("^(.*)%.") or ""
end

function imports(...)
  local prefix = get()
  if prefix ~= ""
    then
      prefix = prefix .. "."
  end
  local env = getfenv(2)
  for _, name in ipairs({ ... }) do
    if type(name) == "string" 
      then
        rawset(env, name, require(prefix .. name))
      else
        error("imports: expected string module name, got " .. type(name), 2)
    end
  end
end

rawset(_G, "imports", imports)
return imports
