require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      workspace = {
        library = {
          os.getenv('VIMRUNTIME'),
        },
      },
    },
  },
})
