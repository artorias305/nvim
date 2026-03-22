local colors = {
	bg = "#282c34",
	fg = "#abb2bf",
	cursor = "#528bff",
	selection = "#3e4451",

	black = "#2e3440",
	red = "#e06c75",
	green = "#98c379",
	yellow = "#e5c07b",
	blue = "#61afef",
	magenta = "#c678dd",
	cyan = "#56b6c2",
	white = "#828997",

	dark_bg = "#21252b",
	light_fg = "#c8d0e0",
	orange = "#d19a66",
	purple = "#c678dd",
}

vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.termguicolors = true
vim.g.colors_name = "pewds"

-- UI
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.cursor })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.selection })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.selection })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.blue, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.light_fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.black })

-- Basic syntax
vim.api.nvim_set_hl(0, "Comment", { fg = colors.white, italic = true })
vim.api.nvim_set_hl(0, "String", { fg = colors.green })
vim.api.nvim_set_hl(0, "Function", { fg = colors.blue })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "Type", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
vim.api.nvim_set_hl(0, "Number", { fg = colors.orange })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "Operator", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.orange })
vim.api.nvim_set_hl(0, "Include", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "Define", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "Macro", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "Structure", { fg = colors.yellow })

-- Line numbers
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.blue })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = colors.blue })

-- StatusLine (for mini.statusline)
vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.white, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "StatusLineSplit", { fg = colors.black, bg = colors.dark_bg })

-- Windows and folds
vim.api.nvim_set_hl(0, "WinBar", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "WinBarNC", { fg = colors.white, bg = colors.bg })
vim.api.nvim_set_hl(0, "Folded", { fg = colors.white, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.white, bg = colors.bg })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.black, bg = colors.bg })
vim.api.nvim_set_hl(0, "Split", { fg = colors.black, bg = colors.bg })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.black, bg = colors.bg })

-- Search
vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.yellow })
vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.orange })
vim.api.nvim_set_hl(0, "CurSearch", { fg = colors.bg, bg = colors.magenta })
vim.api.nvim_set_hl(0, "MatchParen", { fg = colors.bg, bg = colors.cyan })

-- Diagnostics
vim.api.nvim_set_hl(0, "Error", { fg = colors.red })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.red, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "Warning", { fg = colors.orange })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.orange, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "Info", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "Hint", { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.orange })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = colors.red, underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = colors.orange, underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = colors.cyan, underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.orange })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.blue })

-- LSP
vim.api.nvim_set_hl(0, "LspReferenceText", { fg = colors.yellow, underline = true })
vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = colors.yellow, underline = true })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = colors.yellow, underline = true })
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = colors.white })
vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = colors.white })
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = colors.yellow, bold = true })

-- Treesitter
vim.api.nvim_set_hl(0, "TSAnnotation", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TSAttribute", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TSBoolean", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSCharacter", { fg = colors.green })
vim.api.nvim_set_hl(0, "TSComment", { fg = colors.white, italic = true })
vim.api.nvim_set_hl(0, "TSConditional", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSConstant", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSConstBuiltin", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSConstMacro", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSConstructor", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TSError", { fg = colors.red })
vim.api.nvim_set_hl(0, "TSEvent", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSException", { fg = colors.red })
vim.api.nvim_set_hl(0, "TSField", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSFile", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSFloat", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TSFunction", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TSFuncBuiltin", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TSFuncMacro", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TSInclude", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSKeyword", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSKeywordFunction", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSKeywordOperator", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSLabel", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSLiteral", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSMethod", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TSNamespace", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSNone", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSNumber", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TSOperator", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSParameter", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSParameterReference", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSProperty", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSPropertyReference", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSPunctBracket", { fg = colors.white })
vim.api.nvim_set_hl(0, "TSPunctDelimiter", { fg = colors.white })
vim.api.nvim_set_hl(0, "TSRepeat", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSString", { fg = colors.green })
vim.api.nvim_set_hl(0, "TSStringEscape", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TSStringRegex", { fg = colors.green })
vim.api.nvim_set_hl(0, "TSSymbol", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSTag", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "TSTagAttribute", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TSTagDelimiter", { fg = colors.white })
vim.api.nvim_set_hl(0, "TSText", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSTextReference", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TSTitle", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "TSType", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TSTypeQualifier", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TSURI", { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, "TSVariable", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TSVariableBuiltin", { fg = colors.cyan })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.blue, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopePrompt", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.blue, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopeResults", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.blue, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopePreview", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.blue, bg = colors.bg })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.yellow, bold = true })

-- Oil.nvim
vim.api.nvim_set_hl(0, "OilNormal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "OilDir", { fg = colors.blue })
vim.api.nvim_set_hl(0, "OilFile", { fg = colors.fg })
vim.api.nvim_set_hl(0, "OilSymlink", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "OilCopy", { fg = colors.green })
vim.api.nvim_set_hl(0, "OilMove", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "OilDelete", { fg = colors.red })
vim.api.nvim_set_hl(0, "OilChange", { fg = colors.orange })
vim.api.nvim_set_hl(0, "OilPermissions", { fg = colors.white })
vim.api.nvim_set_hl(0, "OilSize", { fg = colors.white })
vim.api.nvim_set_hl(0, "OilMtime", { fg = colors.white })

-- blink.cmp
vim.api.nvim_set_hl(0, "BlinkCapMenuNormal", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "BlinkCapMenuBorder", { fg = colors.blue, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "BlinkCapMenuSel", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkCapMenuKind", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "BlinkCapMenuKindFunction", { fg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkCapMenuKindMethod", { fg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkCapMenuKindVariable", { fg = colors.fg })
vim.api.nvim_set_hl(0, "BlinkCapMenuKindProperty", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkCapMenuLabel", { fg = colors.fg })

-- mini.nvim
vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "MiniStatuslineMode", { fg = colors.bg, bg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = colors.bg, bg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = colors.bg, bg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = colors.bg, bg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = colors.bg, bg = colors.magenta, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = colors.bg, bg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = colors.white, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "MiniStatuslineDashboard", { fg = colors.fg, bg = colors.dark_bg })

-- mini.diff
vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = colors.red })
vim.api.nvim_set_hl(0, "MiniDiffHunkAdd", { fg = colors.green, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "MiniDiffHunkChange", { fg = colors.yellow, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "MiniDiffHunkDelete", { fg = colors.red, bg = colors.dark_bg })

-- mini.git
vim.api.nvim_set_hl(0, "MiniGitBranch", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "MiniGitCommit", { fg = colors.green })
vim.api.nvim_set_hl(0, "MiniGitDiffAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "MiniGitDiffChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "MiniGitDiffDelete", { fg = colors.red })

-- mini.surround
vim.api.nvim_set_hl(0, "MiniSurround", { fg = colors.yellow, bg = colors.dark_bg })

-- mini.icons
vim.api.nvim_set_hl(0, "MiniIconsAzure", { fg = colors.blue })
vim.api.nvim_set_hl(0, "MiniIconsBlue", { fg = colors.blue })
vim.api.nvim_set_hl(0, "MiniIconsBrown", { fg = colors.orange })
vim.api.nvim_set_hl(0, "MiniIconsCyan", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "MiniIconsGreen", { fg = colors.green })
vim.api.nvim_set_hl(0, "MiniIconsGrey", { fg = colors.white })
vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = colors.orange })
vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = colors.magenta })
vim.api.nvim_set_hl(0, "MiniIconsRed", { fg = colors.red })
vim.api.nvim_set_hl(0, "MiniIconsYellow", { fg = colors.yellow })

-- mini.pairs
vim.api.nvim_set_hl(0, "MiniPairsDisable", { fg = colors.fg })

-- trouble.nvim
vim.api.nvim_set_hl(0, "TroubleNormal", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TroubleText", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TroubleCount", { fg = colors.magenta, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TroubleFoldIcon", { fg = colors.white })
vim.api.nvim_set_hl(0, "TroubleLocation", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TroubleFile", { fg = colors.fg, bold = true })
vim.api.nvim_set_hl(0, "TroubleSource", { fg = colors.white })
vim.api.nvim_set_hl(0, "TroubleError", { fg = colors.red })
vim.api.nvim_set_hl(0, "TroubleWarning", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TroubleHint", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TroubleInfo", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "TroubleTextError", { fg = colors.red })
vim.api.nvim_set_hl(0, "TroubleTextWarning", { fg = colors.orange })
vim.api.nvim_set_hl(0, "TroubleTextHint", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TroubleTextInfo", { fg = colors.cyan })

-- Misc
vim.api.nvim_set_hl(0, "NonText", { fg = colors.black })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.black })
vim.api.nvim_set_hl(0, "SpecialKey", { fg = colors.black })
vim.api.nvim_set_hl(0, "Title", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "Question", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "MoreMsg", { fg = colors.blue })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.orange })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.red })
vim.api.nvim_set_hl(0, "WildMenu", { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, "Directory", { fg = colors.blue })
vim.api.nvim_set_hl(0, "Bold", { bold = true })
vim.api.nvim_set_hl(0, "Italic", { italic = true })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "TabLine", { fg = colors.white, bg = colors.bg })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.fg, bg = colors.dark_bg })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = colors.white, bg = colors.bg })
vim.api.nvim_set_hl(0, "qfLineNr", { fg = colors.white })
vim.api.nvim_set_hl(0, "SignifyLineAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "SignifyLineChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "SignifyLineDelete", { fg = colors.red })
