-- 更改LazyVim插件的配置

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
            keys[#keys + 1] = { "gh", "<cmd>Glance references<cr>" }
            keys[#keys + 1] = { "ci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>" }
        end,
        opts = {
            servers = {
                clangd = {
                    single_file_support = false,
                    root_dir = require("lspconfig.util").root_pattern("compile_commands.json"),
                },
            },
        },
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

    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                        cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- this way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },

    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsc",
                update_n_lines = "gsn",
            },
        },
    },
}
