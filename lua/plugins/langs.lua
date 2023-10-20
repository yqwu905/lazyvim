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
}
