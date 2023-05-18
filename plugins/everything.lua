return {
    "Verf/telescope-everything.nvim",
    event = "VeryLazy",
    config = function()
        require("telescope").load_extension "everything"
    end,
    keys = {
        {
            "<leader>fe",
            "<cmd>Telescope everything<cr>",
            desc = "Find with everything",
        }
    }

}
