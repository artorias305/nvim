local map = vim.keymap.set
local servers = { "lua_ls", "clangd", "rust_analyzer", "gopls", "pyright", "tinymist", "ts_ls" }

vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.winborder = "rounded"

vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-telescope/telescope.nvim"
})

local builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown', 'lua', 'rust', 'typst', 'typescript', 'javascript', 'c', 'cpp', 'python' },
	callback = function() vim.treesitter.start() end
})

require("telescope").setup({
	defaults = {
		preview = { treesitter = true },
		color_devicons = true,
		sorting_strategy = "ascending",
		borderchars = {
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""
		},
		path_displays = { "smart" },
		layout_config = {
			height = 100, width = 400, prompt_position = "top", preview_cutoff = 40
		}
	}
})
require("oil").setup({
	columns = {
		"icon"
	}
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers
})
vim.lsp.enable(servers)

vim.cmd.colorscheme('vague')

require("mini.pairs").setup()
require("mini.surround").setup()

map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<Tab>", ":tabnext<CR>")
map("n", "<S-Tab>", ":tabprev<CR>")
map("n", "<leader>e", ":Oil<CR>")
map({ "n", "x", "v" }, "<leader>y", '"+y')
map("n", "<leader>sf", builtin.find_files)
map("n", "<leader>sg", builtin.live_grep)
map("n", "<leader>sh", builtin.help_tags)
map("n", "<leader>sc", builtin.git_commits)

