vim.lsp.config('lua_ls', {
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
