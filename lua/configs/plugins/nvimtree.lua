local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    return
end

vim.g.nvim_tree_group_empty = 1

nvimtree.setup({
   renderer = {
       indent_markers = {
           enable = true,
       }
   }
})
