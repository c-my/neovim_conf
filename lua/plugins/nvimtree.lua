return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" -- optional, for file icon
    },
    lazy = false,
    opts = {
        -- open_on_tab = true,
        tab = {
            sync = {
                open = true
            }
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false
        },
        renderer = {
            indent_markers = {
                enable = true
            },
            group_empty = true
        }
    },
    keys = { {
        '<C-n>',
        '<Cmd>NvimTreeFindFileToggle <CR>',
        desc = "Nvimtree Toggle"
    }, {
        '<Leader>a',
        '<Cmd>NvimTreeFocus <CR>',
        desc = "Nvimtree Focus"
    } },
    config = function()
        require("nvim-tree").setup(opts)
        local function open_nvim_tree()
            -- open the tree
            require("nvim-tree.api").tree.toggle({focus = false, find_file = true})
        end
        vim.api.nvim_create_autocmd({"VimEnter"}, {
            callback = open_nvim_tree
        })
    end
}
