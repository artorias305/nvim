return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	enabled = true,
	cmd = { "Oil" },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open Oil file explorer" },
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end
}
