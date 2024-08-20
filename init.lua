-- environments --
require('settings.global')
require('includes.utils').require_if_exists('settings.environment')

-- settings --
require('settings.basic')
require('settings.keymap')
require('settings.autocmd')

-- plugin manager --
require('settings.lazy-nvim')
