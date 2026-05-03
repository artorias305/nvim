vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.confirm = true
vim.o.swapfile = false
vim.o.ttimeoutlen = 1
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.cmd('syntax off')

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	flat = { source = 'if_many' },
	jump = { float = true }
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

local servers = { "lua_ls", "pyright", "clangd", "gopls", "rust_analyzer", "ts_ls" }

vim.pack.add({
	"https://github.com/nexxeln/vesper.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/oil.nvim",
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') }
})

require("oil").setup({
	view_options = {
		show_hidden = true
	}
})
require("mini.pairs").setup()
require("mini.pick").setup()
local statusline = require("mini.statusline")
statusline.setup({
	use_icons = false,
	content = {
		active = function()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git({ trunc_width = 40 })
			local filename = statusline.section_filename({ trunc_width = 140 })

			return statusline.combine_groups({
				{ hl = mode_hl,                 strings = { mode } },
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
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers
})
require("blink.cmp").setup()

vim.api.nvim_create_autocmd('FileType', {
	callback = function() pcall(vim.treesitter.start) end
})

vim.lsp.enable(servers)

vim.cmd.colorscheme('vesper')

vim.keymap.set("n", "<leader>sf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>sh", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
