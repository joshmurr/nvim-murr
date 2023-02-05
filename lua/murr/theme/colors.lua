local config = require('murr.core.user')
local colors = {}
local mod = 'murr.theme.integrated.'
local supported_themes = require('murr.theme.plugins').supported_themes

for _, theme in pairs(supported_themes) do
  if theme == config.theme then
    colors = require(mod .. theme)
  end
end

if vim.tbl_isempty(colors) then
  return false
end

return colors
