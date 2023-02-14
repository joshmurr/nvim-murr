local M = {}

M.supported_themes = {
  'monokai',
}

function M.init(use)
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
  })
end

return M
