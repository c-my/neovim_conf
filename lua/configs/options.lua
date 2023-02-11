vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.fileencoding = 'utf-8'
vim.opt.list = true
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.pumheight = 13
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.wildmenu = false

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 4
vim.opt.termguicolors = true


vim.opt.completeopt = 'menu,menuone,noinsert'
vim.opt.shortmess = 'I'

vim.api.nvim_create_autocmd(
    "VimLeave",
    { pattern = "*", command = "set guicursor=a:ver20-blinkwait300-blinkon200-blinkoff150" }
)
