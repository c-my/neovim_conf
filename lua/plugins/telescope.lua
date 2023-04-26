-- This functions is to fix a bug in telescope
-- that the fold not word if open file in telescope
-- https://github.com/nvim-telescope/telescope.nvim/issues/559#issuecomment-1221001701
local function stopinsert(callback)
    return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
            callback(prompt_bufnr)
        end)
    end
end
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        branch = "0.1.x",
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({

                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-f>"] = actions.preview_scrolling_down,
                            ["<C-b>"] = actions.preview_scrolling_up,
                            ["<Esc>"] = actions.close, -- As we don't use normal node in telescope
                            ["<CR>"] = stopinsert(actions.select_default),
                            ["<C-v>"] = stopinsert(actions.select_vertical),
                            ["<C-x>"] = stopinsert(actions.select_horizontal),
                            ["<C-t>"] = stopinsert(actions.select_tab),
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-f>"] = actions.preview_scrolling_down,
                            ["<C-b>"] = actions.preview_scrolling_up,
                            ["q"] = actions.close,
                        },
                    },
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                        theme = "dropdown",
                    },
                },
            })
        end,
        keys = {
            {
                "<Leader>ff",
                "<Cmd>Telescope find_files<CR>",
                desc = "Find File",
            },
            {
                "<Leader>fg",
                "<Cmd>Telescope live_grep<CR>",
                desc = "Find Grep",
            },
            {
                "<Leader>fb",
                "<Cmd>Telescope buffers<CR>",
                desc = "Find Buffer",
            },
            {
                "<Leader>fh",
                "<Cmd>Telescope help_tags<CR>",
                desc = "Find Help",
            },
            {
                "<Leader>ft",
                "<Cmd>Telescope colorscheme<CR>",
                desc = "Find Theme",
            },
        },
    },
}
