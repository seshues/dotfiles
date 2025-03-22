return {
  {
    'Wansmer/treesj',
    keys = { '<leader>m', '<leader>j', '<leader>s'},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({})
    end,
    opts = {},
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          require("none-ls.diagnostics.eslint_d"),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.ocamlformat,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.asmfmt
        },
      })

      local keymap = vim.keymap
      keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end,
  },
}
