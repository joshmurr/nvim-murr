local modules = {
  'murr.core.disabled',
  'murr.core.editor',
  'murr.core.commands',
  'murr.core.mappings',
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end
end
