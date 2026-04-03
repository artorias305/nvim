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
	columns = {},
	view_options = {
		show_hidden = true,
	},
})

require("blink.cmp").setup({
	completion = {
		menu = {
			-- draw = {
			-- 	columns = { { "label", "label_description", gap = 1 } },
			-- },
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
local statusline = require("mini.statusline")
statusline.setup({
	use_icons = false,
	content = {
		active = function()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git({ trunc_width = 40 })
			local filename = statusline.section_filename({ trunc_width = 140 })

			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git } },
				"%=",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
			})
		end,
		inactive = function()
			local filename = statusline.section_filename({ trunc_width = 140 })
			return statusline.combine_groups({
				"%=",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
			})
		end,
	},
})
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "+", change = "~", delete = "_" },
	},
})
require("mini.git").setup()

vim.lsp.enable({ "clangd", "rust_analyzer", "gopls", "zls" })

local telescope = require("telescope")
pcall(telescope.load_extension, "fzf")
