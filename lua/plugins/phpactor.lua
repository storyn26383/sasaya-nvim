return {{
  'gbprod/phpactor.nvim',
  -- TODO: enable after `gbprod/phpactor.nvim` enhanced
  enabled = false,
  ft = 'php',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = function()
    require('phpactor.handler.update')()
  end,
  config = function()
    local phpactor = require('includes.phpactor')

    local keymap = function(mode, key, value, options)
      options = options or {}
      options.buffer = 0
      vim.keymap.set(mode, key, value, options)
    end

    phpactor.setup({
      lspconfig = {
        enabled = false,
      },
    })

    keymap('n', '<Leader>x', phpactor.rpc('context_menu'))
    keymap('n', '<Leader>ml', phpactor.rpc('new_class', { new_path = vim.fn.expand('%:p') }))
    keymap('n', '<Leader>mt', phpactor.rpc('transform'))
    keymap('n', '<Leader>me', phpactor.rpc('expand_class'))
    keymap('n', '<Leader>mm', phpactor.rpc('generate_method'))
    keymap('x', '<Leader>mm', phpactor.rpc('extract_method', { visual = true }), { silent = true })
    keymap('n', '<Leader>mx', phpactor.rpc('extract_expression'), { silent = true })
    keymap('x', '<Leader>mx', phpactor.rpc('extract_expression', { visual = true }), { silent = true })
  end,
}, {
  -- TODO: remove me after `gbprod/phpactor.nvim` enhanced
  'phpactor/phpactor',
  ft = 'php',
  build = 'composer install',
  config = function()
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

    keymap('n', '<Leader>x', '<Cmd>call phpactor#ContextMenu()<CR>')
    keymap('n', '<Leader>ml', '<Cmd>call phpactor#ClassNew()<CR>')
    keymap('n', '<Leader>mt', '<Cmd>call phpactor#phpactor#Transform()<CR>')
    keymap('n', '<Leader>me', '<Cmd>call phpactor#ClassExpand()<CR>')
    keymap('n', '<Leader>mm', generate_method)
    keymap('x', '<Leader>mm', ':<C-u>call phpactor#ExtractMethod()<CR>')
    keymap('n', '<Leader>mx', '<Cmd>call phpactor#ExtractExpression(v:false)<CR>')
    keymap('x', '<Leader>mx', ':<C-u>call phpactor#ExtractExpression(v:true)<CR>')
  end,
}}
