local default_config = require('murr.lsp.providers.defaults')
local u = require('murr.utils')

local nvim_lsp = require('lspconfig')

local installed_lsps = {
  'tsserver',
  'lua_ls',
  'clojure_lsp',
  --[[ 'haxe_language_server', ]]
  'tailwindcss',
  'jsonls',
  'prismals',
  'unocss',
  'ruff_lsp',
  'pyright',
  'clangd',
  'asm_lsp',
  'marksman',
}

local base_setup = {
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
}

for _, lsp in ipairs(installed_lsps) do
  local config_name = 'murr.lsp.providers.' .. lsp
  local config_exists, lsp_config = pcall(require, config_name)
  nvim_lsp[lsp].setup(u.merge(base_setup, config_exists and lsp_config or {}))
end
