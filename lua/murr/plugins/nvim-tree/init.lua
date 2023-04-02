local config = require('murr.core.user')
local icons = require('murr.theme.icons')
local u = require('murr.utils')
local augroup_name = 'CosmicNvimNvimTree'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })

-- set up args
local args = {
  respect_buf_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.hint,
      info = icons.info,
      warning = icons.warn,
      error = icons.error,
    },
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 35,
    number = true,
    relativenumber = true,
  },
  git = {
    ignore = false,
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    highlight_git = true,
    special_files = {},
    icons = {
      glyphs = {
        default = '',
        symlink = icons.symlink,
        git = icons.git,
        folder = icons.folder,
      },
    },
  },
}

-- Autoclose nvim is nvim-tree is only buffer open
vim.api.nvim_create_autocmd('BufEnter', {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
  group = group,
  nested = true,
})

require('nvim-tree').setup(u.merge(args, config.nvim_tree or {}))
