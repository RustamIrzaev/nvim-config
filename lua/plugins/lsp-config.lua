return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "csharp_ls", "rust_analyzer", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local roslyn = require("roslyn")

			roslyn.setup({
				dotnet_cmd = "dotnet",
				roslyn_version = "4.8.0-3.23475.7",
				on_attach = function() end,
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			--lspconfig.rust_analyzer.setup({
			--  capabilities = capabilities,
			--  settings = {
			--    ["rust-analyzer"] = {
			--      check = { command = "clippy" },
			--      diagnostics = { enable = true },
			--    },
			--  },
			--})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
