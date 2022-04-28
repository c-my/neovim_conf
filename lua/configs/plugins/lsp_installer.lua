local lsp_installer = require('nvim-lsp-installer')

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
lsp_installer.setup {}


local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    settings = require('configs.plugins.lsp_settings.sumneko_lua'),
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),

})

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         on_attach = on_attach,
--         flags = {
--             -- This will be the default in neovim 0.7+
--             debounce_text_changes = 150
--         },
--         capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     }
--
--     if server.name == 'sumneko_lua' then
--         local sumneko_lua_opts = require('configs.plugins.lsp_settings.sumneko_lua')
--         opts.settings = sumneko_lua_opts
--     end
--     -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     --     opts.root_dir = function() ... end
--     -- end
--
--     -- This setup() function will take the provided server configuration and decorate it with the necessary properties
--     -- before passing it onwards to lspconfig.
--     -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--     server:setup(opts)
-- end)
