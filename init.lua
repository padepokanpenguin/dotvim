-- Entry point.
-- Order matters: editor options/keymaps first, then the plugin manager,
-- then the LSP wiring that depends on plugins being on the runtimepath.

require('base') -- editor options
require('maps') -- keymaps

-- Bootstrap lazy.nvim (plugin manager). Replaces packer.nvim, which is
-- archived upstream. See: https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { 'Failed to install lazy.nvim:\n' .. out, 'ErrorMsg' } }, true, {})
    return
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(require('plugins'), {
  checker = { enabled = false }, -- no update prompts
  change_detection = { notify = false },
  install = { colorscheme = { 'gruvbox' } },
})

-- LSP wiring (capabilities, LspAttach keymaps, diagnostics) lives in
-- plugin/lsp.rc.lua; per-server settings live in ./lsp/*.lua.
