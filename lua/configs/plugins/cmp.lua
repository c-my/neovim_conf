local present_cmp, cmp = pcall(require, 'cmp')
if not present_cmp then
    print 'no cmp'
    return
end

local present_lua, luasnip = pcall(require, 'luasnip')
if not present_lua then
    print 'no luasnip'
    return
end

local present_auto_pair, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not present_auto_pair then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

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

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup({
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
                path = '[Path]'
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
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
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
            else
                fallback()
            end
        end, { 'i', 'c', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
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
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
    },
    experimental = {
        -- ghost_text = true
    },
    sources = { {
        name = 'nvim_lsp'
    }, {
        name = 'luasnip'
    }, {
        name = 'buffer'
    }, {
        name = 'path'
    }, {
        name = 'cmdline'
    } }
})

cmp.setup.cmdline(':', {
    sources = { {
        name = 'cmdline'
    } }
})

cmp.setup.cmdline('/', {
    sources = { {
        name = 'buffer'
    } }
})
