return {
    "folke/neodev.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("neodev").setup()
    end,
}
