local map = require('murr.utils').map

return {
  'lewis6991/gitsigns.nvim',
  lazy = true,
  config = function()
    require('gitsigns').setup({
      on_attach = function()
        local gitsigns = require('gitsigns')

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end)
      end,
    })
  end,
}
