local utils = require('includes.utils')
local phpactor = require('phpactor')
local phpactor_rpc = require('phpactor.rpc')
local phpactor_utils = require('phpactor.utils')

local get_current_selection_offsets = function(options)
  local is_visual_model = options.visual == true

  if not is_visual_model then
    return { phpactor_utils.offset(), nil }
  end

  local start_line, start_column, end_line, end_column = utils.get_current_selection()
  local buffer = vim.api.nvim_get_current_buf()
  local start_offset = vim.api.nvim_buf_get_offset(buffer, start_line - 1) + start_column
  local end_offset = vim.api.nvim_buf_get_offset(buffer, end_line - 1) + end_column

  return { start_offset, end_offset }
end

local function extract_method(_, options)
  local offsets = get_current_selection_offsets(options)

  phpactor_rpc.call('extract_method', {
    path = phpactor_utils.path(),
    offset_start = offsets[1],
    offset_end = offsets[2],
    source = phpactor_utils.source(),
  })
end

local function extract_expression(_, options)
  local offsets = get_current_selection_offsets(options)

  phpactor_rpc.call('extract_expression', {
    path = phpactor_utils.path(),
    offset_start = offsets[1],
    offset_end = offsets[2],
    source = phpactor_utils.source(),
  })
end

local exports = {}

exports.setup = phpactor.setup

exports.rpc = function(name, options)
  return function()
    local handler = phpactor.rpc

    if name == 'extract_method' then
      handler = extract_method
    end

    if name == 'extract_expression' then
      handler = extract_expression
    end

    handler(name, options)
  end
end

return exports
