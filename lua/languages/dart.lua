require('lspconfig').dartls.setup({
  cmd = { 'fvm', 'dart', 'language-server', '--protocol=lsp' },
  filetypes = { 'dart' },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
})
