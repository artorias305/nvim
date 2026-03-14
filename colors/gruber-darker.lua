local M = {}

function M.setup()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "gruber-darker"

	local c = {
		fg = "#e4e4ef",
		fg1 = "#f4f4ff",
		fg2 = "#f5f5f5",
		white = "#ffffff",
		black = "#000000",

		bg0 = "#101010",
		bg = "#181818",
		bg1 = "#282828",
		bg2 = "#453d41",
		bg3 = "#484848",
		bg4 = "#52494e",

		red1 = "#c73c3f",
		red = "#f43841",
		red2 = "#ff4f58",

		green = "#73c936",
		yellow = "#ffdd33",
		brown = "#cc8c3c",

		quartz = "#95a99f",

		niagara2 = "#303540",
		niagara1 = "#565f73",
		niagara = "#96a6c8",

		wisteria = "#9e95c7",
	}

	local hl = vim.api.nvim_set_hl
	local s = { fg = c.fg, bg = c.bg }

	-- Core UI
	hl(0, "Normal", s)
	hl(0, "Cursor", { fg = c.black, bg = c.yellow })
	hl(0, "Visual", { bg = c.bg3 })
	hl(0, "LineNr", { fg = c.bg4 })
	hl(0, "CursorLineNr", { fg = c.yellow })
	hl(0, "CursorLine", { bg = c.bg1 })
	hl(0, "VertSplit", { fg = c.bg2 })
	hl(0, "StatusLine", { fg = c.white, bg = c.bg1 })
	hl(0, "StatusLineNC", { fg = c.quartz, bg = c.bg1 })
	hl(0, "Pmenu", { fg = c.fg, bg = c.bg1 })
	hl(0, "PmenuSel", { fg = c.fg, bg = c.bg0 })
	hl(0, "Search", { fg = c.black, bg = c.fg2 })
	hl(0, "IncSearch", { fg = c.black, bg = c.yellow })
	hl(0, "MatchParen", { bg = c.bg4 })

	-- Syntax
	hl(0, "Comment", { fg = c.brown })
	hl(0, "Constant", { fg = c.quartz })
	hl(0, "String", { fg = c.green })
	hl(0, "Character", { fg = c.green })
	hl(0, "Number", { fg = c.wisteria })
	hl(0, "Boolean", { fg = c.wisteria })
	hl(0, "Float", { fg = c.wisteria })

	hl(0, "Identifier", { fg = c.fg1 })
	hl(0, "Function", { fg = c.niagara })

	hl(0, "Statement", { fg = c.yellow, bold = true })
	hl(0, "Conditional", { fg = c.yellow, bold = true })
	hl(0, "Repeat", { fg = c.yellow, bold = true })
	hl(0, "Keyword", { fg = c.yellow, bold = true })

	hl(0, "PreProc", { fg = c.quartz })
	hl(0, "Type", { fg = c.quartz })
	hl(0, "Special", { fg = c.red })

	hl(0, "Error", { fg = c.red })
	hl(0, "Todo", { fg = c.yellow, bold = true })

	-- Diff
	hl(0, "DiffAdd", { fg = c.green })
	hl(0, "DiffDelete", { fg = c.red2 })
	hl(0, "DiffChange", { fg = c.yellow })
	hl(0, "DiffText", { fg = c.niagara })

	-- Diagnostics
	hl(0, "DiagnosticError", { fg = c.red })
	hl(0, "DiagnosticWarn", { fg = c.yellow })
	hl(0, "DiagnosticInfo", { fg = c.green })
	hl(0, "DiagnosticHint", { fg = c.quartz })

	-- Git
	hl(0, "GitSignsAdd", { fg = c.green })
	hl(0, "GitSignsChange", { fg = c.yellow })
	hl(0, "GitSignsDelete", { fg = c.red })

	-- Treesitter
	hl(0, "@comment", { link = "Comment" })
	hl(0, "@string", { link = "String" })
	hl(0, "@number", { link = "Number" })
	hl(0, "@boolean", { link = "Boolean" })
	hl(0, "@function", { link = "Function" })
	hl(0, "@keyword", { link = "Keyword" })
	hl(0, "@type", { link = "Type" })
	hl(0, "@variable", { fg = c.fg })
	hl(0, "@parameter", { fg = c.fg1 })
end

M.setup()
return M
