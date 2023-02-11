return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = {"BufReadPost", "BufNewFile"},
    opts = {
        ensure_installed = {"c", "c_sharp", "cpp", "go", "help", "java", "json", "lua", "python", "vim"},
        highlight = {
            enable = true
        }
    },
    ---@param opts TSConfig
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
