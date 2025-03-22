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
            telemetry = { 
              enable = false,
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities
      })
      
      lspconfig.ocamllsp.setup({
        capabilities = capabilities,
        cmd = { 'ocamllsp', '--stdio' },
        filetypes = { 'ocaml', 'reason' },
        root_dir = require('lspconfig').util.root_pattern('*.opam', 'esy.json', 'package.json'),
      })

      lspconfig.zls.setup({
        capabilities = capabilities,
        cmd = { 'zls' },
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      require('lspconfig').clangd.setup({
        cmd = {
          'clangd',
          '--background-index',
          '--pch-storage=memory',
          '--all-scopes-completion',
          '--pretty',
          '--header-insertion=never',
          '-j=4',
          '--inlay-hints',
          '--header-insertion-decorators',
          '--function-arg-placeholders',
          '--completion-style=detailed',
        },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
        root_dir = require('lspconfig').util.root_pattern('src'),
        init_option = { fallbackFlags = { '-std=c++2a' } },
        capabilities = capabilities,
        single_file_support = true,
      })

      local keymap = vim.keymap
      keymap.set('n', 'K', vim.lsp.buf.hover, {})
      keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {})
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
