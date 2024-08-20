return {{
  'vim-test/vim-test',
  keys = {
    { '<Leader>N', "<Cmd>TestNearest<CR>" },
    { '<Leader>F', "<Cmd>TestFile<CR>" },
    { '<Leader>g', "<Cmd>TestLast<CR>" },
  },
  config = function()
    vim.g['test#basic#start_normal'] = 1
  end
}}
