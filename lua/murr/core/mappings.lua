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

-- resize with arrows map('n', '<C-Up>', ':resize -2<CR>')
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
-- [[ Colorizer is lazy loaded so we need to require it to use it ]]
map('n', '<leader>cc', '<cmd>lua require("colorizer").attach_to_buffer(0, { css = true })<cr>')
map('n', '<leader>cx', '<cmd>lua require("colorizer").detach_from_buffer(0)<cr>')

-- Nvim Tree
map('n', '<C-n>', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
map('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
map('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Show buffer diagnostics' })
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find all comments' })
map('n', '<leader>ftt', '<cmd>TodoTelescope keywords=TODO<cr>', { desc = 'Find TODO comments' })
map('n', '<leader>ftf', '<cmd>TodoTelescope keywords=FIX<cr>', { desc = 'Find FIX comments' })
map('n', '<leader>ftb', '<cmd>TodoTelescope keywords=BUG<cr>', { desc = 'Find BUG comments' })
map('n', '<leader>ftn', '<cmd>TodoTelescope keywords=NOTE<cr>', { desc = 'Find NOTE comments' })

-- Lazy Git
map('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Open LazyGit' })
