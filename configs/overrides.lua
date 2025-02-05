local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "go",
    "python",
    "markdown",
    "markdown_inline",
    "yaml",
    "json",
    "dockerfile",
    "bash",
    "rust",
    "toml",
    "php",
    "proto",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- markdown
    "marksman",
    "misspell",

    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",

    -- rust
    "rust-analyzer",
    "rustfmt",

    -- go
    "gopls",
    "glint",
    "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",

    -- python
    "pyright",
    "flake8",
    "black",
    "mypy",
    "pydocstyle",
    "pylint",
    "pyre",
    "autoflake",
    "autopep8",
    "python-lsp-server",
    "ruff_lsp",
    "jedi-language-server",

    -- yaml
    "terraform-ls",
    "tflint",
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- sql
    "sqlfluff",
    "sqls",
  },
}

M.nvimtree = {
  -- hide .git folder
  filters = {
    git_ignored = false,
    custom = { "^.git$" },
  },
  -- git support in nvimtree
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- Prevent error during the initial Lazy bootstrap:
--   Error detected while processing ~/.config/nvim/init.lua:
--   Failed to load `custom.plugins`
--   ~/.config/nvim/lua/custom/plugins.lua:1: loop or previous error loading module 'custom.configs.overrides'
--   See https://github.com/NvChad/NvChad/issues/1393#issuecomment-1640304977
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  local ls = require "luasnip"
  M.cmp = {
    mapping = {
      ["<C-n>"] = cmp.mapping(function(fallback)
        if ls.choice_active() then
          ls.change_choice()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
  }
end

return M
