local config = require('murr.core.user')
local u = require('murr.utils')

local defaults = {
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
    'help',
    'clojure',
    'typescript',
    'javascript',
    'json',
    'jsonc',
    'html',
    'css',
    'scss',
    'yaml',
    'toml',
    'fennel',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 3000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

require('ts_context_commentstring').setup({
  enable_autocmd = false,
})

require('nvim-treesitter.configs').setup(u.merge(defaults, config.treesitter or {}))
