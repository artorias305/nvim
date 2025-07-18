return {
	"lmantw/themify.nvim",
	lazy = false,
	config = function()
		require("themify").setup({
			'folke/tokyonight.nvim',
			'default'
		})
	end
}
