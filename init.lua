-- Basic
require('core.plugins')
require('core.mappings')
require('core.colors').setup()
require('core.configs')

-- Plugins
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.telescope')
require('plugins.ale')
require('plugins.autopairs')
require('plugins.autotag')
require('plugins.buffline')
require('plugins.nvimtree')
require('plugins.comment')
require('plugins.dashboard')
require('plugins.gitsigns')
require('plugins.hop')
require('plugins.lualine')
require('plugins.luasnip')
require('plugins.outline')
require('plugins.whichkey')
require('plugins.toggleterm')
require('lspsaga') --add

vim.env.PATH = vim.env.PATH .. ':/home/dialol/.nvm/versions/node/v23.9.0/bin'
vim.opt.swapfile = true


