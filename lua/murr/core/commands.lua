vim.cmd([[
  command! LspFormat lua vim.lsp.buf.format()
]])

vim.cmd([[
	filetype plugin indent on
]])
