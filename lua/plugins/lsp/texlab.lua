local M = {

    on_attach = function(client, bufnr)
        vim.keymap.set("n", "<Leader>lb", "<Cmd>TexlabBuild<CR>", { desc = "Texlab Build", buffer = bufnr })
        vim.keymap.set("n", "<Leader>lf", "<Cmd>TexlabForward<CR>", { desc = "Texlab Forward", buffer = bufnr })
    end,
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { "-interaction=nonstopmode", "-synctex=1" },
                onSave = true,
                forwardSearchAfter = false,
            },
            forwardSearch = {
                executable = "SumatraPDF.exe",
                args = { "-reuse-instance", "%p", "-forward-search", "%f", "%l" },
            },
        },
    },
}
return M
