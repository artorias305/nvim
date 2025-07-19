return {
	{
		'nvim-treesitter/nvim-treesitter',
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				}
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects"
	}
}
