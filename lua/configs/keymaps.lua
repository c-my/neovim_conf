local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use ESC to turn off search highlighting
map({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move in insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

-- Moving line
-- == re-indents the line to suit its new position
-- gc reselects the last visual block
-- = re-indents the block
map("n", "<A-j>", "<Cmd>m .+1<CR>==", { desc = "Move down" })
map("n", "<A-k>", "<Cmd>m .-2<CR>==", { desc = "Move up" })
map("i", "<A-j>", "<Esc><Cmd>m .+1<CR>==gi", { desc = "Move down" })
map("i", "<A-k>", "<Esc><Cmd>m .-2<CR>==gi", { desc = "Move up" })
-- The colon(:) bellow cannot be replaced by <Cmd>
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- Keep selecting visual block
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Add undo break-points
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", ";", ";<C-g>u")

-- Save file
map({ "i", "v", "n", "s" }, "<C-s>", "<Cmd>w<CR><Esc>", { desc = "Save file" })
map({ "v", "n", "s" }, "<Leader>fs", "<Cmd>w<CR><Esc>", { desc = "Save file" })
-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- split/delete windows
map("n", "<Leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<Leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<Leader>w|", "<C-W>s", { desc = "Split window below" })
map("n", "<Leader>w-", "<C-W>v", { desc = "Split window right" })
map("n", "<Leader>|", "<C-W>s", { desc = "Split window below" })
map("n", "<Leader>-", "<C-W>v", { desc = "Split window right" })

-- quit
map("n", "<Leader>qq", "<Cmd>qa<CR>", { desc = "Quit all" })

-- Lazy
map("n", "<leader>l", "<Cmd>:Lazy<cr>", { desc = "Lazy" })
