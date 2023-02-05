local config = require('murr.core.user')

-- set up lsp servers
require('murr.lsp.providers')
require('murr.lsp.diagnostics')
require('murr.lsp.commands')

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = config.border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = config.border,
})
