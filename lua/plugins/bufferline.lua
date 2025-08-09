return {
	enabled = true,
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "ordinal",
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = false,
				always_show_bufferline = false,
			},
		})
	end
}
