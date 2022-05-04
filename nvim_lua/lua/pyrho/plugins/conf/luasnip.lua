local M = {}
function M.config()
  local ls = require("luasnip")
  -- some shorthands...
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local l = require("luasnip.extras").lambda
  local rep = require("luasnip.extras").rep
  local p = require("luasnip.extras").partial
  local m = require("luasnip.extras").match
  local n = require("luasnip.extras").nonempty
  local dl = require("luasnip.extras").dynamic_lambda
  local fmt = require("luasnip.extras.fmt").fmt
  local fmta = require("luasnip.extras.fmt").fmta
  local types = require("luasnip.util.types")
  local conds = require("luasnip.extras.expand_conditions")

  local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do table.insert(res, line) end
    return res
  end
  

  ls.add_snippets("all", {
    s("todo", {t("// @TODO"), t({"", "// - dr, "}), p(os.date, "%Y-%m-%d")}),

    s("note", {
      t("// @NOTE"), t({"", "// "}), i(0), t({"", "// - dr, "}),
      p(os.date, "%Y-%m-%d")
    }), s("boxcom", {
      f(function() return string.rep("/", 80) end, {}), t({"", "/* ", ""}),
      -- "<cmd>.!toilet -w80 -f pagga -F border<CR>Vjjjj:center<CR>",
      f(function(_, snip) return bash("","", "toilet -w80 -f pagga -F border "..snip.env.TM_SELECTED_TEXT[1]) end, {}),t({"", ""}),
      t({"*/", ""}),
      f(function() return string.rep("/", 80) end, {})
    })

  })

  ls.add_snippets("typescript", {
    s("imp", {
      t("import { "), i(2, "THINGS"), t(" } from '"), i(1, "MODULE"), t("'"),
      i(0)
    }), s("eslint-ignore-never-throw-result",
          {t("// eslint-disable-next-line neverthrow/must-use-result")}),

    s("iefe", {t("(() => {"), t(""), t("})()")}),

    s('testdescit', {
        t({"describe('', () => {", "it('should', () => {"}), i(1),
        t({"})", "})"})

    }),

    ls.parser.parse_snippet({trig = "clogj"}, "console.log(JSON.stringify($1, null, 2))")

  })

  ls.filetype_set("javascript", {"typescript"})

  vim.api.nvim_set_keymap("i", "<C-y>", "<Plug>luasnip-expand-or-jump", {})
  vim.api.nvim_set_keymap("s", "<C-y>", "<Plug>luasnip-expand-or-jump", {})
  ls.config.setup({store_selection_keys = "<Tab>"})
  -- require("luasnip.loaders.from_snipmate").load()
end
return M
