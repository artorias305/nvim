return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		fuzzy = {
			implementation = "prefer_rust",
		},
		keymap = {
			preset = "default",
			["<C-e>"] = { "hide" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}
