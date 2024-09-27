return {{
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      suggestion = {
        enable = true,
        auto_trigger = true,
        keymap = {
          accept = '<Leader>mc',
          prev = '<M-[>',
          next = '<M-]>',
          dismiss = '<M-c>',
        },
      },
    })

    -- for mac
    local suggestion = require('copilot.suggestion')
    local options = { silent = true }
    vim.keymap.set('i', '“', suggestion.prev, options)
    vim.keymap.set('i', '‘', suggestion.next, options)
    vim.keymap.set('i', 'ç', suggestion.dismiss, options)
  end,
}}
