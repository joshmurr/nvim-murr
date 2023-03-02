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

vim.notify = require('notify')
