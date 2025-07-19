return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"andrew-george/telescope-themes",
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		telescope.setup({
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
					}
				}
			}
		})

		vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>",
			{ noremap = true, silent = true, desc = "Theme Switcher" })
	end
}
