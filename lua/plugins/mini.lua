return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.icons").setup()
		require("mini.statusline").setup()
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "_" },
			},
		})
		require("mini.git").setup()
	end,
}
