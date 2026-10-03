-- Lua language server definition, loaded automatically by vim.lsp.enable('lua_ls').
-- See :help lspconfig-nvim-0.11 and https://luals.github.io/wiki/settings/
return {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global.
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files.
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
}
