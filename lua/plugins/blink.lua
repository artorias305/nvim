return {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
                fuzzy = {
                        implementation = "prefer_rust"
                },
                keymap = {
                        preset = "default",
                        ["<C-e>"] = { "hide" }
                },
                appearance = {
                        nerd_font_variant = "mono"
                },
                completion = {
                        menu = {
                                winblend = vim.o.pumblend,
                                draw = {
                                        columns = { { "label", "label_description", gap = 1 } }
                                }
                        },
                        documentation = { auto_show = true, auto_show_delay_ms = 200 }
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
