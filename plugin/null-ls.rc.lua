-- none-ls.nvim is the maintained fork of null-ls.nvim (archived upstream).
-- Note: only the repository name changed, the Lua module is still `null-ls`.
-- It also replaces the former prettier.nvim setup: formatting is delegated to
-- prettierd through none-ls' builtins.
local status, null_ls = pcall(require, "null-ls")
if (not status) then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = {
        'css',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'scss',
        'less',
      },
    }),
  },
})
