local unpack = table.unpack or unpack

return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		local greek_letters = {
			{ trig = "a", tex = "\\alpha" },
			{ trig = "b", tex = "\\beta" },
			{ trig = "g", tex = "\\gamma" },
			{ trig = "d", tex = "\\delta" },
			{ trig = "e", tex = "\\epsilon" },
			{ trig = "t", tex = "\\theta" },
			{ trig = "A", tex = "\\Alpha" },
			{ trig = "B", tex = "\\Beta" },
			{ trig = "G", tex = "\\Gamma" },
			{ trig = "D", tex = "\\Delta" },
			{ trig = "E", tex = "\\Epsilon" },
			{ trig = "T", tex = "\\Theta" },
		}

		local greek_snips = {}
		for _, g in ipairs(greek_letters) do
			table.insert(greek_snips, s(g.trig, { t(g.tex) }))
		end

		ls.add_snippets("markdown", {
			s("frac", { t("\\frac{"), i(1, "numerator"), t("}{"), i(2, "denominator"), t("}") }),
			s("sum", { t("\\sum_{"), i(1, "i=0"), t("}^{"), i(2, "n"), t("}") }),
			s("int", { t("\\int_{"), i(1, "a"), t("}^{"), i(2, "b"), t("} "), i(3, "f(x)dx") }),
			s("vec", { t("\\vec{"), i(1, "vector"), t("}") }),
			unpack(greek_snips),
		})
	end,
}
