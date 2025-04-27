-- Подключение lspconfig
local lspconfig = require'lspconfig'
-- local cmp = require'cmp'
local luasnip = require'luasnip'

-- Определяем функцию on_attach
local on_attach = function(client, bufnr)
  -- Включаем подсветку синтаксиса от LSP
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { group = "lsp_document_highlight", buffer = bufnr }
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end
end

-- Настройка для Python
lspconfig.pyright.setup{
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
      }
    }
  }
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

-- Настройка диагностики
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
