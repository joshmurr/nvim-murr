--[[ local mods = {
  'murr.compiled',
  'murr.core',
}

for _, mod in ipairs(mods) do
  local ok, err = pcall(require, mod)
  if mod == 'murr.compiled' and not ok then
    vim.notify('Run :PackerCompile!', vim.log.levels.WARN, {
      title = 'MurrNvim',
    })
  elseif not ok and not mod:find('murr.core.user') then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end

end ]]

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

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim" },
  { "hrsh7th/cmp-nvim-lsp", },
  { import = "murr.lsp.lspconfig" },
  { import = "murr.lsp.none-ls" },
  { import = "murr.lsp.mason" }
})
