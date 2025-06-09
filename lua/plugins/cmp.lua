return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

            local kind_icons = {
                          Text = "¾░ë┐",
                          Method = "¾░åº",
                          Function = "¾░èò",
                          Constructor = "´Éú",
                          Field = "¾░£ó",
                          Variable = "¾░Ç½",
                          Class = "¾░á▒",
                          Interface = "´â¿",
                          Module = "´Æç",
                          Property = "¾░£ó",
                          Unit = "¯êƒ",
                          Value = "¾░Äá",
                          Enum = "´àØ",
                          Keyword = "¾░îï",
                          Snippet = "´æÅ",
                          Color = "¾░Åÿ",
                          File = "¾░êÖ",
                          Reference = "¾░êç",
                          Folder = "¾░ëï",
                          EnumMember = "´àØ",
                          Constant = "¾░Å┐",
                          Struct = "¾░Öà",
                          Event = "´âº",
                          Operator = "¾░åò",
                          TypeParameter = "¾░èä",
                        }

      cmp.setup({
        completion = {
          autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
              cmp.confirm({ select = false })
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              emmet = "[Emmet]",
            })[entry.source.name]
            return vim_item
          end,
        },
        experimental = {
          ghost_text = true,
        },
      })

      cmp.setup.filetype({ "html", "css", "scss", "javascriptreact", "typescriptreact" }, {
        sources = cmp.config.sources({
          { name = "emmet" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}

