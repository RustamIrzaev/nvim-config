return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    
    config.setup({
      ensure_installed = { "lua", "rust", "javascript", "c_sharp", "bash", "css", "dockerfile", "gitignore", "html", "json", "luadoc", "python", "sql", "swift", "toml", "typescript", "vim", "xml", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
  })
  end
}
