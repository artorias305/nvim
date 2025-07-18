return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			enabled = function(bufnr) return true end,
		})
	end
}
