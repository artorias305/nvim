return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
                ensure_installed = {
                        "cmake",
                        "c",
                        "cpp",
                        "css",
                        "gitignore",
                        "go",
                        "java",
                        "javascript",
                        "rust",
                        "typescript",
                        "lua"
                }
        }
}
