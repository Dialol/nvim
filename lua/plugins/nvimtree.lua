require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    -- Восстанавливаем все стандартные биндинги
    api.config.mappings.default_on_attach(bufnr)

    -- Дополнительно переназначаем <BS> для перехода на уровень выше
    vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, { noremap = true, silent = true, buffer = bufnr })
  end,
})
