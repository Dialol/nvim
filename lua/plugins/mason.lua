-- Настройка Mason
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "pyright", "bashls", "cssls", "html" },
  automatic_installation = true,
}

