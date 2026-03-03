return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({
			"lua_ls",
			"ts_ls",
			"clangd",
			"rust_analyzer",
			"tailwindcss",
			"gopls",
			"tinymist",
			"cssls",
			"html",
			"zls",
		})
	end,
}
