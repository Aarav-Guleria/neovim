return {
  "klen/nvim-test",
  event = "BufReadPost",
  config = function()
    require("nvim-test").setup()
  end,
}

