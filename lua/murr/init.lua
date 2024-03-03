local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("murr.core")

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
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
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim" },
  { "hrsh7th/cmp-nvim-lsp", },
  { import = "murr.lsp.lspconfig" },
  { import = "murr.lsp.mason" },
  { import = "murr.lsp.none_ls" },
  { import = "murr.plugins.telescope" },
  { import = "murr.plugins.treesitter" },
})
