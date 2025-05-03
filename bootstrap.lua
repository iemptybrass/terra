local library, modules = ("lib"),
{ "core",
  "ffi",
  "tools" }
for _, name in ipairs(modules) do
  require(library.."."..name)()
end
