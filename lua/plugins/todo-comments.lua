return {{
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
  },
  event = 'BufEnter',
  keys = {
    { '<Leader><Leader>t', '<Cmd>TodoTrouble focus=true<CR>' },
  },
  config = function()
    require('todo-comments').setup()
  end,
}}
