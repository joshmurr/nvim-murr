local M = {}

function M.map(mode, lhs, rhs, opts)
  local defaults = {
    silent = true,
    noremap = true,
  }
  vim.keymap.set(mode, lhs, rhs, M.merge(defaults, opts or {}))
end

function M.merge_list(tbl1, tbl2)
  for _, v in ipairs(tbl2) do
    table.insert(tbl1, v)
  end
  return tbl1
end

function M.merge(...)
  return vim.tbl_deep_extend('force', ...)
end

function M.split(str, sep)
  local res = {}
  for w in str:gmatch('([^' .. sep .. ']*)') do
    if w ~= '' then
      table.insert(res, w)
    end
  end
  return res
end

function M.get_active_lsp_client_names()
  local active_clients = vim.lsp.get_active_clients()
  local client_names = {}
  for _, client in pairs(active_clients or {}) do
    local buf = vim.api.nvim_get_current_buf()
    -- only return attached buffers
    if vim.lsp.buf_is_attached(buf, client.id) then
      table.insert(client_names, client.name)
    end
  end

  if not vim.tbl_isempty(client_names) then
    table.sort(client_names)
  end
  return client_names
end

local function dump_table(o)
  print('Dumping...', o, type(0))
  if type(o) == 'table' then
    local s = ''
    for k, v in pairs(o) do
      print(k, v)
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. dump_table(v) .. ','
    end
    return s
  else
    return tostring(o)
  end
end

M.dump_table = dump_table

M.get_relative_path = function(file_path)
  local plenary_path = require('plenary.path')
  local parsed_path, _ = file_path:gsub('file://', '')
  local path = plenary_path:new(parsed_path)
  local relative_path = path:make_relative(vim.fn.getcwd())
  return './' .. relative_path
end

M.load_modules = function(o)
  if type(o) == 'table' then
    for _, mod in ipairs(o) do
      local ok, err = pcall(require, mod)
      if not ok then
        error(('Error loading %s...\n\n%s'):format(mod, err))
      end
    end
  end
end

return M
