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
}}
