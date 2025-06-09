local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("rfc", {
    t({ "import React from 'react';", "", "interface Props {}" }),
    t({ "", "const Component: React.FC<Props> = () => {" }),
    t({ "  return (" }),
    t({ "    <div>" }),
    i(0),
    t({ "    </div>" }),
    t({ "  );", "};", "", "export default Component;" }),
  }),
}

