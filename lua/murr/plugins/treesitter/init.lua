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
    --[[ 'tsx', ]]
    'typescript',
    'javascript',
    'json',
    'jsonc',
    'html',
    'css',
    'scss',
    'yaml',
    'toml',
    'haxe',
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
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
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

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.haxe = {
  install_info = {
    url = 'https://github.com/vantreeseba/tree-sitter-haxe',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'haxe',
}

require('nvim-treesitter.configs').setup(u.merge(defaults, config.treesitter or {}))
