local shell = vim.o.shell

if vim.loop.os_uname().sysname == 'Windows_NT' then
    shell = 'powershell'
end
return { {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = { { "<C-\\>", "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" } },
    opts = {
        open_mapping = [[<C-\>]],
        shell = shell
    },
} }
