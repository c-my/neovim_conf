return {
    Lua = {
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = {
                [vim.fn.stdpath('config') .. '/lua'] = true,
            },
        },
    }
}
