require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- terminal: return to normal mode with <Esc>
map("t", "<Esc>", [[<C-\><C-n>]])

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Copy the relative path of the current file to clipboard
vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand "%.")
  print("Copied file path: " .. vim.fn.expand "%.")
end, { desc = "Copy relative file path" })

-- DAP (Debug Adapter Protocol) keybindings
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Start/Continue debugging" })
map("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "Step into" })
map("n", "<leader>do", "<cmd>DapStepOver<cr>", { desc = "Step over" })
map("n", "<leader>dO", "<cmd>DapStepOut<cr>", { desc = "Step out" })
map("n", "<leader>dt", "<cmd>DapTerminate<cr>", { desc = "Terminate debugging" })
map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", { desc = "Open REPL" })
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", { desc = "Run last debug config" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP UI" })

-- Arrow key mappings for debugging (intuitive directional stepping)
map("n", "<Down>", "<cmd>DapStepOver<cr>", { desc = "DAP: Step over" })
map("n", "<Right>", "<cmd>DapStepInto<cr>", { desc = "DAP: Step into" })
map("n", "<Left>", "<cmd>DapStepOut<cr>", { desc = "DAP: Step out" })
map("n", "<Up>", "<cmd>lua require('dap').restart_frame()<cr>", { desc = "DAP: Restart frame" })

-- Window resizing with Leader + J/K/</>
map("n", "<leader>K", "<cmd>resize +20<cr>", { desc = "Increase window height" })
map("n", "<leader>J", "<cmd>resize -20<cr>", { desc = "Decrease window height" })
map("n", "<leader><", "<cmd>vertical resize -40<cr>", { desc = "Decrease window width" })
map("n", "<leader>>", "<cmd>vertical resize +40<cr>", { desc = "Increase window width" })

-- Git shortcuts.
map("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Toggle git blame" })
map("n", "<leader>gd", "<cmd>Gdiffsplit!<cr>", { desc = "Resolve merge conflicts" })
map("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
map("n", "<leader>gh", "<cmd>diffget //2<cr>", { desc = "Get from left (target)" })
map("n", "<leader>gl", "<cmd>diffget //3<cr>", { desc = "Get from right (merge)" })
map("n", "[c", "[c", { desc = "Previous conflict" })
map("n", "]c", "]c", { desc = "Next conflict" })

