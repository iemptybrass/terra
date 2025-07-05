local fail =
  { "input is required",
    "input must be a string" }

return function ( input )
  assert ( input, fail[1] )
  assert ( type ( input ) == "string", fail[2] )
  local hash = 0xcbf29ce484222325ULL
  for i = 1, #input do
    hash = ffi.bit.bxor ( hash, input:byte ( i ) )
    hash = hash * 0x100000001b3ULL
  end
  return ("%x"):format ( hash )
end