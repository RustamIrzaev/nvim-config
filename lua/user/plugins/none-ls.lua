local nonels = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function nonels.config()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      -- require("none-ls.diagnostics.eslint_d"),
      null_ls.builtins.completion.spell,
    },
  })

		-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end

return nonels