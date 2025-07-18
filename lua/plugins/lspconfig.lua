return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	opts = {
		servers = {
			lua_ls = {
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("LspFormatting",
							{ clear = true })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									async = false,
									filter = function(c)
										return c.id == client.id
									end
								})
							end,
						})
					end
				end,
			}
		}
	},
	config = function(_, opts)
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig['lua_ls'].setup({
			capabilities = capabilities,
			on_attach = opts.servers.lua_ls.on_attach,
			settings = opts.servers.lua_ls.settings or {},
		})
	end
}
