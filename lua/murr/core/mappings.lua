local map = require('murr.utils').map
local unset = vim.api.nvim_del_keymap

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
unset('n', 'Y') -- Allows for yanking whole line
map('n', '<C-l>', ':nohl<CR><C-l>') -- Clears highlights
map('n', ':w\\', '<nop>')
map('n', '<F1>', '<nop>') -- Turns off help menu
map('n', ';', '<nop>') -- Prevent annoying jump when trying to save too quickly
map('n', '<leader>n', ':set invnumber<CR>') -- Toggle line numbers
map('n', '<leader>p', ':set wrap!<CR>') -- Toggle line wrap
map('n', ':qt', ':tabclose') -- Close tab

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>')
map('n', '<leader>xa', '<cmd>TroubleToggle<cr>')
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')

--  Colorizer
map('n', '<leader>cc', '<cmd>ColorizerToggle<cr>')

-- Nvim Tree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer
