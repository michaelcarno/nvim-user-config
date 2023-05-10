return {
  n = {
    -- LSP finder - Find the symbol's definition
    -- If there is no definition, it will instead be hidden
    -- When you use an action in finder like "open vsplit",
    -- you can use <C-t> to jump back
    ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>" },

    -- Code action
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", desc = "code action" },

    -- Rename all occurrences of the hovered word for the entire file
    -- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

    -- Rename all occurrences of the hovered word for the selected files
    -- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

    ["<leader>ci"] = { "<cmd>Lspsaga incoming_calls<CR>", desc = " incoming calls" },
    ["<Leader>co"] = { "<cmd>Lspsaga outgoing_calls<CR>", desc = "outgoing calls" },

    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", desc = "Lsp saga hover" },
    ["<S-K>"] = { "<cmd>Lspsaga hover_doc<CR>", desc = "Lsp saga hover" }
    -- ["<S-K>"] = { "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "Lsp saga hover" }

  }
}
