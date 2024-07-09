local map = require('murr.utils').map

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'MunifTanjim/nui.nvim' },
  },

  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local on_attach = function(client, bufnr)
      local function set_keymap(mode, lhs, rhs)
        map(mode, lhs, rhs, {
          buffer = bufnr,
        })
      end

      set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
      set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
      set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
      set_keymap('n', 'gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>')
      set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
      set_keymap('n', 'gn', '<cmd>lua require("murr.utils.rename")()<cr>')

      -- diagnostics
      set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
      set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>')
      set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>')
      set_keymap('n', '<leader>ge', '<cmd>Telescope diagnostics bufnr=0<cr>')

      -- hover
      set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

      -- formatting
      set_keymap('n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
      set_keymap('v', '<leader>gf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')

      -- signature help
      set_keymap('n', '<C-K>', '<cmd>lua require("lsp_signature").signature()<cr>')

      -- lsp workspace
      set_keymap('n', '<leader>wd', '<cmd>Telescope diagnostics<cr>')
      set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
      set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
      set_keymap(
        'n',
        '<leader>wl',
        '<cmd>lua require("murr.utils.logger"):log(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>'
      )

      if client.name == 'tsserver' then
        -- typescript helpers
        set_keymap('n', '<leader>gr', ':TSLspRenameFile<CR>')
        set_keymap('n', '<leader>go', ':TSLspOrganize<CR>')
        set_keymap('n', '<leader>gi', ':TSLspImportAll<CR>')
      end
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

    lspconfig['clojure_lsp'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
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

    lspconfig['mdx_analyzer'].setup({
      filetypes = { 'mdx' },
    })
  end,
}
