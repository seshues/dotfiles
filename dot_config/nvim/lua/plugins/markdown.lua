return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
		opts = {
			heading = {
				icons = {},
			},
			html = {
				comment = {
					conceal = false,
				},
			},
			render_modes = true,
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { 'markdown' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    config = function()
      vim.keymap.set('n', '<leader>mdn', ':MarkdownPreview<CR>')
      vim.keymap.set('n', '<leader>mds', ':MarkdownPreviewStop<CR>')
    end,
	},
}
