return {{
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    cmd = "Telescope",
    keys = {{
        '<Leader>ff',
        '<Cmd>Telescope find_files <CR>',
        desc = "Find File"
    }, {
        '<Leader>fg',
        '<Cmd>Telescope live_grep <CR>',
        desc = "Find Grep"
    }, {
        '<Leader>fb',
        '<Cmd>Telescope buffers <CR>',
        desc = "Find Buffer"
    }, {
        '<Leader>fh',
        '<Cmd>Telescope help_tags <CR>',
        desc = "Find Help"
    }}
}}
