local M = {}

function M.setup()
  require("treesitter-context").setup {
    separator = "-",
  }
end

return M
