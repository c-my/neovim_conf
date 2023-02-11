return { {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = { "InsertEnter", --
        "CmdlineEnter" -- for enable cmp when typing command
    },
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip", "windwp/nvim-autopairs", {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        }
    } },
    opts = function()
        local cmp = require("cmp")
        local luasnip = require('luasnip')

        local kind_icons = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = ""
        }
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        return {
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    luasnip.lsp_expand(args.body)
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    vim_item.abbr = string.format('%s', vim_item.abbr)
                    vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
                    vim_item.menu = ({
                            nvim_lsp = '[LSP]',
                            luasnip = '[Snippet]',
                            buffer = '[BUF]',
                            path = '[Path]',
                        })[entry.source.name]

                    return vim_item
                end
            },
            mapping = {
                ['<C-k>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({
                            -- Select but noinsert
                            behavior = cmp.SelectBehavior.Select
                        })
                    else
                        fallback()
                    end
                end, { 'i', 'c', 's' }),
                ['<C-j>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({
                            behavior = cmp.SelectBehavior.Select
                        })
                    else
                        fallback()
                    end
                end, { 'i', 'c', 's' }),
                ['<C-b>'] = cmp.mapping.scroll_docs( -4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c', 's' }), -- d
                ['<C-e>'] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }),
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({
                            select = true
                        })
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 'c', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable( -1) then
                        luasnip.jump( -1)
                    else
                        fallback()
                    end
                end, { 'i', 's' })
            },
            completion = {
                -- Highlight first item
                completeopt = 'menu,menuone,noinsert'
            },
            window = {
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
                }
            },
            experimental = {
                ghost_text = {
                    hl_group = "LspCodeLens"
                }
            },
            sources = { {
                name = 'nvim_lsp',
                keyword_length = 1,
            }, {
                name = 'luasnip'
            }, {
                name = 'buffer'
            }, {
                name = 'path'
            } }
        }
    end,
    config = function(_, opts)
        vim.cmd [[highlight CmpItemAbbrDeprecated gui=strikethrough]]

        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) -- Add parentheses after selecting function or method item
        cmp.setup(opts)
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end
} }
