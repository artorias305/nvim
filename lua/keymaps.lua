local map = vim.keymap.set

map("n", "<leader>e", ":Oil<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y<CR>', { desc = "Yank to clipboard" })
