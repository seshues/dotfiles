return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				styles = {
					transparency = true,
				},
			})
			vim.cmd.colorscheme 'rose-pine'
		end,
	},
	{
		'ellisonleao/gruvbox.nvim'
	},
	{
		'RRethy/base16-nvim',
	},
	{
		'vague2k/vague.nvim',
    config = function()
      require('vague').setup({
        style = {

        },

        colors = {

        },
      })
    end,
	},
}
