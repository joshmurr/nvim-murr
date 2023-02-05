local colors = require('murr.theme.integrated.monokai')

if vim.tbl_isempty(colors) then
  return false
end

return colors
