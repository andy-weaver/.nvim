return {
  "lewis6991/gitsigns.nvim",
  url="git@github:lewis6991/gitsigns.nvim.git",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup()
  end,
}
