return {
	"stevearc/conform.nvim",
	enabled = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			rust = { "rustfmt", lsp_format = "fallback" },
			typescript = { "prettierd", "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
