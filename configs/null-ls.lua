-- Since plugin uninstalled
-- this file is no longer needed

local null_ls = require "null-ls"

local b = null_ls.builtins

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,

  b.diagnostics.golangci_lint,
}

local on_attach = function(client, bufnr)
  -- Enable formatting on save
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format {
          bufnr = bufnr,
        }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
