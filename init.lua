if vim.fn.has('nvim-0.8.1') == 0 then
  error('Need Neovim v0.8.1+ in order to run Murrvim!')
end

do
  local ok, _ = pcall(require, 'impatient')

  if not ok then
    vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
  end
end

local ok, err = pcall(require, 'murr')

if not ok then
  error(('Error loading core...\n\n%s'):format(err))
end
