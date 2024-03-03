return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
  },

  config = function()
    -- import lspconfig plugin
    local lspconfig = require('lspconfig')

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      print(client, bufnr)
      opts.buffer = bufnr
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- configure html server
    lspconfig['html'].setup({ capabilities = capabilities, on_attach = on_attach })

    -- configure typescript server with plugin
    lspconfig['tsserver'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['eslint'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig['cssls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig['tailwindcss'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure prisma orm server
    lspconfig['prismals'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure graphql language server
    lspconfig['graphql'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
    })

    -- configure emmet language server
    lspconfig['emmet_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    })

    -- configure python server
    lspconfig['pyright'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    })
  end,
}
