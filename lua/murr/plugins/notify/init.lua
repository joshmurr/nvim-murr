local config = require('murr.core.user')
local icons = require('murr.theme.icons')
local u = require('murr.utils')

require('notify').setup(u.merge({
  icons = {
    ERROR = icons.error,
    WARN = icons.warn,
    INFO = icons.info,
    DEBUG = icons.debug,
    TRACE = icons.trace,
  },
  stages = 'slide',
}, config.notify or {}))

vim.notify = function(msg, ...)
  if msg:match('warning: multiple different client offset_encodings') then
    return
  end

  require('notify')(msg, ...)
end
