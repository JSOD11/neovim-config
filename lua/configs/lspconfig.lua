require("nvchad.configs.lspconfig").defaults()

vim.diagnostic.config {
  virtual_text = false,
  float = {
    border = "single",
    source = "if_many",
    scope = "cursor",
    max_width = 100,
  },
}

local servers = { "html", "cssls", "gopls", "rust_analyzer", "ts_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
