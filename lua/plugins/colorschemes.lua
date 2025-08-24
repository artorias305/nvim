return {
	{
		"craftzdog/solarized-osaka.nvim",
		opts = function()
			return {
				transparent = true
			}
		end
	},
	{
		"folke/tokyonight.nvim"
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			transparent_background = false
		},
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.groups.integrations.bufferline")
						    .get()
					end
				end
			}
		}
	},
	{
		"blazkowolf/gruber-darker.nvim"
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				-- style = 'warm',
				transparent = true
			})
		end
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true
			})
			vim.cmd(":hi statusline guibg=NONE")
		end
	},
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({
				styles = {
					transparency = true
				}
			})
		end
	},
	{
		"bluz71/vim-nightfly-guicolors",
		config = function()
			vim.g.nightflyTransparent = true
		end
	},
	{
		"sainnhe/sonokai",
		config = function()
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_enable_italic = "1"
			vim.g.sonokai_style = "andromeda"
		end
	},
	{
		"datsfilipe/vesper.nvim"
	}
}
