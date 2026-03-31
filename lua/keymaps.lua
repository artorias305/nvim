local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<leader>e", ":Oil<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y<CR>', { desc = "Yank to clipboard" })

map("n", "<leader>f", "", { desc = "Telescope" })
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>ft", builtin.colorscheme, { desc = "Telescope colorscheme" })
map("n", "<leader>q", vim.diagnostic.setloclist)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-c>", ":noh<CR>")
map("n", "<leader>v", ":e ~/.config/nvim")
