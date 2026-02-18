return {
    "nvim-mini/mini.nvim",
    config = function()
        require("mini.pairs").setup()
        require("mini.surround").setup()
        local statusline = require("mini.statusline")
        statusline.setup({
            use_icons = false,
            content = {
                active = function()
                    local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                    local git = statusline.section_git({ trunc_width = 40 })
                    local filename = statusline.section_filename({ trunc_width = 140 })

                    return statusline.combine_groups({
                        { hl = mode_hl,                 strings = { mode } },
                        { hl = "MiniStatuslineDevinfo", strings = { git } },
                        "%=",
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                    })
                end,
                inactive = function()
                    local filename = statusline.section_filename({ trunc_width = 140 })
                    return statusline.combine_groups({
                        "%=",
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                    })
                end,
            },
        })
        require("mini.diff").setup({
            view = {
                style = "sign",
                signs = { add = "+", change = "~", delete = "_" }
            }
        })
        require("mini.git").setup()
    end
}
