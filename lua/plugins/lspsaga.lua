require("lspsaga").setup({
  ui = {
    border = "rounded",
    code_action = "💡",
  },
  lightbulb = {
    enable = true,
    sign = true,
    virtual_text = true,
  },
})

local keymap = vim.keymap.set
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LSP Code Action" })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover Doc" })
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "LSP Goto Definition" })
