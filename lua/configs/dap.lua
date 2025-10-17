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

-- Java debugging with java-debug
dap.adapters.java = function(callback)
  callback {
    type = "server",
    host = "127.0.0.1",
    port = 5005,
  }
end

dap.configurations.java = {
  {
    type = "java",
    request = "attach",
    name = "Debug (Attach) - Remote",
    hostName = "127.0.0.1",
    port = 5005,
  },
}

-- Set breakpoint signs
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⊗", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo", linehl = "debugPC" })
