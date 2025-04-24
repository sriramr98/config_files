vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true}) -- Disable the spacebar's default behaviour in Normal and Visual Mode
local opts = { noremap = true, silent = true }

local keymaps = {
  { mode = 'n', key = '<leader>sn', action = '<cmd>noautocmd w <CR>', description = 'save file without auto-formatting' },
  { mode = 'n', key = 'x', action = '"_x', description = 'delete single character without copying into register' },
  { mode = 'n', key = '<C-d>', action = '<C-d>zz', description = 'Easier scroll down a good chunk of text' },
  { mode = 'n', key = '<C-u>', action = '<C-u>zz', description = 'Easier scroll up a good chunk of text' },
  { mode = 'n', key = 'n', action = 'nzzzv', description = 'Find and center' },
  { mode = 'n', key = 'N', action = 'Nzzzv', description = '' },
  { mode = 'n', key = '<Up>', action = ':resize +2<CR>', description = 'Decrease current pane height with Up arrow' },
  { mode = 'n', key = '<Down>', action = ':resize -2<CR>', description = 'Increase current pane height with Down arrow' },
  { mode = 'n', key = '<Left>', action = ':vertical resize +2<CR>', description = 'Increase current pane width with Left arrow' },
  { mode = 'n', key = '<Right>', action = ':vertical resize -2<CR>', description = 'Decrease current pane widht with Right arrow' },
  { mode = 'n', key = '<Tab>', action = ':bnext<CR>', description = 'GoTo Next Buffer/Tab' },
  { mode = 'n', key = '<S-Tab>', action = ':bprevious<CR>', description = 'GoTo Previous Buffer/Tab' },
  { mode = 'n', key = '<leader>x', action = ':bdelete!<CR>', description = 'Delete current Buffer/Tab' },
  { mode = 'n', key = '<leader>b', action = '<cmd> enew <CR>', description = 'Create new buffer/tab' },
  { mode = 'n', key = '<leader>v', action = '<C-w>v', description = 'Create a vertical split' },
  { mode = 'n', key = '<leader>h', action = '<C-w>s', description = 'Create a horizontal split' },
  { mode = 'n', key = '<leader>se', action = '<C-w>=', description = 'Make splits into equal sizes' },
  { mode = 'n', key = '<leader>xs', action = ':close<CR>', description = 'Close a split' },
  { mode = 'n', key = '<C-k>', action = ':wincmd k<CR>', description = 'Move to the split above the current split' },
  { mode = 'n', key = '<C-j>', action = ':wincmd j<CR>', description = 'Move to the split below the current split' },
  { mode = 'n', key = '<C-h>', action = ':wincmd h<CR>', description = 'Move to the split left of the current split' },
  { mode = 'n', key = '<C-l>', action = ':wincmd l<CR>', description = 'Move to the split right to the current split' },
  { mode = 'n', key = '<leader>to', action = ':tabnew<CR>', description = 'Create new Tab' },
  { mode = 'n', key = '<leader>tx', action = ':tabclose<CR>', description = 'Close current tab' },
  { mode = 'n', key = '<leader>tn', action = ':tabn<CR>', description = 'GoTo next Tab' },
  { mode = 'n', key = '<leader>tp', action = ':tabp<CR>', description = 'GoTo previous Tab' },
  { mode = 'n', key = '<leader>lw', action = '<cmd>set wrap!<CR>', description = 'Toggle line wrapping' },
  { mode = 'v', key = '<', action = '<gv', description = 'Stay in indent mode' },
  { mode = 'v', key = '>', action = '>gv', description = 'Stay in indent mode' },
  { mode = 'v', key = 'p', action = '_dP', description = 'Keep last yanked when pasting' },
  { mode = 'n', key = '[d', action = vim.diagnostic.goto_prev, description = 'Diagnostic keymaps' },
  { mode = 'n', key = ']d', action = vim.diagnostic.goto_next, description = '' },
  { mode = 'n', key = '<leader>d', action = vim.diagnostic.open_float, description = '' },
  { mode = 'n', key = '<leader>q', action = vim.diagnostic.setloclist, description = '' },
}

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap.mode, keymap.key, keymap.action, opts)
end
