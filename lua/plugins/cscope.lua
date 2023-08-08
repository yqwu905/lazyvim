return {
    {
        "dhananjaylatkar/cscope_maps.nvim",
        dependencies = {
            "folke/which-key.nvim", -- optional [for whichkey hints]
            "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
            "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
        },
        opts = {
            disable_maps = false,
            skip_input_prompt = true,
            cscope = {
                picker = "telescope",
                skip_picker_for_single_result = true,
            },
        },
        keys = {
            { "<C-]>", [[<cmd>exe "Cscope find g" expand("<cword>")<cr>]], desc = "goto definition" },
            { "<C-c>g", [[<cmd>exe "Cscope find g" expand("<cword>")<cr>]], desc = "goto definition" },
        },
    },
}
