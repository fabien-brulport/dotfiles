local ls = require "luasnip"
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

-- <c-k> for expansion
vim.keymap.set({ "i", "s" }, "<c-k>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> for jump backwards
vim.keymap.set({ "i", "s" }, "<c-j>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

ls.add_snippets("python", {
  s("im", fmt("import {}", {i(1)})),
  s("fim", fmt("from {} import {}", {i(1), i(2)})),
})
