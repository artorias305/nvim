vim.g.mapleader = " "

local map = vim.keymap.set
local theme = "tokyonight-night"

-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.showmode = false
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	virtual_text = true,
	virtual_lines = false,
	jump = { float = true }
}

-- Plugins
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/vague2k/vague.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/folke/tokyonight.nvim"
})

-- Setups
require("oil").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("mason").setup()
servers = { "rust_analyzer", "gopls", "clangd", "lua_ls", "basedpyright" }
require("mason-lspconfig").setup({
	ensure_installed = servers
})

require("blink.cmp").setup({
	keymap = {
		preset = 'default',
	},
	appearance = {
		nerd_font_variant = 'mono',
	},
	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},
	sources = {
		default = { 'lsp', 'path', 'snippets' },
	},
	fuzzy = { implementation = 'lua' },
	signature = { enabled = true },
})

vim.lsp.enable(servers)

-- Keymaps
local builtin = require("telescope.builtin")

map("n", "<leader>e", ":Oil<CR>")

map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>fh", builtin.help_tags)
map("n", "<leader>fc", builtin.git_commits)
map("n", "<leader>ft", builtin.colorscheme)
map("n", "<leader>m", builtin.git_branches)
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<C-c>", ":noh<CR>")
map("n", "<leader>q", vim.diagnostic.setloclist)

-- Cmds
vim.cmd.colorscheme(theme)
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})
