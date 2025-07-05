vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- save with ctrl-s and go to normal mode if needed
vim.keymap.set('n', '<C-s>', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>', { noremap = true, silent = true })

-- change window also with tab
vim.keymap.set('n', '<tab>', '<c-w>w', { noremap = true })
vim.keymap.set('n', '<S-tab>', '<c-w>W', { noremap = true })

-- vertical split
vim.keymap.set('n', '"', ':vsplit<CR>', { noremap = true })

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

-- show warnings
vim.diagnostic.config({ virtual_text = true })
