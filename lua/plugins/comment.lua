return {{
  'numToStr/Comment.nvim',
  keys = {
    { '<Leader>/', '<Plug>(comment_toggle_linewise_current)' },
    { '<Leader>/', '<Plug>(comment_toggle_linewise_visual)', mode = 'x' },
  },
  config = function()
    require('Comment').setup()
  end,
}}
