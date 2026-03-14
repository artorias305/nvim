return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		completion = {
			menu = {
				auto_show = true,
			},
		},
		fuzzy = {
			implementation = "prefer_rust",
		},
		keymap = {
			preset = "default",
			["<C-n>"] = {
				"show",
				"select_next",
			},
			["<C-e>"] = { "hide" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
	},
}
