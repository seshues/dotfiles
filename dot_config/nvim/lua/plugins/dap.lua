return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    'nvim-telescope/telescope-dap.nvim',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    require('dapui').setup()
    require('dap-go').setup()

    local dap, dapui = require('dap'), require('dapui')

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    local keymap = vim.keymap
    keymap.set('n', '<leader>dt', ':DapToggleBreakpoint<CR>')
    keymap.set('n', '<leader>dc', ':DapContinue<CR>')
    keymap.set('n', '<leader>dx', ':DapTerminate<CR>')
    keymap.set('n', '<leader>do', ':DapStepOver<CR>')
  end,
}
