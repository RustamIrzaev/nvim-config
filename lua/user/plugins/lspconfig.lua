local lspconfig = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
  },
}

function lspconfig.config()
  set_which_key()

  require("lspconfig.ui.windows").default_options.border = "rounded"

  set_diagnostics()

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "eslint",
    "tsserver",
    "bashls",
    "jsonls",
    "yamlls",
  }

  for _, server in pairs(servers) do
    local opts = {
      on_attach = lspconfig.on_attach,
      capabilities = lspconfig.common_capabilities(),
    }

    local require_ok, settings = pcall(require, FOLDER .. ".lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    require("lspconfig")[server].setup(opts)
  end
end

function lspconfig.on_attach(client, bufnr)
  set_keymaps(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function lspconfig.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

function lspconfig.toggle_inlay_hints()
  local bufnr = vim.api.nvim_get_current_buf()

  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr), { bufnr })
end

function set_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

function set_which_key()
  local wk = require("which-key")

  wk.register {
    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    ["<leader>lf"] = {
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      "Format",
    },
    ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    ["<leader>lh"] = { "<cmd>lua require(FOLDER .. '.plugins.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  }

  wk.register {
    ["<leader>la"] = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
    },
  }
end

function set_diagnostics()
  local icons = require("user.helpers.icons")

  vim.diagnostic.config({
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end
end

return lspconfig