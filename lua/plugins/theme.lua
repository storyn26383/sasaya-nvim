local tomorrow_night = {
  red = '#cc6666',
  orange = '#de935f',
  yellow = '#f0c674',
  green = '#b5bd68',
  cyan = '#8abeb7',
  blue = '#81a2be',
  purple = '#b294bb',
  brown = '#a3685a',
  gray_darkest = '#1d1f21',
  gray_darker = '#282a2e',
  gray_dark = '#373b41',
  gray = '#969896',
  gray_light = '#b4b7b4',
  gray_lighter = '#c5c8c6',
  gray_lightest = '#e0e0e0',
}

return {{
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      styles = {
        comments = {},
        conditionals = {},
        miscs = {},
      },
      color_overrides = {
        mocha = {
          rosewater = tomorrow_night.brown,
          flamingo = tomorrow_night.red,
          pink = tomorrow_night.purple,
          mauve = tomorrow_night.purple,
          red = tomorrow_night.red,
          maroon = tomorrow_night.red,
          peach = tomorrow_night.orange,
          yellow = tomorrow_night.yellow,
          green = tomorrow_night.green,
          teal = tomorrow_night.cyan,
          sky = tomorrow_night.blue,
          sapphire = tomorrow_night.blue,
          blue = tomorrow_night.blue,
          lavender = tomorrow_night.purple,
          text = tomorrow_night.gray_lighter,
          subtext1 = tomorrow_night.gray_light,
          subtext0 = '#adb0ad',
          overlay2 = '#a5a8a5',
          overlay1 = '#9ea09e',
          overlay0 = tomorrow_night.gray,
          surface2 = '#7f8181',
          surface1 = '#676a6c',
          surface0 = '#4f5357',
          base = tomorrow_night.gray_darkest,
          mantle = tomorrow_night.gray_darker,
          crust = tomorrow_night.gray_dark,
        },
      },
      highlight_overrides = {
        mocha =  function(colors)
          return {
            CursorLine = { bg = colors.mantle },
            CursorColumn = { bg = colors.mantle },
            Visual = { bg = colors.crust, style = {} },
            VisualNOS = { bg = colors.crust, style = {} },
            Folded = { bg = colors.none, fg = colors.surface1 },
            Search = { bg = colors.yellow, fg = colors.base },
            IncSearch = { bg = colors.yellow, fg = colors.base },
            CurSearch = { bg = colors.peach, fg = colors.base, style = {} },
            DressingInputText = { bg = colors.base, fg = colors.text },
            DressingSelectText = { bg = colors.base, fg = colors.text },
            DressingSelectIdx = { bg = colors.mantle },
            QuickFixLine = { bg = colors.crust, style = {} },
            NormalFloat = { bg = colors.crust, fg = colors.text },

            NvimTreeNormal = { bg = colors.base, fg = colors.text },
            NvimTreeExecFile = { fg = colors.green },
            NvimTreeRootFolder = { fg = colors.red },
            NvimTreeWinSeparator = { fg = colors.crust },

            Translator = { bg = colors.crust, fg = colors.text },

            TODO = { fg = colors.overlay0 },
            Operator = { fg = colors.text },
            Function = { fg = colors.text },
            Structure = { fg = colors.teal },
            Special = { fg = colors.text },
            ['@module'] = { fg = colors.text },
            ['@variable'] = { fg = colors.red },
            ['@variable.member'] = { fg = colors.teal },
            ['@lsp.type.variable'] = { fg = colors.red },
            ['@property'] = { fg = colors.teal },
            ['@constructor'] = { fg = colors.text },
            ['@function'] = { fg = colors.blue },
            ['@function.call'] = { fg = colors.blue },
            ['@constructor.lua'] = { fg = colors.overlay2 },
            ['@keyword.modifier.php'] = { fg = colors.yellow },
          }
        end,
      },
    })

    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
    vim.cmd.colorscheme('catppuccin')
  end,
}, {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        refresh = {
          statusline = 250,
          tabline = 250,
          winbar = 250,
        },
      },
      sections = {
        lualine_a = {{
          'mode',
          fmt = function(mode)
            if vim.opt.paste:get() then
              mode = mode..'  PASTE'
            end

            return mode
          end,
        }},
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
      },
      tabline = {
        lualine_a = {{
          'buffers',
          mode = 0,
          max_length = vim.o.columns * 0.9,
          symbols = {
            alternate_file = '',
          },
        }},
        lualine_z = {{
          'tabs',
          mode = 0,
          cond = function()
            return #vim.fn.gettabinfo() > 1
          end,
        }},
      },
    })
  end,
}}
