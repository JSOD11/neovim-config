local dap = require('dap')

-- Go debugging with delve
dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}'},
    }
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

-- Rust debugging with CodeLLDB
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
        args = {"--port", "${port}"},
    }
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

-- Java debugging with java-debug
dap.adapters.java = function(callback)
    callback({
        type = 'server',
        host = '127.0.0.1',
        port = 5005,
    })
end

dap.configurations.java = {
    {
        type = 'java',
        request = 'attach',
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
    },
}

-- Set breakpoint signs
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DiagnosticError', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DiagnosticWarn', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DiagnosticError', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='', texthl='DiagnosticInfo', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='DiagnosticInfo', linehl='debugPC', numhl=''})
