require("nvchad.configs.lspconfig").defaults()

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    spacing = 2,
    source = "if_many",
    format = function(diagnostic)
      local message = diagnostic.message:gsub("%s+", " ")
      if #message > 100 then
        return message:sub(1, 97) .. "..."
      end
      return message
    end,
  },
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
