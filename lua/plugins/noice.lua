return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify"
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
			}
		})
	end
}
