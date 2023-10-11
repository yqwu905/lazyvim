return {
    -- { "sidebar-nvim/sidebar.nvim", opts = { open = true } },
    {
        "dstein64/nvim-scrollview",
        opts = {
            current_only = true,
            signs_on_startup = { "all" },
            diagnostics_severities = { vim.diagnostic.severity.ERROR },
        },
    },
}
