return {
  'kdheepak/lazygit.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local lazygit = require('lazy')
    lazygit.setup({
      cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
      },
      -- optional for floating window border decoration
    })
  end,
}
