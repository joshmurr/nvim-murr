return {
  'rmagatti/goto-preview',
  lazy = true,
  event = 'BufEnter',
  config = function()
    local goto_preview = require('goto-preview')
    goto_preview.setup()
  end,
}
