return {{
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufRead"},
    opts = {
        show_current_context = true,
        show_current_context_start = true,

        filetype_exclude = {'lspinfo', 'lazy', 'checkhealth', 'help', 'man', 'NvimTree'}
    }
}}
