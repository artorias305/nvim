-- require("highlights")
require("options")
require("plugins")
require("keymaps")

vim.cmd.colorscheme("vesper")

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
