return {{
  'storyn26383/vim-translator',
  keys = {
    { '<Leader>y', '<Plug>TranslateW', silent = true},
    { '<Leader>y', '<Plug>TranslateWV', silent = true, mode = 'v' },
  },
  config = function ()
    vim.g.translator_target_lang = 'zh-TW'
    vim.g.translator_default_engines = { 'google' }
  end
}}
