vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader= " "

-- save with ctrl-s and go to normal mode if needed
vim.keymap.set('n', '<C-s>', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>', { noremap = true, silent = true })

-- load the lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- list of plugins
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"}
}
local opts = {}

-- load the plugins
require("lazy").setup(plugins, opts)

-- setup telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- setup treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "ruby"},
  highlight = { enable = true },
  indent = { enable = true }
})

-- setup colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
