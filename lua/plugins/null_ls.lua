return { { "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    opts = function()
        local null_ls = require("null-ls")
        return {
            sources = {
                -- null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
            }
        }
    end } }
