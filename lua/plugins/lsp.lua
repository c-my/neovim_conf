return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = { "jdtls", "omnisharp", "pyright", "lua_ls" },
        },
        config = function(_, opts)
            local on_attach = function(client, bufnr)
                -- Avoiding LSP formatting conflicts
                local null_ls_table = { pyright = true, lua_ls = true }
                if null_ls_table[client.name] then
                    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
                end
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = {
                    noremap = true,
                    silent = true,
                    buffer = bufnr,
                }
                local function map(mode, lhs, rhs, opts)
                    opts = opts or {}
                    opts.noremap = true
                    opts.silent = true
                    opts.buffer = bufnr
                    vim.keymap.set(mode, lhs, rhs, opts)
                end
                map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
                map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "Goto Definition" })
                map("n", "gr", "<Cmd>Telescope lsp_references<CR>", { desc = "Godo References" })
                map("n", "gi", "<Cmd>Telescope lsp_implementation<CR>", { desc = "Goto Implementation" })
                map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
                map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
                vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set("n", "<Leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
                map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
                map("n", "<Leader>fm", vim.lsp.buf.format, { desc = "Format Document" })
            end
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup(opts)
            require("mason-lspconfig").setup_handlers({
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
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
                    })
                end,
            })
        end,
        dependencies = { "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim" },
    },
}
