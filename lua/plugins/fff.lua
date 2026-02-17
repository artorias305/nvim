return {
        "dmtrKovalenko/fff.nvim",
        build = function()
                require("fff.download").download_or_build_binary()
        end,
        opts = {
                debug = {
                        enabled = true,
                        show_scores = true
                }
        },
        lazy = false,
        keys = {
                {
                        "<leader>ff",
                        function() require('fff').find_files() end,
                        desc = 'FFFind files',
                },
                {
                        "<leader>fg",
                        function() require('fff').live_grep() end,
                        desc = 'LiFFFe grep'
                },
        }
}
