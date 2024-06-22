local harpoon = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
}

function harpoon.config()
  local harpoon = require("harpoon")
  harpoon.setup()

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<s-m>", "<cmd>lua require(FOLDER .. '.plugins.harpoon').mark_file()<cr>", opts)
  keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
end

function harpoon.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return harpoon