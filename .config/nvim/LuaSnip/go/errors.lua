local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node

return {
  -- Simple error check and return
  s("ie", {
    t("if err != nil {"),
    t({ "", "\treturn " }),
    c(1, {
      t("err"),
      t('fmt.Errorf("failed to do something: %w", err)'),
      -- Add more variants as needed
    }),
    t({ "", "}" }),
  }),

  -- Error check for second return parameter
  s("iee", {
    t("if err != nil {"),
    t({ "", "\treturn " }),
    i(1, "defaultValue"),
    t(", "),
    c(2, {
      t("err"),
      t('fmt.Errorf("failed to do something: %w", err)'),
    }),
    t({ "", "}" }),
  }),

  -- Log error and return
  s("iel", {
    t("if err != nil {"),
    t({ "", "\tlog." }),
    c(1, {
      t('Printf("error: %v\\n", err)'),
      t('Println("error:", err)'),
      t("Error(err)"),
    }),
    t({ "", "\treturn " }),
    c(2, {
      t("err"),
      t('fmt.Errorf("failed to do something: %w", err)'),
    }),
    t({ "", "}" }),
  }),

  -- Log error with second return parameter
  s("ieel", {
    t("if err != nil {"),
    t({ "", "\tlog." }),
    c(1, {
      t('Printf("error: %v\\n", err)'),
      t('Println("error:", err)'),
      t("Error(err)"),
    }),
    t({ "", "\treturn " }),
    i(2, "defaultValue"),
    t(", "),
    c(3, {
      t("err"),
      t('fmt.Errorf("failed to do something: %w", err)'),
    }),
    t({ "", "}" }),
  }),
}
