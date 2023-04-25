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
            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    -- stylua: ignore start
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration", buffer = ev.buf })
                    vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions theme=get_cursor<CR>", { desc = "Goto Definition", buffer = ev.buf })
                    vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references theme=get_cursor<CR>", { desc = "Goto References", buffer = ev.buf })
                    vim.keymap.set("n", "gi", "<Cmd>Telescope lsp_implementation theme=get_cursor<CR>", { desc = "Goto Implementation", buffer = ev.buf })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = ev.buf })
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = ev.buf })
                    vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf })
                    vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf })
                    vim.keymap.set("n", "<Leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, { buffer = ev.buf })
                    vim.keymap.set("n", "<Leader>D", "<Cmd>Telescope lsp_type_definitions theme=get_cursor<CR>", { buffer = ev.buf })
                    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = ev.buf })
                    vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = ev.buf })
                    vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, { desc = "Format Document", buffer = ev.buf })
                    -- stylua ignore end
                end,
            })
            local on_attach = function(client, bufnr)
                -- Avoiding LSP formatting conflicts
                local null_ls_table = { pyright = true, lua_ls = true }
                if null_ls_table[client.name] then
                    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
                end
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
                ["pyright"] = function()
                    local pyright_config = require("plugins.lsp.pyright")
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        on_attach = pyright_config.on_attach,
                    })
                end,
                ["lua_ls"] = function()
                    local lua_config = require("plugins.lsp.lua")
                    lspconfig.lua_ls.setup({
                        on_attach = lua_config.on_attach,
                        capabilities = capabilities,
                        settings = lua_config.settings,
                    })
                end,
                ["texlab"] = function()
                    local texlab_config = require("plugins.lsp.texlab")
                    lspconfig.texlab.setup({
                        on_attach = texlab_config.on_attach,
                        capabilities = capabilities,
                        settings = texlab_config.settings,
                    })
                end,
            })
        end,
        dependencies = { "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim" },
    },
}
