return {
	{ 'ellisonleao/gruvbox.nvim', },
	{ 'RRethy/base16-nvim', },
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				styles = {
					transparency = true,
				},
			})
		end,
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
