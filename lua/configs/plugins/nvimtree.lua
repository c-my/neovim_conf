local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end

vim.g.nvim_tree_group_empty = 1

nvimtree.setup({
    open_on_setup = true,
    open_on_setup_file = true,
    open_on_tab = true,
    ignore_ft_on_setup = {'alpha', 'dashboard'},
    diagnostics = {
        enable = true,
        show_on_dirs = false,
    },
    renderer = {
        indent_markers = {
            enable = true,
        }
    }
})
