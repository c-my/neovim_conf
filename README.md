# My Neovim Config

## Bootstrap

1. Clone the repository to
   * Windows: `~/AppData/Local/nvim/`
   * Linux: `~/.config/nvim/`
2. Run `nvim`
3. Restart nvim after Packer Sync process

**Note**: Make sure there is no file `plugin/packer_compiled.lua` before step2.

## Plugins

* [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
* [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim)
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
* [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [max397574/better-escape.nvim](https://github.com/max397574/better-escape.nvim)
* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
* [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
* [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
* [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
* [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
* [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
* [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
* [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

## Themes

* [catppuccin/nvim](https://github.com/catppuccin/nvim)
* [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

## TODOs

- [x] LSP
- [x] 调整配置文件缩进
- [x] Packer Plugins 懒加载
- [x] CMP snip换行后tab数量问题
- [x] CMP command 不区分大小写
- [x] CMP document border
- [x] CMP highlight 首个
- [x] CMP ghost
- [x] CMP 函数自动加括号
- [x] LSP 放在 CMP sources 最前面
- [x] Autopairs 配置
- [x] 注释插件
- [x] Luasnip 功能
- [x] LuaLine 
- [x] shift 块后保持选择
- [ ] window resize 快捷键
