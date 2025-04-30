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
}, {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    'zbirenbaum/copilot.lua',
    'nvim-lua/plenary.nvim',
  },
  build = 'make tiktoken',
  config = function()
    require('CopilotChat').setup({
      auto_insert_mode = true,
      model = 'claude-3.7-sonnet',
      prompts = {
        Commit = {
          prompt = 'Please write a commit message for the changes to be committed. Commit message should start with type of change (feat, fix, chore, etc.) but without scope, and a one line shout description of the changes. Commit message should be in English and follow conventional commit format. Just give me the commit message without any other text.',
          context = 'git:staged',
        }
      },
    })

    vim.api.nvim_create_autocmd('WinEnter', {
      pattern = 'copilot-*',
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        vim.opt_local.conceallevel = 0
      end
    })

    vim.api.nvim_create_user_command('GenerateCommitMessage', function()
      require('CopilotChat').ask('/Commit', {
        callback = function(response)
          require('plenary.async').run(function()
            require('CopilotChat').close()
          end)

          local row, col = unpack(vim.api.nvim_win_get_cursor(0))

          vim.api.nvim_buf_set_text(
            0,
            row - 1, col, row - 1, col,
            require('includes.utils').split(response, '\n')
          )

          return response
        end,
      })
    end, {})
  end,
}}
