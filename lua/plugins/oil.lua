return {
	"stevearc/oil.nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	cmd = { "Oil" },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open Oil file explorer" },
	},
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			}
		})
	end
}
