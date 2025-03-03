vim.g.mapleader = " "
vim.g.maplocalleader = ' ' -- Локальный Leader (опционально)


vim.keymap.set('n', '<Leader>ww', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>qq', ':q!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', function()
  local api = require('nvim-tree.api')
  if api.tree.is_visible() then
    api.tree.close()
  else
    api.tree.open({ focus = false, position = 'left' })
  end
end, { noremap = true, silent = true })


-- Вертикальный сплит с использованием Ctrl-w _
vim.api.nvim_set_keymap('n', '<C-w>_', ':vsplit<CR>', { noremap = true, silent = true })

-- Горизонтальный сплит с использованием Ctrl-w -
vim.api.nvim_set_keymap('n', '<C-w>-', ':split<CR>', { noremap = true, silent = true })


-- Переход между окнами
vim.keymap.set('n', '<Leader>w<Left>', '<C-w>h', { noremap = true, silent = true })  -- Влево
vim.keymap.set('n', '<Leader>w<Right>', '<C-w>l', { noremap = true, silent = true }) -- Вправо
vim.keymap.set('n', '<Leader>w<Down>', '<C-w>j', { noremap = true, silent = true })  -- Вниз
vim.keymap.set('n', '<Leader>w<Up>', '<C-w>k', { noremap = true, silent = true })    -- Вверх


-- Изменение размеров окон
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true })  -- Уменьшить ширину
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true }) -- Увеличить ширину
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })             -- Уменьшить высоту
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })           -- Увеличить высоту

-- Перейти к следующему буферу
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Перейти к предыдущему буферу
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Закрыть текущий буфер
vim.api.nvim_set_keymap('n', '<leader>x', ':bdelete<CR>', { noremap = true, silent = true })

-- Outline
vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })


local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})

vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})

vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})

vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})


-- Функция on_attach для настройки сопоставлений клавиш
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- Переименование символа
  vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)

  -- Просмотр документации
  vim.keymap.set('n', '<leader>lK', vim.lsp.buf.hover, bufopts)

  -- Переход к определению
  vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, bufopts)

  -- Переход к определению типа
  vim.keymap.set('n', '<leader>lgt', vim.lsp.buf.type_definition, bufopts)

  -- Переход к реализации
  vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, bufopts)

  -- Показать ссылки
  vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, bufopts)

  -- Получить информацию о подписи
  vim.keymap.set('i', '<leader>l<C-s>', vim.lsp.buf.signature_help, bufopts)

  -- Показать ошибки и предупреждения
  vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, bufopts)

  -- Переход к следующей диагностике
  vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev, bufopts)

  -- Переход к предыдущей диагностике
  vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next, bufopts)

  -- Закрытие списка диагностик
  vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, bufopts)

  -- Кодовые действия
  vim.keymap.set('n', '<leader>lA', vim.lsp.buf.code_action, bufopts)

  -- Форматирование кода
  vim.keymap.set('n', '<leader>lF', vim.lsp.buf.formatting_sync, bufopts)

end

-- Экспорт функции on_attach для использования в других файлах
return {
  on_attach = on_attach
}

