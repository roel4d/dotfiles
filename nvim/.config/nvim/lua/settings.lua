vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader= " "

-- save with ctrl-s and go to normal mode if needed
vim.keymap.set('n', '<C-s>', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>', { noremap = true, silent = true })

-- change window also with tab
vim.keymap.set('', '<tab>', '<c-w>w', { noremap = true })
vim.keymap.set('', '<S-tab>', '<c-w>W', { noremap = true })

-- use system clipboard
vim.opt.clipboard = "unnamedplus"
