return {
	"folke/noice.nvim",
	enabled = false,
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
