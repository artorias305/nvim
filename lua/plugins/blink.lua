return {
        "saghen/blink.cmp",
	version = "1.*",
        opts = {
                completion = {
                        menu = {
                                winblend = vim.o.pumblend
                        }
                },
                signature = {
                        window = {
                                winblend = vim.o.pumblend
                        }
                },
                sources = {
                        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                        providers = {
                                lazydev = {
                                        name = "LazyDev",
                                        module = "lazydev.integrations.blink",
                                        score_offset = 100
                                }
                        }
                }
        }
}
