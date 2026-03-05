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
	},
}
