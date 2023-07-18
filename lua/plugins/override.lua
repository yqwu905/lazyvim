return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "cscope.out",
                    "tags",
                    "output",
                    "deps",
                    ".cache",
                },
            },
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            window = {
                mappings = {
                    ["o"] = "open",
                    ["v"] = "open_vsplit",
                    ["s"] = "open_split",
                },
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "gd", "<cmd>Glance definitions<cr>" }
            keys[#keys + 1] = { "gD", "<cmd>lua vim.lsp.buf.definition()<cr>" }
            keys[#keys + 1] = { "gt", "<cmd>Glance type_definitions<cr>" }
            keys[#keys + 1] = { "gh", "<cmd>Glance references<cr>" }
            keys[#keys + 1] = { "ci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>" }
        end,
    },

    {
        "williamboman/mason.nvim",
        enabled = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },
        },
    },
}
