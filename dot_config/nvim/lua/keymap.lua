vim.g.mapleader = ' '
local keymap=vim.keymap

keymap.set('n', '<C-k>', ':wincmd k<CR>')
keymap.set('n', '<C-j>', ':wincmd j<CR>')
keymap.set('n', '<C-h>', ':wimcmd h<CR>')
keymap.set('n', '<C-l>', ':wincmd l<CR>')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<leader>rp', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

keymap.set('n', '<C-a>', 'ggVG')

keymap.set('n', '<leader>p', '"0p')

keymap.set('n', '<leader>ll', ':setlocal spell spelllang=en_us<CR>')
