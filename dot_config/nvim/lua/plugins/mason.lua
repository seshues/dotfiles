return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'whoissethdaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      auto_install = true,
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'lua_ls',
        'stylua',
        'eslint_d',
        'prettierd',
        'black',
        'isort',
        'rust_analyzer',
        'pylsp',
        'clangd',
        'gopls',
        'zls',
        'ocamllsp',
      },
    })
  end
}
