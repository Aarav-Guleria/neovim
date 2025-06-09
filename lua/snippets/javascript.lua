local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("jsboiler", {
    t({ "\"use strict\";", "", "(function() {" }),
    t({ "  " }),
    i(0, "// Your code here"),
    t({ "", "})();" }),
  }),
}

