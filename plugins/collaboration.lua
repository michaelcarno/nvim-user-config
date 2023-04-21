return {
  "jbyuki/instant.nvim",
  event = "BufRead",
  cmd = "Collab",
  config = function()
    vim.g.instant_username = "MichaelCarno"
  end
}
