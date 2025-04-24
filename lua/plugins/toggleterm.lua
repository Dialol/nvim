-- Подключаем toggleterm
require("toggleterm").setup({
  size = 15, -- Размер терминала
  open_mapping = [[<C-\>]], -- Сочетание клавиш Ctrl + \
  direction = "horizontal", -- Направление терминала (horizontal, vertical, float, tab)
  close_on_exit = true, -- Закрывать терминал при выходе
  auto_scroll = true, -- Автоматическая прокрутка при выводе
  -- Дополнительные настройки
  highlights = {
    -- Подсветка для терминала
    Normal = { guibg = "NONE" },
    NormalFloat = { guibg = "NONE" },
  },
})

-- Функция для открытия терминала в текущей директории файла
local function open_terminal_in_current_dir()
  -- Получаем путь к текущему файлу
  local current_file = vim.api.nvim_buf_get_name(0)
  -- Получаем директорию текущего файла
  local current_dir = vim.fn.fnamemodify(current_file, ":h")
  -- Переходим в эту директорию
  vim.cmd("cd " .. current_dir)
  -- Открываем терминал
  require("toggleterm").toggle()
end

-- Убедимся, что функция доступна глобально
_G.open_terminal_in_current_dir = open_terminal_in_current_dir

-- Назначаем сочетание клавиш Ctrl + \ для открытия терминала в текущей директории
vim.api.nvim_set_keymap("n", "<C-\\>", "<cmd>lua open_terminal_in_current_dir()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-\\>", "<Esc><cmd>lua open_terminal_in_current_dir()<CR>", { noremap = true, silent = true })

-- Автокоманда для обновления текущей директории при закрытии файла
vim.api.nvim_create_autocmd("BufDelete", {
  pattern = "*",
  callback = function()
    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file ~= "" then
      local current_dir = vim.fn.fnamemodify(current_file, ":h")
      vim.cmd("cd " .. current_dir)
    end
  end,
})

