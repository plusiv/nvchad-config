local lint = require "lint"

local linters = {
  go = { "golangcilint" },
}

lint.linters_by_ft = linters
