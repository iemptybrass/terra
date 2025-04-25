local function lock()

  if jit 
    then
      jit.off(true, true)
      jit.flush()
  end

  os.time       = nil
  os.date       = nil
  os.clock      = nil
  os.getenv     = nil
  os.setlocale  = nil

  math.random     = nil
  math.randomseed = nil

  local function restrict(input)
    return function(_, key)
      error("Access to nondeterministic function: " .. input .. "." .. key, 2)
    end
  end

  setmetatable(math, { __index = restrict("math") })
  setmetatable(os, { __index = restrict("os") })
end

return lock
