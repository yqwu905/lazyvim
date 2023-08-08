-- 提供独立功能的插件.

return {
    -- 持久高亮单词
    {
        "yqwu905/hi-my-words.nvim",
        opts = {},
        cmd = { "HiMyWordsToggle", "HiMyWordsClear" },
        keys = {
            { "#", "<cmd>HiMyWordsToggle<cr>", desc = "Highlight word" },
            { "<leader>um", "<cmd>HiMyWordsClear<cr>", desc = "Highlight word" },
        },
    },

    -- Quickfix 增强
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

    -- Terminal
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

    -- Buffer inactive若干分钟后关闭Buffer
    {
        "chrisgrieser/nvim-early-retirement",
        opts = {
            retirementAgeMins = 10,
        },
        config = true,
        event = "VeryLazy",
    },
}
