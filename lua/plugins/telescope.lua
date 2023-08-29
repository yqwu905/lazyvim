return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
        keys = {
            { "<leader><space>", "<cmd>Telescope find_files<cr>", "find fiels" },
        },
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "cscope.out",
                    "tags",
                    "output",
                    "deps",
                    ".cache",
                    "test",
                },
            },
        },
    },
}
