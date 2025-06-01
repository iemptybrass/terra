return function ( input )
  local hash = 0xcbf29ce484222325ULL
  for i = 1, #input do
    hash = bit.bxor ( hash, input:byte ( i ) )
    hash = hash * 0x100000001b3ULL
  end
  return string.format ( "%016x", tonumber ( hash ) )
end