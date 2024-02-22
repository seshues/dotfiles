return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals =  { 'vim' },
            },
          },
        },
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities
      })

      local keymap = vim.keymap
      keymap.set('n', 'K', vim.lsp.buf.hover, {})
      keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
  },
}
