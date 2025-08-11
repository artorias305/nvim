vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.hlsearch = true
vim.opt.mouse = "a"

vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.guicursor = ""

vim.opt.undofile = true
