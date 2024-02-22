return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim'
  },
  config = function()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          visible = true,
        }
      }
    })

    local keymap = vim.keymap
    keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    keymap.set('n', '<leader><tab>', ':Neotree position=current<CR>', {})
    keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
  end
}
