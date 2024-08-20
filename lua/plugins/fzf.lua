return {{
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require('fzf-lua')

    fzf.setup({
      winopts = {
        preview = {
          hidden = 'hidden',
          vertical = 'down:50%',
          horizontal = 'right:50%',
        },
      },
      keymap = {
        builtin = {
          false,
          ['<C-_>'] = 'toggle-preview', -- ctrl + /
          ['<C-b>'] = 'preview-page-up',
          ['<C-f>'] = 'preview-page-down',
        },
      },
      fzf_opts = {
        ['--layout'] = false,
      },
      files = {
        git_icons = false,
        file_icons = false,
      },
      grep = {
        git_icons = false,
        file_icons = false,
      },
    })

    vim.api.nvim_create_user_command('Rg', function(opts)
      fzf.grep_project({ search = opts.args })
    end, { bang = true, nargs = '?' })

    vim.api.nvim_create_user_command('BCommits', function(opts)
      fzf.git_bcommits({ query = opts.args })
    end, { bang = true, nargs = '?' })

    local keymap = vim.keymap.set
    local options = { silent = true }
    keymap('n', '<C-P>', fzf.files, options)
    keymap('n', '<Leader>b', fzf.buffers, options)
    keymap('v', '<Leader>g', fzf.grep_visual, options)
    keymap('i', '<C-x><C-f>', fzf.complete_file, options)
  end,
}}
