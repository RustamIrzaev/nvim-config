local mason = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function mason.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = { 
      "lua_ls", 
      "cssls",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "tailwindcss",
      "html",
      "csharp_ls", 
      "rust_analyzer", 
      "tsserver",
    }
  })
end

return mason