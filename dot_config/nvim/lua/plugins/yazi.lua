return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>n', '<cmd>Yazi<CR>', desc = 'Open yazi at the current file',
    },
    {
      '<leader>cw', '<cmd>Yazi cwd<CR>', desc = 'Open yazi in current working directory',
    },
    {
      '<c-up>', '<cmd>Yazi toggle<CR>', desc = 'Resume last yazi session',
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
