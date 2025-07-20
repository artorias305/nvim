return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()
		local set = vim.keymap.set

		set({ "n" }, "<up>", function() mc.lineAddCursor(-2) end)
		set({ "n" }, "<down>", function() mc.lineAddCursor(0) end)
		set({ "n" }, "<leader><up>", function() mc.lineSkipCursor(-2) end)
		set({ "n" }, "<leader><down>", function() mc.lineSkipCursor(0) end)

		set({ "n" }, "<C-d>", function() mc.matchAddCursor(0) end)

		set({ "n" }, "<c-leftmouse>", mc.handleMouse)
		set({ "n" }, "<c-leftdrag>", mc.handleMouseDrag)
		set({ "n" }, "<c-leftrelease>", mc.handleMouseRelease)

		set({ "n" }, "<c-q>", mc.toggleCursor)

		mc.addKeymapLayer(function(layerSet)
			layerSet({ "n" }, "<left>", mc.prevCursor)
			layerSet({ "n" }, "<right>", mc.nextCursor)

			layerSet({ "n" }, "<c-x>", mc.deleteCursor)

			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)
	end
}
