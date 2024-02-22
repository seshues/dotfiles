return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap
    keymap.set('n', '<C-p>', builtin.find_files, {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})
    keymap.set('n', '<leader>b', builtin.buffers, {})

    telescope.setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    })
    telescope.load_extension('ui-select')
    telescope.load_extension('chezmoi')
    telescope.load_extension('lazygit')
    keymap.set('n', '<leader>cz', telescope.extensions.chezmoi.find_files, {})
  end,
}
