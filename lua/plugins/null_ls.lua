return { { "jose-elias-alvarez/null-ls.nvim",
    opts = function()
        local null_ls = require("null-ls")
        return {
            -- null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.black,
        }
    end } }
