-- Options
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.guicursor = ""

-- Plugins setup
vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",               version = 'v1.8.0' },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/folke/trouble.nvim",             cmd = "Trouble" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/dgox16/oldworld.nvim" },
	{ src = "https://github.com/nexxeln/vesper.nvim" }
})

-- Enable LSP Servers
vim.lsp.enable({ "clangd", "lua_ls", "tinymist", "pyright", "gopls", "rust_analyzer", "ts_ls",
	"bash-language-server", "cssls", "html", "jdtls", "nixd" })

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		tsx = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" }
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback"
	}
})

require("nvim-treesitter").setup({})

local langs = {
	"bash", "c", "diff", "html", "css", "javascript", "typescript", "tsx", "json", "lua", "luadoc", "markdown",
	"markdown_inline", "python", "query", "regex", "vim", "vimdoc", "yaml", "toml", "rust", "go", "typst", "cpp"
}

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

require("nvim-treesitter").install(langs)

require("trouble").setup()

require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	float_opts = {
		border = "curved"
	}
})

require("oil").setup({
	columns = {
		"permissions",
		"icon"
	},
	view_options = {
		show_hidden = true
	}
})

require("gitsigns").setup({
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust" },
})

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.align").setup()
require("mini.icons").setup()

-- Functions
local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Color scheme
local theme = "vesper"
vim.cmd.colorscheme(theme)

-- Keymaps
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>pc", pack_clean)
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>h", builtin.help_tags)
vim.keymap.set("n", "<leader>g", builtin.live_grep)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>c", builtin.git_commits)

vim.keymap.set("n", "<leader>q", ":Trouble diagnostics toggle<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>")

vim.keymap.set("n", "<C-c>", ":noh<CR>")

vim.keymap.set("n", "gr", builtin.lsp_references)

vim.keymap.set("n", "<leader>v", ":e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>z", ":e ~/.zshrc<CR>")

vim.keymap.set("n", "<leader>m", builtin.man_pages)

vim.keymap.set("n", "<leader>t", builtin.colorscheme)

vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")

vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>")
