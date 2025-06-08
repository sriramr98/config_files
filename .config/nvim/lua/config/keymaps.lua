-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local keymaps = {
  {
    mode = "n",
    key = "<Up>",
    action = ":resize +2<CR>",
    description = "Decrease current pane height with Up arrow",
  },
  {
    mode = "n",
    key = "<Down>",
    action = ":resize -2<CR>",
    description = "Increase current pane height with Down arrow",
  },
  {
    mode = "n",
    key = "<Left>",
    action = ":vertical resize +2<CR>",
    description = "Increase current pane width with Left arrow",
  },
  {
    mode = "n",
    key = "<Right>",
    action = ":vertical resize -2<CR>",
    description = "Decrease current pane widht with Right arrow",
  },
  { mode = "n", key = "<Tab>", action = ":bnext<CR>", description = "GoTo Next Buffer/Tab" },
  { mode = "n", key = "<S-Tab>", action = ":bprevious<CR>", description = "GoTo Previous Buffer/Tab" },
  {
    mode = "n",
    key = "<leader>tF",
    action = function()
      require("neotest").run.run(vim.fn.expand("%"))
    end,
    description = "Run all tests in the current file",
  },
  {
    mode = "n",
    key = "<leader>tf",
    action = function()
      require("neotest").run.run()
    end,
    description = "Runs the nearest test (dap)",
  },
  {
    mode = "n",
    key = "<leader>dn",
    action = "<cmd>DapStepNext<CR>",
    description = "Debugger step to next line",
  },
  {
    mode = "n",
    key = "<leader>scs",
    action = function()
      require("telescope.builtin").colorscheme({ enable_preview = true })
    end,
    description = "Browse colorschemes",
  },
}

for _, value in ipairs(keymaps) do
  map(value.mode, value.key, value.action, { silent = true, noremap = true, desc = value.description })
end
