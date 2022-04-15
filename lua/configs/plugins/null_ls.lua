local present, null_ls = pcall(require, 'null-ls')
if not present then
    vim.notify('no null-ls')
    return
end

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.stylua,
    }
})
