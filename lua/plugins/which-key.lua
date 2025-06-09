return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      -- Updated: operators -> defer
      defer = function(ctx)
        return ctx.mode == "V" or ctx.mode == "<C-V>"
      end,
      -- Updated: key_labels -> replace
      replace = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      -- Updated: popup_mappings -> keys
      keys = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
      -- Updated: window -> win
      win = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
      },
      layout = {
        spacing = 3,
        align = "left",
      },
      -- Updated: ignore_missing -> filter
      filter = function(mapping)
        -- Filter out mappings we want to ignore
        local ignore_patterns = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }
        for _, pattern in ipairs(ignore_patterns) do
          if mapping.desc and string.match(mapping.desc, pattern) then
            return false
          end
        end
        return true
      end,
      show_help = true,
      -- Updated: triggers must be a table
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "<leader>", mode = { "n", "v" } },
      },
      -- Updated: triggers_blacklist -> disable for specific modes/keys
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    })

    -- Updated: Use new spec format with wk.add instead of wk.register
    wk.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Debug/Diagnostics" },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Find/Files" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>s", group = "Search/Replace" },
      { "<leader>t", group = "Test/Terminal" },
      { "<leader>u", group = "UI/Utils" },
      { "<leader>w", group = "Workspace" },
      { "<leader>x", group = "Execute" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
      { "g", group = "Goto" },
    })
  end,
}
