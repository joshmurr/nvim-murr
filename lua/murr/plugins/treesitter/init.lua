local config = require('murr.core.user')
local u = require('murr.utils')

local defaults = {
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
  ensure_installed = { 'haxe' },
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
