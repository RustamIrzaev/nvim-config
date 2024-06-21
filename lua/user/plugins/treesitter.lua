local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function treesitter.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { 
      "lua", 
      "rust", 
      "javascript", 
      "c_sharp", 
      "toml", 
      "typescript", 
      "yaml", 
      "markdown", 
      "markdown_inline", 
      "bash", 
    },
    auto_install = false,
    highlight = { enable = true, },
    indent = { enable = true, },
  })
end

return treesitter