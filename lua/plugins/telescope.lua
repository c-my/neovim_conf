return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            {
                "<Leader>ff",
                "<Cmd>Telescope find_files <CR>",
                desc = "Find File",
            },
            {
                "<Leader>fg",
                "<Cmd>Telescope live_grep <CR>",
                desc = "Find Grep",
            },
            {
                "<Leader>fb",
                "<Cmd>Telescope buffers <CR>",
                desc = "Find Buffer",
            },
            {
                "<Leader>fh",
                "<Cmd>Telescope help_tags <CR>",
                desc = "Find Help",
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = function(...)
                            return require("telescope.actions").move_selection_next(...)
                        end,
                        ["<C-k>"] = function(...)
                            return require("telescope.actions").move_selection_previous(...)
                        end,
                        ["<C-f>"] = function(...)
                            return require("telescope.actions").preview_scrolling_down(...)
                        end,
                        ["<C-b>"] = function(...)
                            return require("telescope.actions").preview_scrolling_up(...)
                        end,
                    },
                    n = {
                        ["<C-j>"] = function(...)
                            return require("telescope.actions").move_selection_next(...)
                        end,
                        ["<C-k>"] = function(...)
                            return require("telescope.actions").move_selection_previous(...)
                        end,
                        ["q"] = function(...)
                            return require("telescope.actions").close(...)
                        end,
                        ["<C-f>"] = function(...)
                            return require("telescope.actions").preview_scrolling_down(...)
                        end,
                        ["<C-b>"] = function(...)
                            return require("telescope.actions").preview_scrolling_up(...)
                        end,
                    },
                },
                -- pickers = {
                --     lsp_definitions = {
                --         theme = "get_cursor",
                --     },
                --     lsp_references = {
                --         theme = "get_cursor",
                --     },
                --     lsp_implementation = {
                --         theme = "get_cursor",
                --     },
                --     lsp_type_definitions = {
                --         theme = "get_cursor",
                --     },
                -- },
            },
        },
    },
}
