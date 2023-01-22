require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'c_sharp', 'cpp', 'go', 'help', 'java', 'json', 'lua', 'python', 'vim' },
    highlight = {
        enable = true,
    }
})
