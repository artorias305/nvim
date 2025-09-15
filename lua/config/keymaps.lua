local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<leader>t", '', { desc = "Theme" })

map("n", "<leader>f", '', { desc = "Find" })
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fc", function()
	require("telescope.builtin").find_files({
		prompt_title = "Neovim Config",
		cwd = vim.fn.stdpath("config"),
		hidden = true,
	})
end, { desc = "Telescope Find in Neovim config" })

map("n", "<leader>s", '', { desc = "Split Window" })
map("n", "<leader>sv", ':vsplit<CR>', { silent = true, desc = "Vertical Split" })
map("n", "<leader>sh", ':hsplit<CR>', { silent = true, desc = "Horizontal Split" })

map("n", "<C-c>", ":nohlsearch<CR>:match<CR>:diffupdate<CR>", { silent = true })

map("n", "<leader>d", '', { desc = "Diagnostics" })
map("n", "<leader>da", vim.diagnostic.setloclist, { desc = "Show all diagnostics in quickfix list" })

map("n", "<leader>e", ':Neotree toggle<CR>', { desc = "Toggle Neotree", silent = true })

map("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move down in buffer with cursor centered" })

map("n", "J", "mzJ`z")

map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle Undotree panel", silent = true })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show Hover Documentation" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "<leader>mp", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format Code" })
map("v", "<leader>mp", vim.lsp.buf.format, { desc = "Format Visual Selection" })

local function compile_and_run_c()
	vim.cmd("w")
	local filename = vim.fn.expand("%")
	local output = vim.fn.expand("%:r")
	local compile_cmd = string.format("gcc -g %s -o %s", filename, output)
	local success, _ = pcall(vim.cmd, "!" .. compile_cmd)

	if not success then
		vim.notify("Compilation failed.", vim.log.levels.ERROR)
		return
	end

	vim.cmd('botright term')
	vim.cmd("startinsert!")
	local run_cmd = string.format("./%s", output)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(run_cmd .. '\n', true, false, true), 't', false)
end

map("n", "<leader>cr", compile_and_run_c, { noremap = true, silent = true })

map("n", "<leader>tp", ":TypstPreview<CR>", { buffer = 0 })

vim.cmd([[
	setlocal wrapmargin=0
	setlocal formatoptions+=t
	setlocal linebreak
	setlocal spell
	setlocal wrap
]])

map("n", "<leader>tf", function()
	local current_file = vim.fn.expand('%:p')
	vim.cmd('!' .. 'typstyle -i ' .. current_file)
end, { desc = "Format typst file" })
