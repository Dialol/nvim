-- В файле конфигурации (например, `lua/config/ale.lua`)
local function configure_ale()
    local g = vim.g

    -- Включить автоисправление для всех поддерживаемых языков
    g.ale_fix_on_save = 1

    -- Форматтеры и линтеры для каждого языка
    g.ale_linters = {
        python = {'flake8', 'pylint'},  -- Линтеры для Python
        sh = {'shellcheck'},           -- Линтер для Bash
        css = {'stylelint'},           -- Линтер для CSS
        http = {'http'},               -- Линтер для HTTP-файлов
    }

    g.ale_fixers = {
        python = {'black', 'isort'},   -- Форматтеры для Python
        sh = {'shfmt'},                -- Форматтер для Bash
        css = {'prettier'},            -- Форматтер для CSS
        http = {'prettier'},           -- Форматтер для HTTP-файлов
    }

    -- Настройки для конкретных форматтеров (опционально)
    g.ale_python_black_options = '--line-length 88'
    g.ale_sh_shfmt_options = '-i 4'   -- Использовать 4 пробела для отступов в Bash
    g.ale_css_prettier_options = '--tab-width 4' 
end

return configure_ale
