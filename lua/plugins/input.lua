return {{
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      input = {
        win_options = {
          winhighlight = 'NormalFloat:DressingInputText'
        },
      },
      select = {
        backend = { 'builtin' },
        builtin = {
          relative = 'cursor',
          win_options = {
            winhighlight = 'NormalFloat:DressingSelectText'
          },
        },
      },
    })
  end,
}}
