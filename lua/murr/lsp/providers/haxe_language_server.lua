local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local bindings = require('config.bindings')
bindings.general()

M.cmd = { 'node', '/home/joshmurr/Documents/Stuff/haxe-language-server/bin/server.js' }
M.capabilities = capabilities
M.on_attach = bindings.on_attach

return M
