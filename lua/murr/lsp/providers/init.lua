local u = require('murr.utils')
local default_config = require('murr.lsp.providers.defaults')
local config = require('murr.core.user')

local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup({
  capabilities = default_config.capabilities,
  on_attach = function(client, bufnr)
    default_config.on_attach(client, bufnr)

    local ts_utils = require('nvim-lsp-ts-utils')

    -- defaults
    ts_utils.setup(u.merge({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = true,

      -- import all
      import_all_timeout = 5000, -- ms
      import_all_priorities = {
        buffers = 4, -- loaded buffer names
        buffer_content = 3, -- loaded buffer content
        local_files = 2, -- git files or files with relative path markers
        same_file = 1, -- add to existing import statement
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = 'Comment',

      -- update imports on file move
      update_imports_on_move = true,
      require_confirmation_on_move = false,
      watch_dir = nil,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},
    }, config.lsp.ts_utils or {}))

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)
  end,
})

nvim_lsp.sumneko_lua.setup({
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
        maxPreload = 10000,
      },
    },
  },
})

nvim_lsp.clojure_lsp.setup({
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
})

nvim_lsp.haxe_language_server.setup({
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
})

nvim_lsp.jsonls.setup({
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
        end,
      },
    },
  },
})
