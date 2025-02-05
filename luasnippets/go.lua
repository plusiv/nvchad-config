local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets
local swaggo = require "custom.utils.swaggo_snippets"

snippets = {
  s("swa", {
    c(1, { swaggo.SwaggoAppBase(), t "" }),
    t { "", "" },
    c(2, { swaggo.SwaggoAppContact(), t "" }),
    t { "", "" },
    c(3, { swaggo.SwaggoAppLicense(), t "" }),
    t { "", "" },
    c(4, { swaggo.SwaggoAppHostInfo(), t "" }),
    t { "", "" },
    c(5, { swaggo.SwaggoAppSecurityInfo(), t "" }),
  }),
  s("swc", swaggo.SwaggoControllerBase()),
}

return snippets
