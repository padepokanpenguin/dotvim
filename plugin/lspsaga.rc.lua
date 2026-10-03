local status, saga = pcall(require, "lspsaga")
if (not status) then
  return
end

-- lspsaga v2 requires an explicit setup call.
require('lspsaga').setup({})

local opts = {
  noremap = true,
  silent = true
}
-- Subcommand names follow lspsaga v2 (see https://nvimdev.github.io/lspsaga/):
--   lsp_finder -> finder, preview_definition -> peek_definition,
--   signature_help was removed (use Neovim's built-in instead).
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
