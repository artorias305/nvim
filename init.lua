vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 8
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.opt.winborder = "rounded"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/datsfilipe/vesper.nvim" },
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/lervag/vimtex" }
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end
})
vim.cmd("set completeopt+=noselect")

require "mini.pick".setup()
require "oil".setup()
require "nvim-autopairs".setup()

vim.keymap.set('n', '<leader>g', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

vim.lsp.enable(
	{
		"lua_ls",
		"clangd",
		"tinymist",
		"cssls",
		"html",
		"ts_ls",
		"tailwindcss",
		"jsonls",
		"eslint",
		"rust_analyzer",
		"pyright",
		"texlab"
	}
)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

vim.keymap.set({ 'x', 'n' }, '<C-s>', [[<esc>:'<,'>s/\V/]])

vim.keymap.set('n', '<C-c>', ':noh<CR>')

vim.keymap.set('n', '<leader>v', ':edit ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>z', ':edit ~/.zshrc<CR>')

vim.api.nvim_create_user_command(
	'Typstfmt',
	function()
		local file = vim.fn.expand('%:p')
		vim.cmd('!typstyle -i ' .. vim.fn.shellescape(file))
	end,
	{}
)

vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_compiler_latexmk = {
	aux_dir = "/Users/kiq/.texfiles",
	out_dir = "/Users/kiq/.texfiles"
}

vim.keymap.set('n', '<leader>tf', ':Typstfmt<CR>')
vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>")
vim.keymap.set('n', '<C-.>', function() vim.cmd('!open .') end)

vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")

vim.keymap.set("n", "<leader>tt", ":Telescope colorscheme<CR>")
