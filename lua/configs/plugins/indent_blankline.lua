local indent_blankline = require('indent_blankline')

indent_blankline.setup({
    show_current_context = true,
    show_current_context_start = true,

    filetype_exclude = {
        'lspinfo',
        'packer',
        'checkhealth',
        'help',
        'man',
        'NvimTree',
    }
})
