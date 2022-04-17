local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {
                border = 'rounded'
            }
        end
    }
}
return packer.startup(function(use)
    -- My plugins here
    use { 'wbthomason/packer.nvim' }
    use { 'lewis6991/impatient.nvim' }
    use {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufRead", "BufNewFile" },
        config = function()
            require('configs.plugins.treesitter')
        end
    }
    use {
        'windwp/nvim-autopairs', -- Can't lazyloaded because cmp-related
        config = function()
            require('configs.plugins.autopairs')
        end
    }
    use {
        'numToStr/Comment.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('configs.plugins.comment')
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('configs.plugins.gitsigns')
        end
        -- tag = 'release' -- To use the latest release
    }
    use {
        'max397574/better-escape.nvim',
        event = 'InsertEnter',
        config = function()
            require('configs.plugins.better_escape')
        end
    }

    -- CMP plugins
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('configs.plugins.cmp')
        end
    }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'saadparwaiz1/cmp_luasnip' } -- Snippet compleetions

    -- Snippets
    use { 'L3MON4D3/LuaSnip' } -- Snippet engine
    use { 'rafamadriz/friendly-snippets' } -- Snippets collection

    -- LSP
    use { 'neovim/nvim-lspconfig' -- config = function()
        --     require('configs.plugins.lsp_installer')
        -- end
    }
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('configs.plugins.lsp_installer')
        end
    }
    use { 'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('configs.plugins.null_ls')
        end
    }

    -- UI Plugins
    use { 'kyazdani42/nvim-web-devicons' }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = function()
            require('configs.plugins.nvimtree')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('configs.plugins.bufferline')
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('configs.plugins.lualine')
        end,
        opt = false
    }
    use { 'simrat39/symbols-outline.nvim',
        cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
        config = function()
            vim.keymap.set('n', '<leader>o', ':SymbolsOutline<CR>', { silent = true })
        end,
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('configs.plugins.toggleterm')
        end
    }

    -- Themes
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            local catppuccin = require('catppuccin')
            catppuccin.setup()
            vim.cmd [[colorscheme catppuccin]]
        end
    }
    use {
        'folke/tokyonight.nvim',
        opt = true,
        config = function()
            vim.g.tokyonight_style = 'night'
            vim.cmd [[colorscheme tokyonight]]
        end
    }
    use({
        'rose-pine/neovim',
        opt = true,
        as = 'rose-pine',
        tag = 'v1.*',
        config = function()
            require('rose-pine').setup({
                ---@usage 'main'|'moon'
                dark_variant = 'main',
            })
            -- vim.cmd('colorscheme rose-pine')
        end
    })
    -- Automatically set up your configuration after cloning packer.nvim,
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
