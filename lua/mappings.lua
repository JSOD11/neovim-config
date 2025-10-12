require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- terminal: return to normal mode with <Esc>
map("t", "<Esc>", [[<C-\><C-n>]])

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Copy the full path of the current file to clipboard
vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Copied file path: " .. vim.fn.expand("%:p"))
end, { desc = "Copy full file path" })
