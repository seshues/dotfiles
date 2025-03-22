return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'jvgrootveld/telescope-zoxide',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap
    keymap.set('n', '<leader>jk', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<CR>",{})
    keymap.set('n', '<C-p>', builtin.find_files, {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})
    keymap.set('n', '<leader>fd', builtin.diagnostics, {})
    keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
    keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, {})
    keymap.set('n', '<leader>fv', builtin.help_tags, {})
    keymap.set('n', '<leader>b', builtin.buffers, {})

    keymap.set('n', '<C-n>', ':Telescope colorscheme<CR>')

    telescope.setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          hidden = true,
          find_command = {
            'rg',
            '--files',
            '--glob',
            '!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}',
            '--path-separator',
            '/',
          },
        },
      },
    })
    telescope.load_extension('ui-select')
    telescope.load_extension('fzf')
    telescope.load_extension('zoxide')

    telescope.load_extension('chezmoi')
    telescope.load_extension('lazygit')
    keymap.set('n', '<leader>cz', telescope.extensions.chezmoi.find_files, {})
  end,
}
