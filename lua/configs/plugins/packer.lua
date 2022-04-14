local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
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
    use 'wbthomason/packer.nvim'
    use 'windwp/nvim-autopairs'
    use {'numToStr/Comment.nvim'}
    use {'lewis6991/gitsigns.nvim' -- tag = 'release' -- To use the latest release
    }
    use {'max397574/better-escape.nvim'}

    -- CMP plugins
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'saadparwaiz1/cmp_luasnip'} -- Snippet compleetions

    -- Snippets
    use {'L3MON4D3/LuaSnip'} -- Snippet engine
    use {'rafamadriz/friendly-snippets'} -- Snippets collection

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/nvim-lsp-installer'}

    -- UI Plugins
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons' -- optional, for file icon
        }
    }
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Themes
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use {'folke/tokyonight.nvim'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
