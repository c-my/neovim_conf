local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- {
--     "jose-elias-alvarez/null-ls.nvim",
--     config = function()
--         require("configs.plugins.null_ls")
--     end
-- },
-- -- UI Plugins
-- {
--     "akinsho/bufferline.nvim",
--     tag = "*",
--     requires = "nvim-tree/nvim-web-devicons",
--     config = function()
--         require("configs.plugins.bufferline")
--     end
-- }}
