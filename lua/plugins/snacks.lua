return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		-- dashboard = { enabled = true },
		-- image = { enabled = true },
		-- notifier = { enabled = true },
		-- lazygit = { enabled = true },
		-- quickfile = { enabled = true },
		terminal = { enabled = true }
	},
	keys = {
		{ "<leader>lg", function() Snacks.lazygit() end,  desc = "Lazygit" },
		{ "<leader>st", function() Snacks.terminal() end, desc = "Toggle Terminal" }
	}
}
