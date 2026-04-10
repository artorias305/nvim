vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/scottmckendry/cyberdream.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/NMAC427/guess-indent.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nexxeln/vesper.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/j-hui/fidget.nvim",
})

local servers = { clangd = {}, rust_analyzer = {}, gopls = {}, zls = {}, ols = {}, ts_ls = {}, stylua = {} }

local ensure_installed = vim.tbl_keys(servers or {})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, server in ipairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end

require("gitsigns").setup({
	signs = {
		add = { text = "+" }, ---@diagnostic disable-line: missing-fields
		change = { text = "~" }, ---@diagnostic disable-line: missing-fields
		delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
		topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
		changedelete = { text = "~" }, ---@diagnostic disable-line: missing-fields
	},
	current_line_blame = true,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		rust = { "rustfmt", lsp_format = "fallback" },
		typescript = { "prettierd", "prettier" },
		go = { "goimports", "gofmt" },
		zig = { "zigfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("oil").setup({
	columns = { "icon" },
	view_options = {
		show_hidden = true,
	},
})

require("blink.cmp").setup({
	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},
	fuzzy = {
		implementation = "prefer_rust",
	},
	signature = {
		enabled = true,
	},
	keymap = {
		preset = "default",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets" },
	},
})

require("cyberdream").setup({
	transparent = true,
	borderless_pickers = false,
	saturation = 0.95,
	cache = true,
})

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.statusline").setup({
	use_icons = vim.g.have_nerd_font,
})

local telescope = require("telescope")
pcall(telescope.load_extension, "fzf")
