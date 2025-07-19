vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- vim.diagnostic.disable()
vim.wo.number = true
vim.wo.relativenumber = true
