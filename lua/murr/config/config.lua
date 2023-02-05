-- Override Cosmic configuration options

-- You can require null-ls if needed
-- local null_ls = require('null-ls')

local config = {
  -- See https://github.com/rmagatti/auto-session#%EF%B8%8F-configuration
  auto_session = {},
  -- See :h nvim_open_win for possible border options
  border = 'rounded',
  -- https://github.com/numToStr/Comment.nvim#configuration-optional
  comment_nvim = {},
  -- See https://github.com/CosmicNvim/cosmic-ui#%EF%B8%8F-configuration
  cosmic_ui = {},
  -- See :h vim.diagnostic.config for all diagnostic configuration options
  diagnostic = {},
  -- See :h gitsigns-usage
  gitsigns = {},
  -- LSP settings
  lsp = {
    -- True/false or table of filetypes {'.ts', '.js',}
    format_on_save = true,
    -- Time in MS before format timeout
    format_timeout = 3000,
    -- Set to false to disable rename notification
    rename_notification = true,
    -- Enable non-default servers, use default lsp config
    -- Check here for configs that will be used by default: https://github.com/williamboman/nvim-lsp-installer/tree/main/lua/nvim-lsp-installer/servers
    servers = {
      -- Enable rust_analyzer
      rust_analyzer = true,

      -- Enable tsserver w/custom settings
      tsserver = {
        -- Disable formatting (defaults to true)
        format = false,
        -- OR add/override server options
        opts = {
          on_attach = function(client, bufnr) end,
          flags = {
            debounce_text_changes = 150,
          },
        },
      },
      -- See Cosmic defaults lsp/providers/null_ls.lua and https://github.com/jose-elias-alvarez/null-ls.nvim/
      -- If adding additional sources, be sure to also copy the defaults that you would like to preserve from lsp/providers/null_ls.lua
      null_ls = {
        -- Disable default list of sources provided by CosmicNvim
        default_cosmic_sources = false,
        -- Add additional sources here
        sources = {},
      },
    },
    -- See Cosmic defaults lsp/providers/tsserver.lua
    ts_utils = {},
  },
}

return config
