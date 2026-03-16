require "nvchad.autocmds"

vim.api.nvim_create_autocmd("CursorHold", {
  desc = "Show diagnostics in a float at the cursor",
  callback = function()
    vim.diagnostic.open_float(nil, { scope = "cursor", focus = false })
  end,
})
