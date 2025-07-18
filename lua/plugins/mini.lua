return {
	"echasnovski/mini.nvim",
	version = '*',
	config = function()
		require("mini.move").setup()
		require("mini.surround").setup()
	end
}
