return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = { "lua", "rust", "javascript", "c_sharp", "toml", "typescript", "yaml" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
