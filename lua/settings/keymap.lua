-- leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- command mode
vim.keymap.set('c', '<C-A>', '<HOME>')
vim.keymap.set('c', '<C-E>', '<END>')
vim.keymap.set('c', '<C-B>', '<LEFT>')
vim.keymap.set('c', '<C-D>', '<DEL>')
vim.keymap.set('c', '<C-F>', '<RIGHT>')
vim.keymap.set('c', '<C-H>', '<BS>')
vim.keymap.set('c', '<C-N>', '<DOWN>')
vim.keymap.set('c', '<C-P>', '<UP>')
vim.keymap.set('c', '<ESC><C-B>', '<S-LEFT>')
vim.keymap.set('c', '<ESC><C-F>', '<S-RIGHT>')

-- fast save
vim.keymap.set('n', '<Leader>s', ':w<CR>')

-- close buffer
vim.keymap.set('n', '<Leader>w', ':bd<CR>')

-- fold
vim.keymap.set('n', '<Leader>k1', ':set foldlevel=0<CR>')
vim.keymap.set('n', '<Leader>k2', ':set foldlevel=1<CR>')
vim.keymap.set('n', '<Leader>k3', ':set foldlevel=2<CR>')
vim.keymap.set('n', '<Leader>k4', ':set foldlevel=3<CR>')
vim.keymap.set('n', '<Leader>k5', ':set foldlevel=4<CR>')
vim.keymap.set('n', '<Leader>k6', ':set foldlevel=5<CR>')
vim.keymap.set('n', '<Leader>k7', ':set foldlevel=6<CR>')
vim.keymap.set('n', '<Leader>k8', ':set foldlevel=7<CR>')
vim.keymap.set('n', '<Leader>k9', ':set foldlevel=8<CR>')
vim.keymap.set('n', '<Leader>k0', ':set foldlevel=100<CR>')

-- go to definition
vim.keymap.set('n', 'g]', '<C-]>')
vim.keymap.set('n', 'g[', '<C-O>')

-- indentation
vim.keymap.set('n', 'g.', 'v>')
vim.keymap.set('n', 'g,', 'v<')
vim.keymap.set('v', 'g.', '>gv')
vim.keymap.set('v', 'g,', '<gv')

-- move lines up and down using ctrl+[jk]
vim.keymap.set('n', '<C-J>', 'mz:m+<CR>`z')
vim.keymap.set('n', '<C-K>', 'mz:m-2<CR>`z')
vim.keymap.set('v', '<C-J>', ':m\'>+<CR>`<my`>mzgv`yo`z')
vim.keymap.set('v', '<C-K>', ':m\'<-2<CR>`>my`<mzgv`yo`z')

-- move to the prev or next buffer using ctrl+[hl]
vim.keymap.set('n', '<C-H>', ':bprevious<CR>')
vim.keymap.set('n', '<C-L>', ':bnext<CR>')

-- resize split window faster
vim.keymap.set('n', '<C-W>+', ':resize +10<CR>')
vim.keymap.set('n', '<C-W>-', ':resize -10<CR>')
vim.keymap.set('n', '<C-W>>', ':vertical resize +10<CR>')
vim.keymap.set('n', '<C-W><', ':vertical resize -10<CR>')

-- cancel searched highlight
vim.keymap.set('n', '<Leader><Space>', ':nohlsearch<CR>')

-- fast copy & paste
vim.keymap.set('n', '<C-Y>', '"zY')
vim.keymap.set('v', '<C-Y>', '"zy')
vim.keymap.set('v', '<C-P>', '"zp')

-- same behavior as vim
vim.keymap.set('n', 'Y', 'yy')

-- coerce string
vim.keymap.set('n', '<Leader>c', require('includes.coerce-string').coerce_string)
vim.keymap.set('x', '<Leader>c', function() require('includes.coerce-string').coerce_string({ visual = true }) end)
