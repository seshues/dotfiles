return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      sync_install = true,
      ensure_installed = {
        'lua',
        'python',
        'rust',
        'go',
        'c',
        'zig',
      },
	    highlight = { enable = true },
	    indent = { enable = true },
      autotag = { enable = true },
      modules = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          scope_incremental = '<CR>',
          node_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
        },
      },
    })
  end
}
