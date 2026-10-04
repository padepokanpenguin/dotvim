-- LSP setup using the native Neovim 0.11+ API.
-- `require('lspconfig')` as a "framework" is deprecated, so the servers are
-- declared in ./lsp/*.lua and enabled by mason-lspconfig.nvim
-- (see after/plugin/mason.rc.lua). Reference: :help lspconfig-nvim-0.11

-- Give every language server the nvim-cmp completion capabilities.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Buffer-local keymaps, applied whenever a client attaches.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(event)
    local function map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {
        buffer = event.buf,
        noremap = true,
        silent = true,
        desc = desc,
      })
    end

    map('gD', vim.lsp.buf.declaration, 'LSP: go to declaration')
    map('gi', vim.lsp.buf.implementation, 'LSP: go to implementation')
  end,
})

-- Diagnostics presentation (the old
-- vim.lsp.diagnostic.on_publish_diagnostics handler was removed upstream).
vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = { spacing = 4, prefix = '●' },
  float = { source = 'always' },
})

-- Diagnostic signs in the gutter.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Snyk is an account-gated security scanner: without a token the server only
-- reports "Auth initializer failed to authenticate" on every buffer. Start it
-- only when a token is available (mason-lspconfig excludes it from automatic
-- enable, see after/plugin/mason.rc.lua).
if vim.env.SNYK_TOKEN and vim.env.SNYK_TOKEN ~= '' then
  vim.lsp.enable('snyk_ls')
end
