return {
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.g.mkdp_theme = "light"
        end,
        cmds = { "MarkdownPreview", "MarkdownPreviewStop" },
    },

    {
        "windwp/nvim-ts-autotag",
    },

    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = { "norg" },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {
                        config = {
                            folds = true,
                            icon_preset = "diamond",
                        },
                    }, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            })
        end,
        keys = {
            { "<leader>nn", "<cmd>Neorg workspace notes<cr>", "neorg index" },
            { "<leader>nj", "<cmd>Neorg journal today<cr>", "today" },
            { "<leader>nc", "<cmd>Neorg keybind norg<cr>", "command" },
        },
    },
}
