return {
  'NvChad/nvim-colorizer.lua',
  lazy = true,
  config = function()
    require('colorizer').setup({
      user_default_options = {
        css = true,
      },
    })
  end,
}
