-- Установка lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Инициализация lazy.nvim и установка плагинов
require("lazy").setup({
    { 'phaazon/hop.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },            
    { 'hrsh7th/cmp-nvim-lsp' },        
    { 'L3MON4D3/LuaSnip', dependencies = { 'rafamadriz/friendly-snippets' }, },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rebelot/kanagawa.nvim', priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'dense-analysis/ale' },
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
    { 'windwp/nvim-ts-autotag' },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'echasnovski/mini.nvim' },
    { 'nvim-tree/nvim-tree.lua' },
    { 'terrortylor/nvim-comment' },
    { 'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = {'nvim-tree/nvim-web-devicons'} },
    { 'lewis6991/gitsigns.nvim' },
    { 'phaazon/hop.nvim', branch = 'v2' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'hedyhli/outline.nvim' },
    { 'folke/which-key.nvim', event = 'VeryLazy' },
    { 'akinsho/toggleterm.nvim', version = "*", config = true }
})

