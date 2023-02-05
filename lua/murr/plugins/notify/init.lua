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
  background_colour = require('murr.theme.colors').bg,
}, config.notify or {}))

vim.notify = require('notify')

require('murr.plugins.notify.highlights')
