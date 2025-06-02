-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Switch windows with tab
vim.keymap.set('n', '<tab>', '<c-w>w', { desc = 'Next Window' })
vim.keymap.set('n', '<S-tab>', '<c-w>W', { desc = 'Prev Window' })

-- avoid accidental movement
vim.keymap.set({ 'n', 'v' }, '<S-Up>', 'k')
vim.keymap.set({ 'n', 'v' }, '<S-Down>', 'j')

-- save with ctrl-s and exit insert mode
vim.keymap.set('n', '<C-s>', ':update<CR>')
vim.keymap.set('i', '<C-s>', '<ESC>:update<CR>')

return {

  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
