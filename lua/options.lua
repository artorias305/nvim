vim.g.mapleader = " "

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.o.title = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hlsearch = true
vim.o.backup = false
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.o.expandtab = true
vim.o.scrolloff = 10
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "cursor"
vim.o.mouse = ""

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.termguicolors = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.g.lazyvim_picker = "telescope"

local theme = "vesper"
vim.cmd.colorscheme(theme)

vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
        callback = function()
                vim.hl.on_yank()
        end,
})
