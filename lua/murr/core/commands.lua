local augroup_name = 'MurrNvim'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
vim.api.nvim_create_autocmd('VimResized', {
  command = 'tabdo wincmd =',
  group = group,
})

vim.cmd([[
  command! MurrUpdate lua require('murr.utils').update()
  command! MurrReload lua require('murr.utils').reload_user_config(true)
  command! MurrReloadSync lua require('murr.utils').reload_user_config_sync()
  command! LspFormat lua vim.lsp.buf.format()
]])

vim.cmd([[
	augroup prevent_newline_comment
		autocmd!
		autocmd BufEnter * set formatoptions-=cro
	augroup end
]])
