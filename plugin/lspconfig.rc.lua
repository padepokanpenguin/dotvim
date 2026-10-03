--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
if ok_cmp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Some servers were renamed/removed in newer nvim-lspconfig releases.
-- lspconfig lazily loads server configs and emits a one-time deprecation
-- backtrace on first access; we silence only that access, then set up.
local function safe_setup(name, opts)
  local orig_deprecate = vim.deprecate
  vim.deprecate = function() end
  local ok, srv = pcall(function() return nvim_lsp[name] end)
  vim.deprecate = orig_deprecate
  if ok and srv then
    srv.setup(opts or {})
  else
    vim.schedule(function()
      vim.notify('lspconfig: server "' .. name .. '" unavailable, skipped',
        vim.log.levels.DEBUG)
    end)
  end
end

-- "flow" and "tsserver" were removed/renamed upstream (tsserver -> ts_ls).
--safe_setup('flow', {
--  on_attach = on_attach,
--  capabilities = capabilities
--})

--safe_setup('tsserver', {
--  on_attach = on_attach,
--  cmd = { "typescript-language-server", "--stdio" },
--  capabilities = capabilities
--})

safe_setup('ts_ls')
-- sourcekit only exists on macOS builds of lspconfig
--safe_setup('sourcekit', { on_attach = on_attach })
safe_setup('lua_ls', {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
})


--nvim_lsp.sumneko_lua.setup {}

safe_setup('tailwindcss')
-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
