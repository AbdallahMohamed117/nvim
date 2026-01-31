vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd",vim.cmd.Ex)

vim.keymap.set(
    'n',
    '<leader>vt',
    [[<cmd>vsplit | wincmd l| term<cr>A]],
    { desc = 'Open terminal in vertical split' }
)
vim.keymap.set(
    'n',
    '<leader>ht',
    [[<cmd>split | wincmd j| term<cr>A]],
    { desc = 'Open terminal in horizontal split' }
)
vim.keymap.set(
    't',
    'jk',
    '<C-\\><C-n>',
    { desc = 'Use jk to enter in terminal normal mode' }
)
