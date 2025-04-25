lock()

local buffers = {}
local map = {}
local output = {}

local open = io.open
local insert = table.insert
local remove = table.remove
local gsub = string.gsub

local function normalize(input)
  return (input
    :gsub("^\239\187\191", "")
    :gsub("#[^\n]*", " ")
    :gsub("[^%g \n]", "")
    :gsub("%s+", " ")
    :match("^%s*(.-)%s*$") or "")
end

local function trace(input)
  local parts = {}
  for part in input:gmatch("[^/]+") do
    if part == ".." 
      then
        remove(parts)
    elseif part ~= "." and part ~= "" 
      then
        insert(parts, part)
    end
  end
  return table.concat(parts, "/")
end

local function label(input)
  return trace(input):gsub("(%.[^/%.]+)$", ""):gsub("/", ".")
end

function output.load(input)
  local key = label(input)
  if buffers[key] 
    then
      return buffers[key]
  end
  local file, error = open(input, "r")
  if not file 
    then 
      error("load: cannot open '" .. input .. "':" .. error, 2) 
  end
  local content = file:read("*a")
  file:close()
  buffers[key] = {
    name = key,
    input = input,
    content = normalize(content), }
  map[input] = key
  return buffers[key]
end

function output.get(input)
  return buffers[input] or buffers[map[input]]
end

function output.clear(input)
  if not input 
    then
      return
  end
  if input == "*" 
    then
      for label in pairs(buffers) do 
        buffers[label] = nil 
      end
      for path in pairs(map) do 
        map[path] = nil 
      end
      return collectgarbage("collect")
  end
  if buffers[input] 
    then
      buffers[input] = nil
      for path, label in pairs(map) do
        if label == input 
          then 
            map[path] = nil 
        end
      end
      return
  end
  local label = map[input]
  if label then
    buffers[label] = nil
    map[input] = nil
    return collectgarbage("collect")
  end
end

return output
