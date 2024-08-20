return {{
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    if pcall(require, 'copilot_cmp') then
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require('copilot_cmp').setup()

      return
    end

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
}, {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'InsertEnter',
  config = function()
    require('codeium').setup()
  end
}}
