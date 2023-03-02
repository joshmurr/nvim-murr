local user_config = require('murr.core.user')
local cosmic_packer = require('murr.packer')
local packer = cosmic_packer.packer
local use = packer.use

return packer.startup(function()
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nvim-lua/plenary.nvim',
  })

  -- initialize theme plugins
  --[[ require('murr.theme.plugins').monokai(use) ]]
  require('murr.theme.plugins').tokyonight(use)

  use({
    'rcarriga/nvim-notify',
    config = function()
      require('murr.plugins.notify')
    end,
    after = user_config.theme,
  })

  use({
    'kyazdani42/nvim-web-devicons',
    after = user_config.theme,
  })

  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('murr.plugins.nvim-tree')
    end,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
    event = 'VimEnter',
  })

  use({
    'CosmicNvim/cosmic-ui',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('murr.plugins.cosmic-ui')
    end,
    event = 'BufWinEnter',
  })

  use({
    'williamboman/mason.nvim',
    config = function()
      require('murr.lsp.providers.mason')
    end,
  })
  use({ 'williamboman/mason-lspconfig.nvim' })

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('murr.lsp')
    end,
    requires = {
      { 'b0o/SchemaStore.nvim' },
      --[[ { 'williamboman/nvim-lsp-installer' }, ]]
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('murr.lsp.providers.null_ls')
        end,
        after = 'nvim-lspconfig',
      },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('murr.plugins.lsp-signature')
        end,
        after = 'nvim-lspconfig',
      },
    },
    event = 'BufWinEnter',
  })

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('murr.plugins.nvim-cmp')
    end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('murr.plugins.luasnip')
        end,
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = function()
          require('murr.plugins.auto-pairs')
        end,
        after = 'nvim-cmp',
      },
    },
    event = 'InsertEnter',
  })

  -- git commands
  use({
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'Git',
  })

  -- git column signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    opt = true,
    event = 'BufWinEnter',
    config = function()
      require('murr.plugins.gitsigns')
    end,
  })

  -- file navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('murr.plugins.telescope.mappings').init()
      require('murr.plugins.telescope')
    end,
    event = 'BufWinEnter',
  })

  use({
    'rmagatti/auto-session',
    config = function()
      require('murr.plugins.auto-session')
    end,
  })

  -- lang/syntax stuff
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    commit = '9bfaf62e42bdcd042df1230e9188487e62a112c0', -- Fixes colors with Monokai
    run = ':TSUpdate',
    config = function()
      require('murr.plugins.treesitter')
    end,
  })

  -- comments and stuff
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('murr.plugins.comments')
    end,
    event = 'BufWinEnter',
  })

  -- todo highlights
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('murr.plugins.todo-comments')
    end,
    event = 'BufWinEnter',
  })
  -- colorized hex codes
  use({
    'norcalli/nvim-colorizer.lua',
    opt = true,
    cmd = { 'ColorizerToggle' },
    config = function()
      require('colorizer').setup()
    end,
  })

  -- Lua
  use({
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  })

  use({
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
    end,
  })

  use({ 'Olical/conjure' })

  --[[ use({ 'easymotion/vim-easymotion' }) ]]

  use({
    'ggandor/lightspeed.nvim',
    {
      'romgrk/barbar.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    },
  })

  use({ 'nvim-pack/nvim-spectre' })

  use({ 'amadeus/vim-convert-color-to' })

  --[[ use({ 'tanvirtin/monokai.nvim' }) ]]

  if user_config.add_plugins and not vim.tbl_isempty(user_config.add_plugins) then
    for _, plugin in pairs(user_config.add_plugins) do
      use(plugin)
    end
  end

  if cosmic_packer.first_install then
    packer.sync()
  end
end)
