local modules =
  { "lib.",
    "core",
    "ffi",
    "macro",
    "tools", }
for i = 2, #modules do
  require ( modules[1] .. modules[i] )
end