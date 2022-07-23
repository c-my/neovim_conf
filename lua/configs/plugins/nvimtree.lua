local nvimtree = require("nvim-tree")

nvimtree.setup({
    open_on_setup = true,
    open_on_setup_file = true,
    open_on_tab = true,
    ignore_ft_on_setup = { 'alpha', 'dashboard' },
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
