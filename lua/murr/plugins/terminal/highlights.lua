local set_highlight = require('murr.theme.utils').set_highlight

-- terminal highlights
set_highlight('FloatBorder', {
  guibg = 'None',
})

vim.cmd('hi! link FloatermBorder FloatBorder')
