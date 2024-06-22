local lualine = {
  "nvim-lualine/lualine.nvim",
}

function lualine.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
      theme = "iceberg_dark",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location"},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return lualine