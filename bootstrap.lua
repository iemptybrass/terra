local library, modules =
(("lib").."."),
{ "core",
  "ffi",
  "macro",
  "tools" }
for _, name in ipairs(modules) do
  require(library .. name)
end
