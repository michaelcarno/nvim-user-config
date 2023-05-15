return {
    "Verf/telescope-everything.nvim",
    event = "VeryLazy",
    config = function()
        require("telescope").load_extension "everything"
    end
   
}
