local jdtls = require "jdtls"

-- Paths
local home = os.getenv "HOME"
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local workspace_dir = home .. "/.local/share/nvim/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- Configuration
local config = {
  cmd = {
    jdtls_path .. "/jdtls",
    "-data",
    workspace_dir,
  },

  -- Use Java 21 for jdtls
  cmd_env = {
    JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",
  },

  root_dir = vim.fs.dirname(vim.fs.find({ ".git", "WORKSPACE", "BUILD" }, { upward = true })[1]),
}

-- Start jdtls
jdtls.start_or_attach(config)
