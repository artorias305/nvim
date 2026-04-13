require("options")
require("plugins")
require("keymaps")

vim.cmd.colorscheme("vague")

vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#2b2a33" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#d2d2d2", fg = "#2b2a33" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#d2d2d2", bg = "#2b2a33" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#6e6a86", fg = "#d0cdda" })
