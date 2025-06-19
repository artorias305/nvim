return {
	"lervag/vimtex",
	lazy = false,
	ft = { "tex", "markdown" },
	init = function()
		vim.g.vimtex_view_method = "zathura"
	end,
}
