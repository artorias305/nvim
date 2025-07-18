local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<leader>ths", ":Themify<CR>", { desc = "Open themify colorscheme menu" })

map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

map("n", "<leader>s", '', { desc = "Split Window" })
map("n", "<leader>sv", ':vsplit<CR>', { desc = "Vertical Split" })
map("n", "<leader>sh", ':hsplit<CR>', { desc = "Horizontal Split" })
