return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'lewis6991/gitsigns.nvim',
  },
  config = function()
    local keymap = vim.keymap
    keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', {})

    require('gitsigns').setup({
    })
  end
}
