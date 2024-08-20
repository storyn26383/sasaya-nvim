return {{
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<Leader>kb', '<Cmd>NvimTreeToggle<CR>' },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup({
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = false,
          },
          glyphs = {
            folder = {
              arrow_closed = '▸',
              arrow_open = '▾',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
          }
        },
      },
      git = {
        enable = false,
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end
}}
