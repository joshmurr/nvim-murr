local map = require('cosmic.utils').map
local user_plugins = require('cosmic.core.user')
local unset = vim.api.nvim_del_keymap

-- Mappings for plugins that need to be lazy loaded
if not vim.tbl_contains(user_plugins.disable_builtin_plugins, 'nvim-tree') then
  require('cosmic.plugins.nvim-tree.mappings')
end

if not vim.tbl_contains(user_plugins.disable_builtin_plugins, 'auto-session') then
  require('cosmic.plugins.auto-session.mappings')
end

-- Quickfix mappings
map('n', '<leader>ck', ':cexpr []<cr>')
map('n', '<leader>cc', ':cclose <cr>')
map('n', '<leader>co', ':copen <cr>')
map('n', '<leader>cf', ':cfdo %s/')
map('n', '<leader>cp', ':cprev<cr>zz')
map('n', '<leader>cn', ':cnext<cr>zz')

-- buffer navigation
map('n', '<leader>bp', ':bprev<cr>')
map('n', '<leader>bn', ':bnext<cr>')
map('n', '<leader>bd', ':bdelete<cr>')

-- tab navigation
map('n', '<leader>tp', ':tabprevious<cr>')
map('n', '<leader>tn', ':tabnext<cr>')
map('n', '<leader>td', ':tabclose<cr>')

-- resize with arrows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Mine --
unset('n', 'Y')
map('n', '<C-l>', ':nohl<CR><C-l>')
map('n', ':w\\', '<nop>')
map('n', '<F1>', '<nop>')
--[[ map('n', '<C-n>', ':set invnumber<CR>') -- Toggle line numbers ]]
map('n', '<C-p>', ':set wrap!<CR>') -- Toggle line wrap
map('n', ':qt', ':tabclose') -- Close tab

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>')
map('n', '<leader>xa', '<cmd>TroubleToggle<cr>')
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')
