local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local bindings = require('config.bindings')

bindings.general()

lspconfig.haxe_language_server.setup({
  cmd = { 'node', '/home/joshmurr/Documents/Stuff/haxe-language-server/bin/server.js' },
  capabilities = capabilities,
  on_attach = bindings.on_attach,
})
