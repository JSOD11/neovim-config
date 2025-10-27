return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "gomod",
        "java",
        "rust",
        "bash",
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept" },
        ["<CR>"] = {},
      },
    },
  },

  -- Autosave.
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        enabled = true,
        trigger_events = { "BufLeave", "WinLeave", "FocusLost" },
        execution_message = { enabled = false },
        debounce_delay = 250,
      }
    end,
  },

  -- DAP (Debug Adapter Protocol).
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    cmd = {
      "DapToggleBreakpoint",
      "DapContinue",
      "DapStepInto",
      "DapStepOver",
      "DapStepOut",
      "DapTerminate",
    },
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Start/Continue debugging" },
      { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step into" },
      { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step over" },
      { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step out" },
      { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate debugging" },
      { "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", desc = "Open REPL" },
      { "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", desc = "Run last debug config" },
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
    },
    config = function()
      require "configs.dap"
    end,
  },

  -- DAP UI.
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Visual multi-select.
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
      }
    end,
  },

  -- Vim fugitive (git tools).
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  -- Java LSP (jdtls) with Bazel support.
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

}
