return {
    -- { "sidebar-nvim/sidebar.nvim", opts = { open = true } },
    {
        "uloco/bluloco.nvim",
        lazy = false,
        priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            -- your optional config goes here, see below.
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "bluloco-light",
        },
    },
    {
        "dstein64/nvim-scrollview",
        opts = {
            current_only = true,
            signs_on_startup = { "all" },
            diagnostics_severities = { vim.diagnostic.severity.ERROR },
        },
    },
}
