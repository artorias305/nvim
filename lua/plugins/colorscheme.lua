return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    styles = {
      transparency = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "sainnhe/gruvbox-material",
  },
  {
    "craftzdog/solarized-osaka.nvim",
  },
}
