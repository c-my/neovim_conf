require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'go', 'java', 'json', 'lua', 'python' },
    highlight = {
        enable = true,
    }
})
