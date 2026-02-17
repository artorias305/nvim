local map = vim.keymap.set

map("n", "<leader>e", ":Oil<CR>")

local builtin = require("telescope.builtin")
map("n", "<leader>f", "", { desc = 'Telescope' })
-- map("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
map("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buffers' })
-- map("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
map("n", "<leader>fh", builtin.help_tags, { desc = 'Telescope help tags' })
map("n", "<leader>ft", builtin.colorscheme, { desc = 'Telescope colorscheme' })

map("n", "<leader>t", "", { desc = "Tabs" })
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y<CR>', { desc = 'Yank to clipboard' })

map("n", "<leader>q", ":Trouble diagnostics toggle<CR>", { desc = 'Trouble diagnostics' })

map({ "n", "v", "x" }, "gd", builtin.lsp_definitions, { desc = 'LSP Definitions' })
map({ "n", "v", "x" }, "gr", builtin.lsp_references, { desc = 'LSP References' })
map({ "n", "v", "x" }, "gI", builtin.lsp_implementations, { desc = 'LSP Implementations' })
map({ "n", "v", "x" }, "gy", builtin.lsp_type_definitions, { desc = 'LSP Type Definitions' })
map({ "n", "v", "x" }, "gD", vim.lsp.buf.declaration, { desc = 'LSP Buffer Declaration' })
map({ "n", "v", "x" }, "gR", vim.lsp.buf.rename, { desc = "LSP Buffer Rename" })
map({ "n", "v", "x" }, "ga", vim.lsp.buf.code_action, { desc = "LSP Buffer Code Action" })

map("n", "<leader>v", ":e ~/.config/nvim/<CR>", { desc = "Edit nvim config" })

map("n", "<C-c>", ":noh<CR>")

map("n", "s", "", { desc = "Split" })
map("n", "sv", ":vsplit<CR>", { desc = 'Split Vertical' })
map("n", "sh", ":split<CR>", { desc = 'Split Horizontal' })
