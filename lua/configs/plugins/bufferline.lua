local bufferline = require('bufferline')

local opts = {
    noremap = true,
    silent = true
}

vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)

bufferline.setup({
    offsets = {
        { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
    },
})
