local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local indent = 2

cmd([[
	filetype plugin indent on
]])

local augroup_name = 'MurrNvimEditor'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   command = [[%s/\s\+$//e]],
--   group = group,
-- })

g.mapleader = ' '
g.maplocalleader = '\\'

-- misc
opt.backspace = { 'eol', 'start', 'indent' }
opt.clipboard = 'unnamedplus'
opt.encoding = 'utf-8'
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.syntax = 'enable'

-- indention
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { '*/node_modules/*', '*/.git/*', '*/vendor/*' }
opt.wildmenu = true

-- ui
opt.cursorline = true
opt.laststatus = 2
opt.lazyredraw = true
opt.list = true
opt.listchars = {
  tab = '❘-',
  trail = '·',
  lead = '·',
  extends = '»',
  precedes = '«',
  nbsp = '×',
}
opt.mouse = 'a'
opt.number = false
opt.rnu = false
opt.scrolloff = 18
opt.showmode = false
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.signcolumn = 'yes'
opt.splitbelow = true -- Open new split below
opt.splitright = true -- Open new split to the right
opt.wrap = false
opt.showtabline = 0

-- backups
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.undofile = true

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess = opt.shortmess + { c = true }

-- perfomance
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100

-- theme
opt.termguicolors = true

vim.o.background = 'dark'

-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

--comments
vim.g.skip_ts_context_commentstring_module = true
