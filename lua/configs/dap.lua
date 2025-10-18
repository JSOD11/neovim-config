local dap = require "dap"

-- Go debugging with delve
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${workspaceFolder}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "delve",
    name = "Debug tests (package)",
    request = "launch",
    mode = "test",
    program = "${workspaceFolder}/${relativeFileDirname}",
    cwd = "${workspaceFolder}",
  },
}

-- Rust debugging with codelldb
local codelldb_cmd = vim.fn.exepath "codelldb"
if codelldb_cmd == "" then
  codelldb_cmd = "codelldb"
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_cmd,
    args = { "--port", "${port}" },
  },
}

dap.configurations.rust = {
  {
    name = "Debug binary",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "Debug tests (binary)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Test binary: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
}

-- Set breakpoint signs
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⊗", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo", linehl = "debugPC" })
