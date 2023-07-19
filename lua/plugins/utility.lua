return {
    {
        "yqwu905/hi-my-words.nvim",
        opts = {},
        cmd = { "HiMyWordsToggle", "HiMyWordsClear" },
        keys = {
            { "#", "<cmd>HiMyWordsToggle<cr>", desc = "Highlight word" },
            { "<leader>um", "<cmd>HiMyWordsClear<cr>", desc = "Highlight word" },
        },
    },

    {
        "dhruvasagar/vim-table-mode",
        config = function()
            vim.g.table_mode_corner = "|"
        end,
        cmd = { "TableModeToggle" },
        keys = { { "<leader>ut", "<cmd>TableModeToggle<cr>", desc = "Table mode" } },
    },

    {
        "kevinhwang91/nvim-bqf",
        ft = { "qf" },
        dependencies = {
            {
                "junegunn/fzf",
                build = function()
                    vim.fn["fzf#install"]()
                end,
            },
        },
        opts = {},
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        opts = {},
        keys = {
            { "<A-h>", "<cmd>ToggleTerm<cr>", desc = "toggle term" },
        },
        config = function(_, opts)
            if vim.fn.has("linux") then
                vim.opt.shell = "zsh"
            end
            require("toggleterm").setup(opts)
        end,
    },
}
