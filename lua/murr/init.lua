local mods = {
  'murr.compiled',
  'murr.core',
}

for _, mod in ipairs(mods) do
  local ok, err = pcall(require, mod)
  if mod == 'murr.compiled' and not ok then
    vim.notify('Run :PackerCompile!', vim.log.levels.WARN, {
      title = 'MurrNvim',
    })
  elseif not ok and not mod:find('murr.core.user') then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end
end
