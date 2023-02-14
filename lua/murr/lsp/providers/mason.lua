require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'tailwindcss', 'clojure_lsp', 'jsonls' },
})
