local M = {
    on_attach = function(client, bufnr)
        -- Adopting Black formater in python
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    end,
}
return M
