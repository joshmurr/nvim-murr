local config = require('murr.core.user')
local u = require('murr.utils')

require('lsp_signature').setup(u.merge({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = config.border,
  },
}, config.lsp_signature or {}))
