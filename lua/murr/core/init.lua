local cosmic_modules = {
  'murr.core.disabled',
  'murr.core.editor',
  'murr.core.commands',
  'murr.core.mappings',
  'murr.config.editor',
}

for _, mod in ipairs(cosmic_modules) do
  local ok, err = pcall(require, mod)
  if not ok and not mod:find('murr.config') then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end
end
