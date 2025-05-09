vim.lsp.config('tsserver', {
  filetypes = { 'typescript', 'javascript', 'vue' },
  init_options = {
    plugins = {{
      name = '@vue/typescript-plugin',
      -- TODO: find workdir first, then find global, or auto install
      location = vim.fn.stdpath('data')..'/lib/node_modules/@vue/typescript-plugin',
      languages = { 'typescript', 'javascript', 'vue' },
    }},
  },
})
