local utils = require('includes.utils')

utils.language('php', function()
  utils.set_option_value('tabstop', 4)
  utils.set_option_value('shiftwidth', 4)
  utils.set_option_value('softtabstop', 4)
end)
