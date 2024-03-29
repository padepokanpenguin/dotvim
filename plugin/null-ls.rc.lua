local status, null_ls = pcall(require, "null-ls")
if (not status) then
  return
end
local augroup_format = vim.api.nvim_create_augroup("Format", {
  clear = true
})

null_ls.setup()


--null_ls.setup({
--  sources = { null_ls.builtins.diagnostics.eslint_d.with({
--    diagnostics_format = '[eslint] #{m}\n(#{c})',
    -- ignore prettier warnings from eslint-plugin-prettier
--    filter = function(diagnostic)
--      return diagnostic.code ~= "prettier/prettier"
--    end
--
--
--  }), null_ls.builtins.formatting.prettier.with({
--    filetypes = { "html", "json", "yaml", "markdown", 'lua' },
--  }),
--    null_ls.builtins.diagnostics.eslint,
--    null_ls.builtins.diagnostics.jsonlint,
--    null_ls.builtins.diagnostics.stylelint,
--    null_ls.builtins.diagnostics.tsc,
    --null_ls.builtins.formatting.prettier,
--    null_ls.builtins.formatting.stylua,
--  },
--  on_attach = function(client, bufnr)
--    if client.server_capabilities.documentFormattingProvider then
--      vim.api.nvim_clear_autocmds {
--        buffer = 0,
--        group = augroup_format
--      }
--      vim.api.nvim_create_autocmd("BufWritePre", {
--        group = augroup_format,
--          buffer = 0,
--       callback = function()
--          
--       end
--      })
--    end
--  end
--})
