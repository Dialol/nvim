local wk = require("which-key")

wk.setup({
  -- Add your configuration options here if necessary
})

wk.add({
  -- File-related mappings
  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags", mode = "n" },
  { "<leader>fn", "<cmd>enew<CR>", desc = "New File", mode = "n" },

  -- Window management mappings
  { "<leader>w", proxy = "<c-w>", group = "windows" },
  { "<leader>wh", "<C-w>h", desc = "Left", mode = "n" },
  { "<leader>wl", "<C-w>l", desc = "Right", mode = "n" },
  { "<leader>wj", "<C-w>j", desc = "Down", mode = "n" },
  { "<leader>wk", "<C-w>k", desc = "Up", mode = "n" },
  { "<leader>w_", ":vsplit<CR>", desc = "Vertical Split", mode = "n" },
  { "<leader>w-", ":split<CR>", desc = "Horizontal Split", mode = "n" },

  -- Buffer management mappings
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  { "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer", mode = "n" },
  { "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer", mode = "n" },
  { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer", mode = "n" },

  -- Git-related mappings
  { "<leader>h", group = "git" },
  { "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk", mode = "n" },
  { "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk", mode = "n" },
  { "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer", mode = "n" },
  { "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer", mode = "n" },
  { "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk", mode = "n" },
  { "<leader>hb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line", mode = "n" },
  { "<leader>hd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This", mode = "n" },
  { "<leader>hD", "<cmd>Gitsigns diffthis ~<CR>", desc = "Diff with Previous", mode = "n" },
  { "<leader>hq", "<cmd>Gitsigns setqflist<CR>", desc = "Set Quickfix List", mode = "n" },
  { "<leader>hQ", "<cmd>Gitsigns setqflist 'all'<CR>", desc = "Set All Quickfix", mode = "n" },

  -- LSP-related mappings
  { "<leader>l", group = "LSP" },
  { "<leader>lrn", vim.lsp.buf.rename, desc = "Rename", mode = "n" },
  { "<leader>lK", vim.lsp.buf.hover, desc = "Hover", mode = "n" },
  { "<leader>lgd", vim.lsp.buf.definition, desc = "Go to Definition", mode = "n" },
  { "<leader>lgt", vim.lsp.buf.type_definition, desc = "Go to Type", mode = "n" },
  { "<leader>lgi", vim.lsp.buf.implementation, desc = "Go to Implementation", mode = "n" },
  { "<leader>lgr", vim.lsp.buf.references, desc = "Go to References", mode = "n" },
  { "<leader><C-s>", vim.lsp.buf.signature_help, desc = "Signature Help", mode = "n" },
  { "<leader>le", vim.diagnostic.open_float, desc = "Diagnostics", mode = "n" },
  { "<leader>ld", vim.diagnostic.goto_prev, desc = "Prev Diagnostic", mode = "n" },
  { "<leader>lD", vim.diagnostic.goto_next, desc = "Next Diagnostic", mode = "n" },
  { "<leader>lq", vim.diagnostic.setloclist, desc = "Close Diagnostics", mode = "n" },
  { "<leader>lA", vim.lsp.buf.code_action, desc = "Code Actions", mode = "n" },
  { "<leader>lF", vim.lsp.buf.formatting_sync, desc = "Format Code", mode = "n" },

  -- Nvim-tree mappings
  { "<leader>e", group = "nvim-tree" },
  { "<leader>ee", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer", mode = "n" },

  -- Hop mappings
  { "f", function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }) end, desc = "Hop to Char (Forward)", mode = "n" },
  { "F", function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true }) end, desc = "Hop to Char (Backward)", mode = "n" },
  { "t", function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, desc = "Hop to Char (Forward, Before Cursor)", mode = "n" },
  { "T", function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, desc = "Hop to Char (Backward, After Cursor)", mode = "n" },

  -- Telescope mappings
  { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline", mode = "n" },

  -- Extra mappings for navigation and actions
  { "<leader>lrn", vim.lsp.buf.rename, desc = "Rename Symbol", mode = "n" },
  { "<leader>lK", vim.lsp.buf.hover, desc = "Hover", mode = "n" },
  { "<leader>lgd", vim.lsp.buf.definition, desc = "Go to Definition", mode = "n" },
  { "<leader>lgt", vim.lsp.buf.type_definition, desc = "Go to Type Definition", mode = "n" },
  { "<leader>lgi", vim.lsp.buf.implementation, desc = "Go to Implementation", mode = "n" },
  { "<leader>lgr", vim.lsp.buf.references, desc = "Go to References", mode = "n" },
})
