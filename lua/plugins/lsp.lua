-- Подключение lspconfig
local lspconfig = require'lspconfig'
-- local cmp = require'cmp'
local luasnip = require'luasnip'

-- Настройка для Python
lspconfig.pyright.setup{
  on_attach = on_attach,
}

-- Настройка для Bash
lspconfig.bashls.setup{
  on_attach = on_attach,
}

-- Настройка для CSS
lspconfig.cssls.setup{
  on_attach = on_attach,
}

-- Настройка для HTML
lspconfig.html.setup{
  on_attach = on_attach,
}


