local nvimtree = require("nvim-tree")

nvimtree.setup({
    -- open_on_tab = true,
    tab = {
        sync = {
            open = true,
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        group_empty = true,
    }
})

local function open_nvim_tree()
    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
