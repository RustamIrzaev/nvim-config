local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp("codeAction")
  --vim.lsp.buf.codeAction()
end, { silent = true, buffer = bufnr })
