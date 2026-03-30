vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/scottmckendry/cyberdream.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/NMAC427/guess-indent.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
    'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim'
})

require("ibl").setup({
	indent = {
		highlight = {
			"WhiteSpace",
		},
		char = "┊",
	},
	scope = {
		show_start = false,
		show_end = false,
		char = "│",
		highlight = {
			"IndentBlanklineChar",
		},
	},
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

require("oil").setup()

require("blink.cmp").setup({
	completion = {
		menu = {
			auto_show = true,
		},
	},
	fuzzy = {
		implementation = "prefer_rust",
	},
	signature = {
		enabled = true,
	},
	keymap = {
		preset = "default",
		["<C-n>"] = {
			"show",
			"select_next",
		},
		["<C-e>"] = { "hide" },
	},
	appearance = {
		nerd_font_variant = "mono",
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
require("mini.statusline").setup()
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "+", change = "~", delete = "_" },
	},
})
require("mini.git").setup()

vim.lsp.enable({ "clangd", "rust-analyzer", "gopls" })
