vim.lsp.config('volar', {
  filetypes = { 'vue', 'typescript', 'javascript' },
  init_options = {
    typescript = {
      -- TODO: find workdir first, then find global, or auto install
      tsdk = vim.fn.stdpath('data')..'/lib/node_modules/typescript/lib',
    },
  },
})
