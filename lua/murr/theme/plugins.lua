local M = {}

function M.monokai(use)
  use({
    'tanvirtin/monokai.nvim',
    as = 'monokai',
    config = function()
      require('monokai').setup({
        palette = {
          base2 = '#101010',
        },
      })
    end,
    commit = 'bff619d7a911cd8d8dcb5168db9ee6dfcc344934',
    vim.cmd('color monokai'),
  })
end

function M.tokyonight(use)
  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      require('tokyonight').setup({
        style = 'night', --  `storm`, `moon` `night` and `day`
        light_style = 'day', -- The theme is used when the background is set to light
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = 'dark', -- style for sidebars, see below
          floats = 'dark', -- style for floating windows
        },
        sidebars = { 'qf', 'help', 'packer' },
        on_colors = function(colors)
          colors.bg = '#0b0b0f'
        end,
        vim.cmd('color tokyonight'),
      })
    end,
  })
end

return M
