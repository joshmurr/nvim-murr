return {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here

    require('tokyonight').setup({
      on_colors = function(colors)
        colors.bg = '#0b0b0f'
        colors.green = '#9fdd5b'
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
