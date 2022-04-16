local opts = {
    silent = true
}

vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Moving line
-- == re-indents the line to suit its new position
-- gc reselects the last visual block
-- = re-indents the block
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Keep selecting visual block
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Navigating window
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Keymaps for NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle <CR>', opts)
vim.keymap.set('n', '<leader>a', ':NvimTreeFocus <CR>', opts)

-- Keymaps for Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files <CR>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep <CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers <CR>', opts)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags <CR>', opts)

-- Keymaps for LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
