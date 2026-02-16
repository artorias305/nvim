local map = vim.keymap.set

map("n", "<leader>e", ":Oil<CR>")

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
map("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buffers' })
map("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
map("n", "<leader>fh", builtin.help_tags, { desc = 'Telescope help tags' })
