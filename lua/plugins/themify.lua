return {
	"lmantw/themify.nvim",
	lazy = false,
	config = function()
		require("themify").setup({
			'craftzdog/solarized-osaka.nvim',
			'folke/tokyonight.nvim',
			'default'
		})
	end
}
