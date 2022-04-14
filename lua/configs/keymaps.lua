local opts = {
    noremap = true,
    silent = true
}

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Moving line
-- == re-indents the line to suit its new position
-- gc reselects the last visual block
-- = re-indents the block
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', opts)
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', opts)
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Navigating window
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

-- Keymaps for NvimTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeFindFileToggle <CR>', opts)

-- Keymaps for Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files <CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep <CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers <CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags <CR>', opts)

-- Keymaps for LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


