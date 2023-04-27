vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.fileencoding = "utf-8"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.list = true
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.numberwidth = 2
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 5
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 250 -- Save swap file and trigger CursorHold
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.pumheight = 13
vim.opt.smartcase = true -- Dont ignore case when there is capitals
vim.opt.wildignorecase = true
vim.opt.wildmenu = false

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.termguicolors = true

-- Tab and Shift
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4 -- Spaces in tab

vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.shortmess = "I"
vim.opt.splitkeep = "screen"
-- Fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 100
vim.opt.fillchars = {
    fold = " ",
}
function _G.my_foldtext()
    local line = vim.fn.getline(vim.v.foldstart)
    -- local line_count = vim.v.foldend - vim.v.foldstart + 1
    return line .. " "
end
vim.opt.foldtext = "v:lua.my_foldtext()"
