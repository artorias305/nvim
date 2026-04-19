vim.g.mapleader = " "

local map = vim.keymap.set

-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- Plugins
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-lua/plenary.nvim"
})

-- Setups
require("oil").setup()
require("mini.pairs").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"gopls",
		"clangd",
		"lua_ls",
		"ts_ls",
		"basedpyright"
	}
})

-- Keymaps
local builtin = require("telescope.builtin")

map("n", "<leader>e", ":Oil<CR>")

map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>fh", builtin.help_tags)
map("n", "<leader>fc", builtin.git_commits)
