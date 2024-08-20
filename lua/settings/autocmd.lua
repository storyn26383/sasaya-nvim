-- cursorline switching when focus is switched to another split window
local cursorline = vim.api.nvim_create_augroup('cursorline', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  group = cursorline,
  command = 'setlocal cursorline',
})
vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  group = cursorline,
  command = 'setlocal nocursorline',
})

-- remove trailing whitespace before saving buffer
local whitespace = vim.api.nvim_create_augroup('whitespace', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = whitespace,
  command = [[:%s/\s\+$//e]],
})
