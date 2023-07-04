local M = {}

M.root_dir = function(fname)
  return vim.fs.dirname(fname)
end

M.filetypes = { 'asm', 's', 'S' }

return M
