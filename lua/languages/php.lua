local utils = require('includes.utils')

utils.language('php', function()
  utils.set_option_value('tabstop', 4)
  utils.set_option_value('shiftwidth', 4)
  utils.set_option_value('softtabstop', 4)

  local php_cs_fix = function()
    local php_cs_fixer_command = vim.g.php_cs_fixer_command or 'vendor/bin/pint % || vendor/bin/php-cs-fixer fix'
    vim.api.nvim_exec('! '..php_cs_fixer_command..' '..vim.fn.expand('%'), false)
  end

  vim.keymap.set('n', '<Leader>f', php_cs_fix)
end)
