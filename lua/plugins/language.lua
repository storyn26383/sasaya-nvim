local utils = require('includes.utils')

local languages, servers, dictionary = utils.entities_and_dictionary({
  any = 'typos_lsp',
  lua = 'lua_ls',
  typescript = 'ts_ls',
  javascript = 'ts_ls',
  vue = 'volar',
  php = 'intelephense',
  go = 'gopls',
  python = 'jedi_language_server',
  rust = 'rust_analyzer',
  bash = 'bashls',
  yaml = 'yamlls',
})

return {{
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'ibhagwan/fzf-lua',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = utils.filter(servers, function(value)
        return not utils.in_table(G.disabled_lsp_server, value)
      end),
      handlers = {
        function (server_name)
          if utils.in_table(G.disabled_lsp_server, server_name) then
            return
          end

          local language = dictionary[server_name]

          if language == nil then
            return
          end

          if utils.mod_exists('languages.'..language) then
            require('languages.'..language)
            return
          end

          require('lspconfig')[server_name].setup({})
        end,
      },
    })

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
    })

    vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

    local fzf = require('fzf-lua')
    local fzf_utils = require('fzf-lua.utils')
    local keymap = vim.keymap.set
    local options = { silent = true }

    local lsp_workspace_symbols_visual = function()
      fzf.lsp_workspace_symbols({ lsp_query = fzf_utils.get_visual_selection() })
    end

    keymap('n', '<Leader>d', vim.diagnostic.open_float, options)
    keymap('n', '<Leader>r', fzf.lsp_document_symbols, options)
    keymap('n', '<Leader>t', fzf.lsp_live_workspace_symbols, options)
    keymap('v', '<Leader>t', lsp_workspace_symbols_visual, options)
    keymap('n', '<Leader>v', vim.lsp.buf.hover, options)
    keymap('n', '<Leader>mr', vim.lsp.buf.rename, options)
    keymap('n', '<Leader>mf', fzf.lsp_references, options)
    keymap('n', '<Leader>a', vim.lsp.buf.code_action, options)
    keymap('n', '[d', vim.diagnostic.goto_prev, options)
    keymap('n', ']d', vim.diagnostic.goto_next, options)
  end,
}, {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = utils.except(languages, 'any'),
      sync_install = false,
      highlight = {
        enable = true,
        disable = {
          'vimdoc',
        },
      },
      indent = {
        enable = true,
        disable = {
          'lua',
        },
      },
    })
  end
}, {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    { '<Leader><Leader>x', '<Cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>' },
  },
  config = function()
    require('trouble').setup({
      auto_preview = false,
      keys = {
        o = 'jump',
        ['<ESC>'] = 'close',
      },
    })
  end,
}}
