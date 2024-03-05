local load_modules = require('murr.utils').load_modules

local modules = {
  'murr.core.disabled',
  'murr.core.options',
  'murr.core.commands',
  'murr.core.globals',
  'murr.core.mappings',
}

load_modules(modules)
