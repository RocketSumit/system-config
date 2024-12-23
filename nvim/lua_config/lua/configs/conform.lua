local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black", "ruff" },
    javascript = {"prettier"},
    markdown = {"prettier"},
    cpp = { "clang-format" },
    yaml = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
     timeout_ms = 2500,
     lsp_fallback = true,
   },
}

return options
