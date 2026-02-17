return {
        "nvim-mini/mini.nvim",
        config = function()
                require("mini.pairs").setup()
                require("mini.surround").setup()
                -- require("mini.icons").setup()
        end
}
