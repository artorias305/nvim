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
