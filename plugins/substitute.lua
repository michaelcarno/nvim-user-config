return {

  "gbprod/substitute.nvim",
  event = "VeryLazy",
  config = function()
    require("substitute").setup()
    -- vim.keymap.set("n", "<leader>so", require('substitute').operator, { noremap = true })
    -- vim.keymap.set("n", "<leader>ss", require('substitute').line, { noremap = true })
    -- vim.keymap.set("n", "<leader>sS", require('substitute').eol, { noremap = true })
    -- vim.keymap.set("x", "<leader>sv", require('substitute').visual, { noremap = true })
    -- vim.keymap.set("n", "<leader>sx", require('substitute.exchange').operator, { noremap = true })
    -- vim.keymap.set("n", "<leader>sxx", require('substitute.exchange').line, { noremap = true })
    -- vim.keymap.set("x", "<leader>sX", require('substitute.exchange').visual, { noremap = true })
    -- vim.keymap.set("n", "<leader>sxc", require('substitute.exchange').cancel, { noremap = true })
  end,
  keys = {
    { "<leader>so", function() require('substitute').operator() end, desc = "Subs operator" },
    { "<leader>sS", function() require('substitute').eol() end,      desc = "Subs eol" },
    {
      "<leader>sv",
      mode = { "x" },
      function()
        require(
          'substitute'
        ).visual()
      end,
      desc = "Subs visual"
    },
    { "<leader>sx",  function() require('substitute.exchange').operator() end, desc = "Subs exh operator" },
    { "<leader>sxx", function() require('substitute.exchange').line() end,     desc = "Subs exh line" },
    {
      "<leader>sX",
      mode = { "x" },
      function()
        require('substitute.exchange')
            .visual()
      end,
      desc = "Subs exh visual"
    },
    { "<leader>sxc", function() require('substitute.exchange').cancel() end, desc = "Subs  exh cancel" },
  }

}
