local map = vim.keymap.set
local servers = { "lua_ls", "clangd", "rust_analyzer", "gopls", "pyright", "tinymist", "ts_ls" }

vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.breakindent = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.confirm = true
vim.o.confirm = true
vim.o.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})

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
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/chomosuke/typst-preview.nvim",
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]

local builtin = require("telescope.builtin")

local langs = { 'markdown', 'lua', 'rust', 'typst', 'typescript', 'javascript', 'c', 'cpp', 'python', 'go' }

require("nvim-treesitter").install(themes)

vim.api.nvim_create_autocmd('FileType', {
	pattern = langs,
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

local theme_state_file = vim.fs.joinpath(vim.fn.stdpath("state"), "last_theme.txt")

local function load_last_theme()
	local file = io.open(theme_state_file, "r")
	if file then
		local theme = file:read("*l")
		file:close()
		if theme and theme ~= "" and pcall(vim.cmd.colorscheme, theme) then
			return
		end
	end

	vim.cmd.colorscheme("tokyonight-night")
end

load_last_theme()

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()

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
map("n", "<leader>st", builtin.colorscheme)
map("n", "<leader>sq", builtin.diagnostics)
map("n", "<C-c>", ":noh<CR>")
map("n", "<leader>q", vim.diagnostic.setloclist)
map("n", "<leader>v", ":e $MYVIMRC<CR>")
map("n", "<leader>tp", ":TypstPreviewToggle<CR>")

vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	virtual_text = true,
	virtual_lines = false,

	jump = { float = true }
}

local function apply_custom_theme_overrides()
	if vim.g.colors_name == 'tokyonight-night' then
		vim.o.list = true
		vim.o.cursorline = true
		vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
	elseif vim.g.colors_name == 'vague' then
		vim.o.list = false
		vim.o.cursorline = false
		vim.o.showtabline = 2
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#2b2a33" })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#d2d2d2", fg = "#2b2a33" })
		vim.api.nvim_set_hl(0, "TabLine", { fg = "#d2d2d2", bg = "#2b2a33" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "#6e6a86", fg = "#d0cdda" })
	else
		vim.o.list = false
		vim.o.cursorline = false
	end
end

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = "*",
	callback = function()
		local state_dir = vim.fn.stdpath("state")
		vim.fn.mkdir(state_dir, "p")

		local file = io.open(theme_state_file, "w")
		if file then
			file:write(vim.g.colors_name)
			file:close()
		end
	end
})

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = "*",
	callback = apply_custom_theme_overrides
})

apply_custom_theme_overrides()
