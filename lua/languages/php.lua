local utils = require('includes.utils')

utils.language('php', function()
  utils.set_option_value('tabstop', 4)
  utils.set_option_value('shiftwidth', 4)
  utils.set_option_value('softtabstop', 4)

  if type(vim.fn['phpactor#rpc']) == 'function' then
    local keymap = function(mode, key, value)
      vim.keymap.set(mode, key, value, { buffer = 0, silent = true })
    end

    local generate_method = function()
      vim.fn['phpactor#rpc']('generate_method', {
        offset = vim.fn['phpactor#_offset'](),
        source = vim.fn['phpactor#_source'](),
        path = vim.fn.expand('%:p'),
      })
    end

    -- keymap('n', '<Leader>x', '<Cmd>call phpactor#ContextMenu()<CR>')
    keymap('n', '<Leader>ml', '<Cmd>call phpactor#ClassNew()<CR>')
    -- keymap('n', '<Leader>mt', '<Cmd>call phpactor#Transform()<CR>')
    keymap('n', '<Leader>me', '<Cmd>call phpactor#ClassExpand()<CR>')
    keymap('n', '<Leader>mm', generate_method)
    keymap('x', '<Leader>mm', ':<C-u>call phpactor#ExtractMethod()<CR>')
    keymap('n', '<Leader>mx', '<Cmd>call phpactor#ExtractExpression(v:false)<CR>')
    keymap('x', '<Leader>mx', ':<C-u>call phpactor#ExtractExpression(v:true)<CR>')
  end
end)
