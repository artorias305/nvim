vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.opt.list = true
-- vim.opt.listchars = vim.opt.listchars + "space:·"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.mouse = "a"

-- vim.o.winborder = "rounded"
vim.o.hlsearch = true
vim.o.backup = false
vim.o.signcolumn = "yes"

vim.o.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.o.cursorline = true

vim.o.smoothscroll = true
vim.o.showmode = false
vim.o.undofile = true
vim.o.smartcase = true
vim.o.ignorecase = true
-- vim.o.guicursor = ""
