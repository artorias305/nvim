vim.g.mapleader = " "

vim.cmd([[hi @lsp.type.number gui=italic]])

vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.showtabline = 2

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

-- vim.o.cursorline = true

vim.o.smoothscroll = true
vim.o.showmode = false
vim.o.undofile = false
vim.o.smartcase = true
vim.o.ignorecase = true
-- vim.o.guicursor = ""

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

vim.keymap.set("n", "<leader>pc", pack_clean)
