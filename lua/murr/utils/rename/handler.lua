local Logger = require('murr.utils.logger')

return function(...)
  local utils = require('murr.utils')
  local result
  local method
  local err = select(1, ...)
  local is_new = not select(4, ...) or type(select(4, ...)) ~= 'number'
  if is_new then
    method = select(3, ...).method
    result = select(2, ...)
  else
    method = select(2, ...)
    result = select(3, ...)
  end

  if err then
    Logger:error(("Error running LSP query '%s': %s"):format(method, err))
    return
  end

  print(Logger)

  local new_word = ''
  if result and result.changes then
    local msg = {}
    for f, c in pairs(result.changes) do
      new_word = c[1].newText
      table.insert(msg, ('%d changes -> %s'):format(#c, utils.get_relative_path(f)))
    end
    local currName = vim.fn.expand('<cword>')
    Logger:log(msg, { title = ('Rename: %s -> %s'):format(currName, new_word) })
  end

  vim.lsp.handlers[method](...)
end
