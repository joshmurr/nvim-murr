local config = require('murr.core.user')
local u = require('murr.utils')

local defaults = {
  border_style = 'rounded',
}

require('cosmic-ui').setup(u.merge(defaults, config.cosmic_ui or {}))
