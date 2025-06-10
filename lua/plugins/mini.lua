return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup()
    --require("mini.pairs").setup()
    --require('mini.indentscope').setup({
    --symbol = '│', -- change from '⋅' or '┊' to a clean line
    --})
    require("mini.move").setup()
    require("mini.cursorword").setup()
  end,
}
