local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("cssboiler", {
    t({
      "/* CSS Reset */",
      "* {",
      "  margin: 0;",
      "  padding: 0;",
      "  box-sizing: border-box;",
    }),
    t({ "", "}" }),
    i(0),
  }),
}

