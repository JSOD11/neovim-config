return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre',
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
            "bash"
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
            require("auto-save").setup({
                enabled = true,
                trigger_events = { "BufLeave", "WinLeave", "FocusLost" },
                execution_message = { enabled = false },
                debounce_delay = 250,
            })
        end,
    }
}
