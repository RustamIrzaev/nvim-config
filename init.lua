FOLDER = "user"

local PLUGINS = {
  "theme",
  "devicons",
  "treesitter",
  "mason",
  "schemastore",
  "lspconfig",
  "whichkey",
  "alpha",
  "cmp",
  "none-ls",
  "telescope",
  "nvimtree",
  "lualine",
  "navic",
  "harpoon",
}

require(FOLDER .. ".launch")
require(FOLDER .. ".core.options")
require(FOLDER .. ".core.keymaps")

for _, plugin in ipairs(PLUGINS) do
  load_plugin(FOLDER .. ".plugins." .. plugin)
end

require(FOLDER .. ".core.lazy")
