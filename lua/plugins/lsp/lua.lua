local M = {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}
return M
