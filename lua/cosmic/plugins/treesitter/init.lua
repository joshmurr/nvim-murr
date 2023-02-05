local config = require('cosmic.core.user')
local u = require('cosmic.utils')

local defaults = {
  ensure_installed = 'haxe',
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
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.haxe = {
  install_info = {
    url = '~/Documents/Stuff/tree-sitter-haxe', -- local path or git repo
    files = { 'src/parser.c' },
    requires_generate_from_grammar = true,
  },
  filetype = 'haxe', -- if filetype does not match the parser name
}

require('nvim-treesitter.configs').setup(u.merge(defaults, config.treesitter or {}))
