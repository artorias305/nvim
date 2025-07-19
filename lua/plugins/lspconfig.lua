return {
	"neovim/nvim-lspconfig",
	enabled = true,
	dependencies = { "saghen/blink.cmp" },
	opts = {
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" }, -- Recognize Neovim globals
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			clangd = {},
			ts_ls = {},
			gopls = {
				settings = {
					gopls = {
						analyses = {
							unsusedparams = true,
						},
						staticcheck = true,
					},
				},
			}
		},
	},
	config = function(_, opts)
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")

		-- Generic autoformatting on save for all LSP servers
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
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
		})

		-- Setup all servers defined in opts.servers
		for server, config in pairs(opts.servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				settings = config.settings or {},
				on_attach = config.on_attach, -- Preserve any server-specific on_attach if defined
			})
		end
	end,
}
