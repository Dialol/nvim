local M = {}

function M.setup()
    require('vscode').setup({
        transparent = true,   -- 
        italic_comments = true,
        disable_nvimtree_bg = true,
    })

    vim.cmd("colorscheme vscode")

    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return M
