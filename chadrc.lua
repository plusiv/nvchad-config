---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
local ui_override = require "custom.ui"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },
  tabufline = ui_override.tabufline,
  statusline = ui_override.statusline,
  nvdash = ui_override.nvdash,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"


-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
