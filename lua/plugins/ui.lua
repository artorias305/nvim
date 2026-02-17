return {
        { "folke/noice.nvim",    opts = {} },
        { "rcarriga/nvim-notify" },
        {
                "folke/snacks.nvim",
                opts = {
                        scroll = { enabled = false }
                },
                keys = {}
        },
        {
                "akinsho/bufferline.nvim",
                event = "VeryLazy",
                enabled = false,
                opts = {
                        options = {
                                mode = "tabs",
                                show_buffer_close_icons = false,
                                show_close_icon = false
                        }
                }
        },
        {
                "nvim-lualine/lualine.nvim",
                opts = {}
        },
        {
                "folke/snacks.nvim",
                lazy = false,
                enabled = false,
                opts = {
                        dashboard = {
                                enabled = true
                        }
                }
        }
}
