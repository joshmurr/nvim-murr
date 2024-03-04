-- [[
-- Rename implementation taken from CosmicNvim
-- https://github.com/CosmicNvim/cosmic-ui
-- ]]

local lsp = vim.lsp
local utils = require('murr.utils')
local rename_handler = require('murr.utils.rename.handler')
local Text = require('nui.text')

local prompt_backspace = function(prompt)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local col = cursor[2]

  if col ~= prompt then
    vim.api.nvim_buf_set_text(0, line - 1, col - 1, line - 1, col, { '' })
    vim.api.nvim_win_set_cursor(0, { line, col - 1 })
  end
end

local default_mappings = function(input)
  local prompt = input._.prompt._length

  utils.map(input, '<ESC>', function()
    input.input_props.on_close()
  end)

  utils.map(input, '<C-c>', function()
    input.input_props.on_close()
  end)

  utils.map(input, '<BS>', function()
    prompt_backspace(prompt)
  end)
end

local function rename(popup_opts, opts)
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event
  local curr_name = vim.fn.expand('<cword>')

  local user_border = {
    highlight = 'FloatBorder',
    style = nil,
    title = 'Rename',
    title_align = 'left',
    title_hl = 'FloatBorder',
  }
  local width = 25
  local prompt = '> '
  local prompt_hl = 'Comment'
  if #curr_name + #prompt >= width then
    -- consider prompt and one free space, otherwise the textbox scrolls
    -- and shows an -- seemingly -- empty textbox
    width = #curr_name + #prompt + 1
  end

  local border_style = 'single'

  popup_opts = utils.merge({
    position = {
      row = 1,
      col = 0,
    },
    size = {
      width = width,
      height = 2,
    },
    relative = 'cursor',
    border = {
      highlight = user_border.highlight,
      style = border_style,
      text = {
        top = Text(user_border.title, user_border.title_hl),
        top_align = user_border.title_align,
      },
    },
  }, popup_opts or {})

  opts = utils.merge({
    prompt = Text(prompt, prompt_hl),
    default_value = curr_name,
    on_submit = function(new_name)
      if not (new_name and #new_name > 0) or new_name == curr_name then
        return
      end
      local params = lsp.util.make_position_params()
      params.newName = new_name
      lsp.buf_request(0, 'textDocument/rename', params, rename_handler)
    end,
  }, opts or {})

  local input = Input(popup_opts, opts)

  -- mount/open the component
  input:mount()

  default_mappings(input)

  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

return rename
